# Amazon Virtual Private Cloud
https://docs.aws.amazon.com/vpc/latest/userguide/how-it-works.html

With Amazon Virtual Private Cloud (Amazon VPC), you can launch AWS resources in a logically isolated virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

The following diagram shows an example VPC. The VPC has one subnet in each of the Availability Zones in the Region, EC2 instances in each subnet, and an internet gateway to allow communication between the resources in your VPC and the internet.

![vpc](images/vpc.png)

The following features help you configure a VPC to provide the connectivity that your applications need:

### Virtual Private Clouds (VPC)
A VPC is a virtual network that closely resembles a traditional network that you'd operate in your own data center. After you create a VPC, you can add subnets.

### Subnets
A subnet is a range of IP addresses in your VPC. A subnet must reside in a single Availability Zone. After you add subnets, you can deploy AWS resources in your VPC.

### IP Addressing
You can assign IP addresses, both IPv4 and IPv6, to your VPCs and subnets. You can also bring your public IPv4 addresses and IPv6 GUA addresses to AWS and allocate them to resources in your VPC, such as EC2 instances, NAT gateways, and Network Load Balancers.

### Routing
Use route tables to determine where network traffic from your subnet or gateway is directed.

### Gateways and Endpoints
A gateway connects your VPC to another network. For example, use an internet gateway to connect your VPC to the internet. Use a VPC endpoint to connect to AWS services privately, without the use of an internet gateway or NAT device.

### Peering Connections
Use a VPC peering connection to route traffic between the resources in two VPCs.

### Traffic Mirroring
Copy network traffic from network interfaces and send it to security and monitoring appliances for deep packet inspection.

### Transit Gateways
Use a transit gateway, which acts as a central hub, to route traffic between your VPCs, VPN connections, and AWS Direct Connect connections.

### VPC Flow Logs
A flow log captures information about the IP traffic going to and from network interfaces in your VPC.

### VPN Connections
Connect your VPCs to your on-premises networks using AWS Virtual Private Network (AWS VPN).
