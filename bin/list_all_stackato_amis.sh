#!/bin/bash

AMI_NAME=${1:-Stackato-v3.4.2}
AWS_ACCOUNT=${2:-062663976825}

DIR=$(dirname $0)
if [ -n "$DIR" ] ; then
	SCRIPT=$DIR/list_all_amis_in_region_by_name.sh 
else
	SCRIPT=list_all_amis_in_region_by_name.sh 
fi
$SCRIPT $AMI_NAME $AWS_ACCOUNT
