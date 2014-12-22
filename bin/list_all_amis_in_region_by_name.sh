#!/bin/bash

USAGE="$(basename $0) ami-name AWS-account-number"

if [ $# -ne 2 ] ; then
	echo $USAGE >&2
	exit 2
fi
AMI_NAME=$1
AWS_ACCOUNT=$2

REGIONS="ap-northeast-1 ap-southeast-1 ap-southeast-2 eu-central-1 eu-west-1 sa-east-1 us-east-1 us-west-1 us-west-2"
for REGION in $REGIONS; do
	AMI_COUNT=0
	AMI_ID=""
	AMI_IDS=$(aws --region $REGION ec2 describe-images \
		--owners $AWS_ACCOUNT \
		--executable-users all \
		--filters Name=name,Values=$AMI_NAME 2>/dev/null | \
	jq  -r '.Images[] | .ImageId' )
	
	if [ -n "$AMI_IDS" ] ; then
		AMI_COUNT=$(echo "$AMI_IDS" | wc -l)
		for AMI_ID in "$AMI_IDS"; do
			echo "\"$REGION\"	\"$AMI_ID\""
		done
		[ $AMI_COUNT -gt 1 ] && echo WARN: multiple amis found $AMI_NAME in region $REGION >&2
	else
		echo WARN: ami with name $AMI_NAME not found in region $REGION >&2
	fi
done
