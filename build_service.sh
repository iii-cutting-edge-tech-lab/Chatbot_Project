#!/bin/bash
echo "Logging in to AWS ECR and pull images "
$(aws ecr get-login --no-include-email --region ap-northeast-1)
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
echo "download S3 cc102-csv data "
cd /home/ec2-user/Chatbot_Project
git submodule init
git submodule update
cd Chatbot_Dev/mysql_init/
aws s3 cp s3://cc102-csv/SA.csv ./
aws s3 cp s3://cc102-csv/SYS.csv ./
aws s3 cp s3://cc102-csv/Develope.csv ./

