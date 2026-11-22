#!/usr/bin/env bash
# Creates a service folder from the template.
# Usage: scripts/new-service.sh <service-code> "<Service name>"
set -euo pipefail
code="$1"; name="$2"
root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/services/$code"
[ -e "$dir/template.md" ] && { echo "already exists: $code"; exit 0; }
mkdir -p "$dir"
cat > "$dir/template.md" <<TPL
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
TPL
echo "created: $code"
