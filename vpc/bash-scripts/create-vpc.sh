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
echo " "

# Enable DNS support
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-support '{"Value":true}'

# Enable DNS hostnames
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames '{"Value":true}'

echo "== Creating IGW =="
IGW_ID=$(aws ec2 create-internet-gateway \
--query InternetGateway.InternetGatewayId \
--output text)
echo "Internet Gateway ID: $IGW_ID"
echo " "

echo "== Attaching IGW to VPC =="
aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
echo "VPC $VPC_NAME with ID $VPC_ID has been created and attached to Internet Gateway $IGW_ID."
echo " "

echo "== Creating Subnet =="
SUBNET_CIDR="172.1.0.0/20"
SUBNET_NAME="my-subnet-tc123"
SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET_CIDR \
--tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=$SUBNET_NAME}]" \
--query Subnet.SubnetId \
--output text)
echo "Subnet ID: $SUBNET_ID"
echo " "

echo "== Associating Route Table =="
ROUTE_TABLE_ID=$(aws ec2 describe-route-tables --filters Name=vpc-id,Values=$VPC_ID Name=association.main,Values=true \
--query 'RouteTables[0].RouteTableId' --output text)
aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $ROUTE_TABLE_ID
echo "Subnet $SUBNET_NAME with ID $SUBNET_ID created and associated with Route Table $ROUTE_TABLE_ID."

echo "== Adding route to Internet Gateway =="
aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
echo "Route added to Route Table $ROUTE_TABLE_ID to route traffic to Internet Gateway $IGW_ID."


# To execute
# ./create-vpc.sh "172.1.0.0/16" "my-vpc-tc123" "my-igw-tc123"
