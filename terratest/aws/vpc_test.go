package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVpcBasicExample(t *testing.T) {
	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../../examples/aws/vpc/basic",
	}

	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	vpcID := terraform.Output(t, opts, "vpc_id")
	publicSubnets := terraform.OutputList(t, opts, "public_subnet_ids")

	assert.NotEmpty(t, vpcID)
	assert.Len(t, publicSubnets, 2)
}