#!/bin/bash
echo "chown ~/Chatbot_Project"
sudo chown ec2-user.ec2-user /home/ec2-user/Chatbot_Project -Rf
cd /home/ec2-user/Chatbot_Project
git pull
git submodule init
git submodule update
echo "remove service container "
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
echo "re-tag image "
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:older
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:older
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:older
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:older
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:older
echo "remove image first "
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest

