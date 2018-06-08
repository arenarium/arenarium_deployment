#!/bin/bash
scp -i $KEYPATH deploy_key.pub ec2-user@$ARENARIUM_HOST:~
ssh -i $KEYPATH ec2-user@$ARENARIUM_HOST "ARENARIUM_USER=$ARENARIUM_USER bash -s" < install_tools.sh
scp -i deploy_key docker-compose* $ARENARIUM_USER@$ARENARIUM_HOST:~
ssh -i deploy_key $ARENARIUM_USER@$ARENARIUM_HOST 'bash -s' < init_db.sh
