.PHONY: eks vpc ec2 ecs all

# Run EKS terratest
eks:
	go test -v -timeout 30m ./aws/ -run TestEKSWithAWSVerification

# Run VPC terratest
vpc:
	go test -v -timeout 30m ./aws/ -run TestVpcBasicExample

# Run EC2 terratest
ec2:
	go test -v -timeout 30m ./aws/ -run TestEC2Basic

# Run ECS terratest
ecs:
	go test -v -timeout 30m ./aws/ -run TestECSLB
