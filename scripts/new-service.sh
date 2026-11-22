#!/usr/bin/env bash
# Creates a service folder from the template.
# Usage: scripts/new-service.sh <service-code> "<Service name>"
set -euo pipefail
code="$1"; name="$2"
root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/services/$code"
[ -e "$dir/README.md" ] && { echo "already exists: $code"; exit 0; }
mkdir -p "$dir"
cat > "$dir/README.md" <<TPL
# $name

- **Service code:** \`$code\`
- **Console:** https://console.aws.amazon.com/servicequotas/home/services/$code/quotas

## List current quotas

\`\`\`bash
aws service-quotas list-service-quotas --service-code $code \\
  --query 'Quotas[].[QuotaCode,QuotaName,Value,Adjustable]' --output table
\`\`\`

## Request an increase

\`\`\`bash
aws service-quotas request-service-quota-increase \\
  --service-code $code \\
  --quota-code <QUOTA_CODE> \\
  --desired-value <VALUE> \\
  --region <REGION>
\`\`\`

## Justification template

> For requests that go to manual review or are handled through a support case.

\`\`\`text
Service: $name ($code)
Quota: <quota name> (<QUOTA_CODE>)
Region: <region>
Current value: <current value>
Requested value: <requested value>

Use case:
<What the workload is and why it needs this service.>

Why this value:
<Calculation: expected traffic/users/resources -> resources needed, plus headroom.>

Needed by:
<date, and any launch or event tied to it>

Current usage and trend:
<Current usage vs. the limit, expected growth.>
\`\`\`

## Commonly requested quotas

| Quota | Quota code | Notes |
|-------|------------|-------|
|       |            |       |
TPL
echo "created: $code"
