# Template of AWS Cross Region VPC-endpoint

## Background
This terraform project illustrates the AWS Cross Region VPC Interface endpoint (PrivateLink) implementation with VPC peering.

It referenced guideline from AWS:
https://docs.aws.amazon.com/vpc/latest/userguide/vpc-inter-region-peering-consumer-side.html

Main region = region of market data service hosted
Satellite region = region of data consumer located

### Architecture diagram
![architecture](./images/Architecture.png)

## MockProvider
A dummy HTTP SSE service streaming data at port 8194. <br>
This service is running on ECS fargate. <br>
It serves as a "MOCK" to check the vpc peering and vpc endpoint setup. <br>

### Configuration
It is maintained in "profilefargate.auto.tfvars". <br>

**Fargate Task docker image** <br>
docker image name of the dummy HTTP SSE service <br>
task_docker_image="192592784707.dkr.ecr.us-west-2.amazonaws.com/marketservice-sse:rc.java"

### Testing
We would use curl to test the connetion:
```
curl -X GET '<vpc end point dns name>:8194/blp/mktdata?token=JWT1&sessionId=sessionid1&mktdatacode=XAUUSD+Curncy&fields=BID&fields=ASK'
```

## ClientConsumer ###
Implement the AWS setup of AWS PrivateLink
### Configuration

**VPC Endpoint Service (PrivateLink) dns name**
DNS name of the VPC endpoint service (PrivateLink) for connection in main region
app_endpoint_svc_name="com.amazonaws.vpce.us-west-2.vpce-svc-09c04c40432fd9b4c"


### Reference
https://binx.io/blog/2020/06/17/creating-multiple-resources-at-once-with-terraform-for-each/