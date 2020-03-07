#!/bin/sh
docker rm -f ip
docker rmi ip
docker load -i ./ip.tar
docker run --name ip -d --restart always --network host ip