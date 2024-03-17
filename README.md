# Copy data from an S3 bucket to another account and Region by using the AWS CLI

This AWS pattern migrates objects from one Amazon S3 bucket in one AWS account to another bucket in a different account or region.

## Architecture

<TODO: Diagram>

- The source S3 bucket allows IAM access through an attached resource policy, typically a *S3 Bucket Policy*.
- In the target account, an IAM user needs to assume an IAM role granting *PutObject* permission for the target bucket and *GetObject* permission for the source bucket.
- Finally, execute copy or sync commands to transfer data from the source S3 bucket to the destination S3 bucket.

---

## Prerequisites

<TODO>

---

## Tasks

<TODO>

---

## Verification

<TODO>

---

## Clean up

<TODO>

---

## References

<TODO>

---
