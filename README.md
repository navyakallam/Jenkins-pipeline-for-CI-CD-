i# Jenkins CI/CD Pipeline Task
This repository contains a simple Node.js app with a Jenkins pipeline for CI/CD.

## Setup
- Jenkins runs on an AWS t2.medium instance.
- Docker builds and deploys the app.
- Pipeline triggers on each commit.

## Pipeline Stages
1. *Build*: Creates a Docker image.
2. *Test*: Placeholder for future tests.
3. *Deploy*: Runs the app in a Docker container on port 80.

## How to Test
- Push changes to this repo.
- Check Jenkins dashboard at <instance-ip>:8080.
- Access the app at http://<instance-ip>.
