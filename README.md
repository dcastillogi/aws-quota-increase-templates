# aws-quota-increase-templates

Templates for requesting AWS Service Quotas increases: one folder per service, each holding a ready-to-fill justification template for when the request goes to manual review or a support case.

## Layout

```
services/<service-code>/template.md   # justification template for that service
scripts/new-service.sh              # creates a service folder
scripts/sync-services.sh            # creates missing folders from Service Quotas
```

Each folder is named after its Service Quotas `service-code`, the value you pass to `--service-code` in the CLI.

## How to request an increase

1. Find the quota code:
   ```bash
   aws service-quotas list-service-quotas --service-code ec2 \
     --query 'Quotas[?Adjustable].[QuotaCode,QuotaName,Value]' --output table
   ```
2. Request the increase:
   ```bash
   aws service-quotas request-service-quota-increase \
     --service-code ec2 --quota-code L-1216C47A --desired-value 256 --region us-east-1
   ```
3. Check the status:
   ```bash
   aws service-quotas list-requested-service-quota-change-history --service-code ec2
   ```
4. If AWS asks for more context, fill in `services/<service-code>/template.md` and paste it into the support case.

## Tips for faster approval

- Ask for a specific value and show how you got it (not "as much as possible").
- Say when you need it and whether a launch depends on it.
- Request it in the exact region you'll deploy to; quotas are per region.
- Show current usage close to the limit when it applies.
- Large increases on new accounts take longer, so ask early.

## Keeping the service list up to date

With active AWS credentials (the current list was pulled from `us-east-1`):

```bash
AWS_PROFILE=<profile> ./scripts/sync-services.sh
```

To add one by hand:

```bash
./scripts/new-service.sh <service-code> "<Service name>"
```