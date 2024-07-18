# NACLS
A network access control list (ACL) act as a virtual firewall, thus allows or denies specific inbound or outbound traffic at the subnet level. You can use the default network ACL for your VPC, or you can create a custom network ACL for your VPC with rules that are similar to the rules for your security groups in order to add an additional layer of security to your VPC.

## Create nacl
Note that you need to create a vpc first.
```sh
aws ec2 create-network-acl --vpc-id vpc-02a03ed8fc00b5512
```