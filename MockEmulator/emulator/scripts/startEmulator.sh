#!/bin/sh
docker run --log-driver=awslogs \
--log-opt awslogs-region=us-east-1 \
--log-opt awslogs-group=/ec2/emulator \
--restart unless-stopped -dit -p 8194:8194 192592784707.dkr.ecr.us-east-1.amazonaws.com/websocket-bpipe-emulator:v0.alpine