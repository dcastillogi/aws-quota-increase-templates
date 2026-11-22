# AWS Directory Service

- **Service code:** `ds`
- **Console:** https://console.aws.amazon.com/servicequotas/home/services/ds/quotas

## List current quotas

```bash
aws service-quotas list-service-quotas --service-code ds \
  --query 'Quotas[].[QuotaCode,QuotaName,Value,Adjustable]' --output table
```

## Request an increase

```bash
aws service-quotas request-service-quota-increase \
  --service-code ds \
  --quota-code <QUOTA_CODE> \
  --desired-value <VALUE> \
  --region <REGION>
```

## Justification template

> For requests that go to manual review or are handled through a support case.

```text
Service: AWS Directory Service (ds)
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
```

## Commonly requested quotas

| Quota | Quota code | Notes |
|-------|------------|-------|
|       |            |       |
