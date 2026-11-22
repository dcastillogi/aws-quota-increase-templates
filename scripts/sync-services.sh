#!/usr/bin/env bash
# Reads every service from Service Quotas and creates any missing folders.
# Requires valid AWS credentials.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
region="${AWS_REGION:-us-east-1}"
aws service-quotas list-services --region "$region" \
  --query 'Services[].[ServiceCode,ServiceName]' --output text |
while IFS=$'\t' read -r code name; do
  "$root/scripts/new-service.sh" "$code" "$name"
done
