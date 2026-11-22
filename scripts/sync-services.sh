#!/usr/bin/env bash
# Lee de Service Quotas todos los servicios disponibles y crea las carpetas que falten.
# Requiere credenciales AWS válidas.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
region="${AWS_REGION:-us-east-1}"
aws service-quotas list-services --region "$region" \
  --query 'Services[].[ServiceCode,ServiceName]' --output text |
while IFS=$'\t' read -r code name; do
  "$root/scripts/new-service.sh" "$code" "$name"
done
