#!/usr/bin/env bash

# Check if CIDR block, VPC name, and IGW name are provided as arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <cidr-block> <vpc-name> <igw-name>"
    exit 1
fi

CIDR_BLOCK=$1
VPC_NAME=$2
IGW_NAME=$3

echo "== Creating VPC =="
VPC_ID=$(aws ec2 create-vpc --cidr-block "$CIDR_BLOCK" \
--region eu-west-1 \
--tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=$VPC_NAME}]" \
--query Vpc.VpcId \
--output text)
echo "VPC ID: $VPC_ID"

echo "== Creating IGW =="
IGW_ID=$(aws ec2 create-internet-gateway \
--query InternetGateway.InternetGatewayId \
--output text)
echo "Internet Gateway ID: $IGW_ID"

echo "== Attaching IGW to VPC =="
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
echo "VPC $VPC_NAME with ID $VPC_ID has been created and attached to Internet Gateway $IGW_ID."

# ./create-vpc.sh "172.1.0.0/16" "my-vpc-tc123" "my-igw-tc123"
