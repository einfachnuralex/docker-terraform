#!/bin/sh
cd /workspace/terraform-source && terraform init && terraform plan && terraform apply -auto-approve