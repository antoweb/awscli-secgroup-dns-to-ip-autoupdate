#!/bin/sh

GROUPID=<ID SECURITY GROUP>
PROTOCOL=tcp
PORT=22
PROFILE=<MY AWS CLI PROFILE>
DDNSNAME=<Specifi your fqdn for your dynamic dns name>

#Reading the old ip address
read oldip < /tmp/oldip

#Removing the old rule with old ip address
aws ec2 revoke-security-group-ingress --group-id $GROUPID --protocol $PROTOCOL --port $PORT --cidr $oldip/32 --profile $PROFILE

#Determinate the new ip address to allow
ip=$(ping -c1 -n "$DDNSNAME" | head -n1 | sed "s/.*(\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\)).*/\1/g")

#Insert the new ip in file
echo $ip > /tmp/oldip

#Adding new ip address in a new rule to security group
aws ec2 authorize-security-group-ingress --profile $PROFILE --group-id $GROUPID --protocol $PROTOCOL --port $PORT --cidr $ip/32

