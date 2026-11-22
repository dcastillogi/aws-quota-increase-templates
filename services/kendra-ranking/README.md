# Amazon Kendra Intelligent Ranking

- **Service code:** `kendra-ranking`
- **Consola:** https://console.aws.amazon.com/servicequotas/home/services/kendra-ranking/quotas

## Ver las cuotas actuales

```bash
aws service-quotas list-service-quotas --service-code kendra-ranking \
  --query 'Quotas[].[QuotaCode,QuotaName,Value,Adjustable]' --output table
```

## Pedir el aumento

```bash
aws service-quotas request-service-quota-increase \
  --service-code kendra-ranking \
  --quota-code <QUOTA_CODE> \
  --desired-value <VALOR> \
  --region <REGION>
```

## Plantilla de justificación

> Para cuotas que pasan a revisión manual o se piden por caso de soporte.

```text
Servicio: Amazon Kendra Intelligent Ranking (kendra-ranking)
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
