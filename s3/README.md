# AWS S3 Study Guide

## Overview

This repository contains various scripts and code examples to help you understand and interact with AWS S3 using different tools and languages. It includes Bash scripts, PowerShell scripts, SDK examples in Java and Ruby, and Infrastructure as Code (IaC) using AWS CloudFormation.

## Introduction to S3

Object Storage is a data storage architecture that manages data as objects, as opposed to other architectures.

- S3 provides *unlimited storage;
- serverless service;
- console provides an interface to upload and access data

S3 object -> objects that contain data, like files.  0 to 5Tbts in size.
It consists of:
- Key or objects name;
- Value that its the data;
- Version ID;
- Metadata as can attach additional info.

S3 bucket -> hold objects, can also have "folders". Their name must be unique as S3 is a universal namespace.

## S3 Bucket

### Naming Rules
- Length: 3-63 chars long.
- Chars: no uppercase, no underscores, no spaces.
- Start and end with letter or number.
- Can't be formatted as IP addresses.
- Can't start with "xn--", "sthree-" or "sthree-configurator".
- Can't end with "-s3alias" or "--ol-s3", reserved for ap alias names.
- Must be uniquea across all AWS accounts and AWS Regions within a partition.
- S3 Transfer accleration can't have dots in their names.

Examples

Valid:

```
mybucket-123
log-bucket
```

Invalid:

```
123.456.789.012
My-Bucket
data.bucket..archive
xn--bucketname
bucket_name
sthree-config-bucket
my-bucket-s3alias
```

### Restrictions and Limitations

- By default you can create 100 buckets, but you can create a service a request to increase to 1000 buckets.
- Need to empty bucket before deletion.
- Files between 0 and 5 TBs. Larger than 100MB should use multi-part upload.
- Get, Put, List, Delete designed for high availability.

### Types

AWS S3 has two types of buckets.

1. General pupose buckets:
   - Organizes data in a flat hierarchy;
   - Original S3 type;
   - Recommended for most cases;
   - Used with all storage classes except S3 Express One Zone;
   - No prefix limits;
   - Limit of 100 per account.

2. Directory buckets:
   - Organizes data in a folder hierarchy;
   - Only used with S3 Express One Zone;
   - Recommended when you need single-digit milisec performance on PUT and GET;
   - Individual directories can scale horizontally;
   - No prefix limits;
   - Limit 10 directory buckets per account.
  
## Bash Scripting

Bash scripts are powerful tools for automating repetitive tasks in Unix-based systems. In this folder, you'll find scripts to manage S3 buckets and objects using the AWS CLI.

- `create-bucket`: Script to create a new S3 bucket.
- `delete-bucket`: Script to delete an existing S3 bucket.
- `delete-objects`: Script to delete objects within a specified S3 bucket.
- `get-newest-bucket`: Script to retrieve the most recently created S3 bucket.
- `list-buckets`: Script to list all S3 buckets in your account.
- `list-objects`: Script to list all objects within a specified S3 bucket.
- `put-object`: Script to upload an object to a specified S3 bucket.
- `sync`: Script to sync files between a local directory and an S3 bucket.

## PowerShell Scripting

PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language. In this folder, you'll find a script to interact with S3 using PowerShell.

- `create-bucket-with-file.ps1`: Script to create a new S3 bucket and upload a file to it using the AWS Tools for PowerShell.

## SDK (Software Development Kit)

AWS SDKs simplify using AWS services in your applications with an API tailored to your programming language or platform. This section includes examples in Java and Ruby.

### Java

- `myapp/pom.xml`: Maven configuration file for managing dependencies.
- `myapp/src/main/java/com/example/myapp/App.java`: Main application code to interact with S3.
- `myapp/src/main/java/com/example/myapp/DependencyFactory.java`: Class for managing dependencies.
- `myapp/src/test/java/com/example/myapp/AppTest.java`: Test cases for the application.
- `template.yaml`: AWS CloudFormation template to deploy the Java application.

### Ruby

- `Gemfile`: Ruby dependencies file.
- `Gemfile.lock`: Lock file for Ruby dependencies.
- `s3.rb`: Script to interact with S3 using the AWS SDK for Ruby.

## IaC (Infrastructure as Code)

Infrastructure as Code (IaC) is the process of managing and provisioning computing infrastructure through machine-readable definition files. 

### CloudFormation

This folder contains CloudFormation scripts. AWS CloudFormation is a service that allows you to define and provision AWS infrastructure resources in a predictable and repeatable manner. Using CloudFormation, you can create templates that describe all the AWS resources needed for your application (such as EC2 instances, S3 buckets, IAM roles, and more) and deploy those resources together as a single unit, known as a stack.

- `delete-stack`: Script to delete a CloudFormation stack.
- `deploy`: Script to deploy a CloudFormation stack.
- `template.yaml`: CloudFormation template defining S3 resources to be created.

### Terraform

Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define and provision infrastructure using a high-level configuration language called HashiCorp Configuration Language (HCL) or JSON. Terraform is cloud-agnostic, enabling you to manage infrastructure across multiple cloud providers and services.

In this folder, you will find Terraform scripts to manage S3 resources:

- `main.tf`: configures the Terraform provider and creates a VPC.
- `s3.tf`: defines the S3 bucket resource.

### Cloud Development Kit

The AWS Cloud Development Kit (AWS CDK) is an open-source software development framework for defining cloud infrastructure in code and provisioning it through AWS CloudFormation.

The AWS CDK consists of two primary parts:

- AWS CDK Construct Library – A collection of pre-written modular and reusable pieces of code, called constructs, that you can use, modify, and integrate to develop your infrastructure quickly. The goal of the AWS CDK Construct Library is to reduce the complexity required to define and integrate AWS services together when building applications on AWS.

- AWS CDK Toolkit – A command line tool for interacting with CDK apps. Use the AWS CDK Toolkit to create, manage, and deploy your AWS CDK projects.

### Pulumi

Pulumi is an infrastructure as code platform that allows you to use familiar programming languages and tools to build, deploy, and manage cloud infrastructure.

Pulumi is free, open source, and optionally pairs with the Pulumi Cloud to make managing infrastructure secure, reliable, and hassle-free.

---

Feel free to explore each folder and file to get a deeper understanding of how to interact with AWS S3 using different tools and languages. Happy learning!
