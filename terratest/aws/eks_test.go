package test

import (
	"fmt"
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/eks"
	"github.com/gruntwork-io/terratest/modules/shell"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEKSWithAWSVerification(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/aws/eks/terratest",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// Track test results
	results := map[string]string{}

	// 1. Verify Terraform outputs are not empty
	clusterName := terraform.Output(t, terraformOptions, "cluster_name")
	clusterEndpoint := terraform.Output(t, terraformOptions, "cluster_endpoint")
	oidcIssuerURL := terraform.Output(t, terraformOptions, "oidc_issuer_url")

	t.Log("Checking Terraform outputs are not empty...")
	if assert.NotEmpty(t, clusterName, "Cluster name should not be empty") &&
		assert.NotEmpty(t, clusterEndpoint, "Cluster endpoint should not be empty") &&
		assert.NotEmpty(t, oidcIssuerURL, "OIDC issuer URL should not be empty") {
		results["Terraform outputs"] = "PASS"
		t.Log("✅ Terraform outputs validated")
	} else {
		results["Terraform outputs"] = "FAIL"
		t.Log("❌ Terraform outputs validation failed")
	}

	// 2. Verify cluster exists and is ACTIVE via AWS API
	awsRegion := "eu-west-2"
	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(awsRegion),
	})
	assert.NoError(t, err, "Should be able to create AWS session")
	eksClient := eks.New(sess)

	t.Log("Checking EKS cluster is ACTIVE...")
	clusterOutput, err := eksClient.DescribeCluster(&eks.DescribeClusterInput{
		Name: aws.String(clusterName),
	})
	if assert.NoError(t, err, "Should be able to describe EKS cluster") &&
		assert.Equal(t, "ACTIVE", *clusterOutput.Cluster.Status, "Cluster should be in ACTIVE state") {
		results["EKS cluster ACTIVE"] = "PASS"
		t.Log("✅ EKS cluster is ACTIVE")
	} else {
		results["EKS cluster ACTIVE"] = "FAIL"
		t.Log("❌ EKS cluster check failed")
	}

	// 3. Verify Kubernetes connectivity - update kubeconfig and get pods
	t.Log("Testing Kubernetes connectivity...")

	shell.RunCommand(t, shell.Command{
		Command: "aws",
		Args:    []string{"eks", "update-kubeconfig", "--name", clusterName, "--region", awsRegion},
	})
	t.Log("✅ Kubeconfig updated successfully")

	output := shell.RunCommandAndGetOutput(t, shell.Command{
		Command: "kubectl",
		Args:    []string{"get", "pods", "-A"},
	})
	if output != "" {
		results["Kubernetes connectivity"] = "PASS"
		t.Log("✅ kubectl get pods succeeded")
		t.Log(fmt.Sprintf("Pods running:\n%s", output))
	} else {
		results["Kubernetes connectivity"] = "FAIL"
		t.Log("❌ kubectl get pods failed")
	}

	// Print test summary
	t.Log("\n============================")
	t.Log("       TEST SUMMARY")
	t.Log("============================")
	passed := 0
	failed := 0
	for name, result := range results {
		if result == "PASS" {
			t.Log(fmt.Sprintf("  ✅ %s: %s", name, result))
			passed++
		} else {
			t.Log(fmt.Sprintf("  ❌ %s: %s", name, result))
			failed++
		}
	}
	t.Log("----------------------------")
	t.Log(fmt.Sprintf("  Total: %d | Passed: %d | Failed: %d", passed+failed, passed, failed))
	t.Log("============================")
}
