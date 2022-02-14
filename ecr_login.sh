#!/bin/bash

set -e;

if [ -z "$ID" ] 
    then echo "Account id is empty, please specify account id"
    exit 1;
fi
aws ecr get-login-password --region ${REGION:-eu-west-1} | docker login --username AWS --password-stdin $ID.dkr.ecr.${REGION:-eu-west-1}.amazonaws.com;