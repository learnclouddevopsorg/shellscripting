#!/bin/bash
########

# 
# MetaData
#
# Author: Bharanikumaar
# Purpose: To montior and report aws resource usage.
# Date: 10-5-22
# version: V1
#
#
#
########
#
#The resource we are going to track here is, 
# 
# aws s3, aws ec2, IAM Users, aws lambda
#
########
#
#set -x =>To run the script in Debugmode which is, it will give the output with Commands.
#set -e =>To exit the script, if there's an error in the script.
#set -o pipefail =>To exit the script, if there's an pipe failure.
#
########

set -exo pipefail

# list s3 buckets

aws s3 ls > resource_tracker.txt


# list ec2 instances

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resource_tracker.txt

#aws ec2 describe-instance-status


# list aws lambda funtions

aws lambda list-functions >> resource_tracker.txt


# list IAM Users

aws iam list-users >> resource_tracker.txt

########