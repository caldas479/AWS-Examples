#!/usr/bin/env bash

# Check if VPC ID is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <vpc-id>"
    exit 1
fi

VPC_ID=$1

# Validate VPC ID format
if [[ ! $VPC_ID =~ ^vpc-[0-9a-f]{8,17}$ ]]; then
    echo "Error: The VPC ID '$VPC_ID' is malformed. It should be in the format 'vpc-xxxxxxxx'."
    exit 1
fi

echo "== Deleting VPC: $VPC_ID =="

# Detach and delete all internet gateways attached to the VPC
echo "== Detaching and deleting internet gateways =="
IGW_IDS=$(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC_ID" --query "InternetGateways[*].InternetGatewayId" --output text)
for IGW_ID in $IGW_IDS; do
    echo "Detaching Internet Gateway $IGW_ID from VPC $VPC_ID"
    aws ec2 detach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
    echo "Deleting Internet Gateway $IGW_ID"
    aws ec2 delete-internet-gateway --internet-gateway-id $IGW_ID
done

# Delete all subnets in the VPC
echo "== Deleting subnets =="
SUBNET_IDS=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" --query "Subnets[*].SubnetId" --output text)
if [ -z "$SUBNET_IDS" ]; then
    echo "No Subnets found."
else
    for SUBNET_ID in $SUBNET_IDS; do
        echo "Deleting Subnet $SUBNET_ID"
        aws ec2 delete-subnet --subnet-id $SUBNET_ID
    done
fi

# Delete any route tables associated with the VPC
echo "== Deleting route tables =="
ROUTE_TABLE_IDS=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" --query "RouteTables[?Associations[0].Main!=true].RouteTableId" --output text)
if [ -z "$ROUTE_TABLE_IDS" ]; then
    echo "No Route Tables found."
else
    for ROUTE_TABLE_ID in $ROUTE_TABLE_IDS; do
        echo "Disassociating Route Table Association $ASSOCIATION_ID"
        aws ec2 disassociate-route-table --association-id $ASSOCIATION_ID
    
        echo "Deleting Route Table $ROUTE_TABLE_ID"
        aws ec2 delete-route-table --route-table-id $ROUTE_TABLE_ID
    done
fi

# Finally, delete the VPC
echo "== Deleting the VPC =="
aws ec2 delete-vpc --vpc-id $VPC_ID

echo "VPC $VPC_ID and its associated resources have been deleted."
