#!/bin/bash

docker build -d dti-template -f Dockerfile.pm2 .
docker run -d -t --name dti-template -p 3000:3000 dti-template

