# Amazon S3 Storage Classes

## Introduction

Amazon S3 provides various storage classes designed to help you optimize costs and performance based on data access patterns and retention requirements. This document explains the different S3 storage classes and how to choose the best one for your needs.

## Overview of S3 Storage Classes

Each S3 storage class is designed to address different storage needs. They differ in terms of cost, availability, durability, and retrieval times. Understanding these differences helps in selecting the most appropriate storage class for your data.

## Storage Classes

### S3 Standard

- **Description**: The default storage class for frequently accessed data.
- **Durability**: 99.999999999% (11 9's) durability.
- **Availability**: 99.99% availability over a given year.
- **Use Case**: Frequently accessed data, low latency, and high throughput needs.
- **Cost**: Higher storage cost, lower retrieval cost.

### S3 Intelligent-Tiering

- **Description**: Automatically moves data between two access tiers (frequent and infrequent) based on changing access patterns.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.9% availability.
- **Use Case**: Unknown or unpredictable access patterns, cost optimization.
- **Cost**: Monitoring and automation fee in addition to storage and retrieval costs.

### S3 Express One Zone

- **Description**: For data that is accessed frequently but stored in a single Availability Zone. 10xfaster than standard.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.5% availability.
- **Use Case**: Frequently accessed data that does not require the availability and resilience of S3 Standard but still needs rapid access.
- **Cost**: Lower storage cost compared to S3 Standard, suitable for data that can be easily recreated if lost.

### S3 Standard-IA (Infrequent Access)

- **Description**: For data that is accessed less frequently but requires rapid access when needed.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.9% availability.
- **Use Case**: Long-term storage, backups, disaster recovery.
- **Cost**: Lower storage cost, higher retrieval cost compared to S3 Standard.

### S3 One Zone-IA

- **Description**: For infrequently accessed data stored in a single Availability Zone.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.5% availability.
- **Use Case**: Data that can be easily recreated if lost, lower-cost infrequent access.
- **Cost**: Lower storage cost compared to S3 Standard-IA, higher retrieval cost.

### S3 Glacier Instant Retrieval

- **Description**: For archival data that needs immediate access.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.9% availability.
- **Use Case**: Long-term archives, compliance archives with immediate access needs.
- **Cost**: Very low storage cost, higher retrieval cost compared to S3 Standard.

### S3 Glacier Flexible Retrieval

- **Description**: For archival data that is rarely accessed and has flexible retrieval times.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.9% availability.
- **Use Case**: Long-term archives, backups with flexible access needs.
- **Cost**: Very low storage cost, variable retrieval cost depending on retrieval speed.

### S3 Glacier Deep Archive

- **Description**: For data that is rarely accessed and requires the lowest storage cost.
- **Durability**: 99.999999999% durability.
- **Availability**: 99.9% availability.
- **Use Case**: Long-term data retention, digital preservation, compliance archives.
- **Cost**: Lowest storage cost, high retrieval cost, and long retrieval times (hours).

### Example Scenarios:
- **Frequently Accessed Data**: Use S3 Standard.
- **Unpredictable Access Patterns**: Use S3 Intelligent-Tiering.
- **Infrequently Accessed Data**: Use S3 Standard-IA or S3 One Zone-IA.
- **Frequently Accessed Data in a Single Availability Zone**: Use S3 Express One Zone.
- **Long-term Archival with Immediate Access**: Use S3 Glacier Instant Retrieval.
- **Long-term Archival with Flexible Access**: Use S3 Glacier Flexible Retrieval.
- **Long-term Archival with Rare Access**: Use S3 Glacier Deep Archive.
