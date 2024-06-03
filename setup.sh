#!/bin/bash

echo "Setting up Ceph demo environment via setup.sh"

# start the docker service and deamon
apt-get update
apt-get install -y docker.io
apt-get install -y awscli
dockerd &

echo "Docker service started, waiting for it to be ready"

sleep 3

# Login to container registry
docker login -u= -p=

echo "Logged into container registry"

# Run the Ceph demo container
docker run -d --name demo --net host \
-e MON_IP=${MON_IP} \
-e CEPH_PUBLIC_NETWORK=${CEPH_PUBLIC_NETWORK} \
-e CEPH_DEMO_UID=${CEPH_DEMO_UID} \
-e CEPH_DEMO_ACCESS_KEY=${CEPH_DEMO_ACCESS_KEY} \
-e CEPH_DEMO_SECRET_KEY=${CEPH_DEMO_SECRET_KEY} \
registry.redhat.io/rhceph/rhceph-4-rhel8 demo

docker ps

echo "Ceph demo container started"

# Wait for the Ceph demo container to be ready
sleep 20

#echo "Ceph demo container ready, checking status"

# Check Ceph status
#docker exec -it demo ceph status


echo "Ceph demo environment setup complete"
echo "Starting S3 demo"

# Configure AWS CLI
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}

# Create an S3 bucket and upload a file
aws s3 mb s3://test --endpoint-url http://192.168.0.2:8080
aws s3 cp /etc/hosts s3://test --endpoint-url http://192.168.0.2:8080

# List the contents of the S3 bucket
aws s3 ls s3://test --endpoint-url http://192.168.0.2:8080

# Create Flask Container
cd /usr/local/bin/app
docker build -t flaskcedi .
docker image ls
docker run -p 5000:5000 flaskcedi


# Run a loop to keep the container running
tail -f /dev/null

