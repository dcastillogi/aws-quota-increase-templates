# Route 53 Profiles

- **Service code:** `route53profiles`
- **Consola:** https://console.aws.amazon.com/servicequotas/home/services/route53profiles/quotas

## Ver las cuotas actuales

```bash
aws service-quotas list-service-quotas --service-code route53profiles \
  --query 'Quotas[].[QuotaCode,QuotaName,Value,Adjustable]' --output table
```

## Pedir el aumento

```bash
aws service-quotas request-service-quota-increase \
  --service-code route53profiles \
  --quota-code <QUOTA_CODE> \
  --desired-value <VALOR> \
  --region <REGION>
```

## Plantilla de justificación

> Para cuotas que pasan a revisión manual o se piden por caso de soporte.

```text
Servicio: Route 53 Profiles (route53profiles)
Cuota: <nombre de la cuota> (<QUOTA_CODE>)
Región: <región>
Valor actual: <valor actual>
Valor solicitado: <valor solicitado>

Caso de uso:
<Qué es la carga de trabajo y por qué necesita este servicio.>

Por qué el valor solicitado:
<Cálculo: tráfico/usuarios/recursos esperados -> recursos necesarios, con margen.>

Fecha en que se necesita:
<fecha, y si hay un lanzamiento o evento asociado>

Uso actual y tendencia:
<Uso actual frente al límite, crecimiento esperado.>
```

## Cuotas que se suelen pedir

| Cuota | Quota code | Notas |
|-------|------------|-------|
|       |            |       |
