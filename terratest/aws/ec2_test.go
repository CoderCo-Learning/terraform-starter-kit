package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEC2Basic(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../examples/aws/ec2/test-basic",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	instanceID := terraform.Output(t, terraformOptions, "instance_id")
	publicIP := terraform.Output(t, terraformOptions, "public_ip")

	assert.NotEmpty(t, instanceID)
	assert.NotEmpty(t, publicIP)
}
