#!/usr/bin/env bash
# Crea la carpeta de un servicio con su plantilla.
# Uso: scripts/new-service.sh <service-code> "<Nombre del servicio>"
set -euo pipefail
code="$1"; name="$2"
root="$(cd "$(dirname "$0")/.." && pwd)"
dir="$root/services/$code"
[ -e "$dir/README.md" ] && { echo "ya existe: $code"; exit 0; }
mkdir -p "$dir"
cat > "$dir/README.md" <<TPL
# $name

- **Service code:** \`$code\`
- **Consola:** https://console.aws.amazon.com/servicequotas/home/services/$code/quotas

## Ver las cuotas actuales

\`\`\`bash
aws service-quotas list-service-quotas --service-code $code \\
  --query 'Quotas[].[QuotaCode,QuotaName,Value,Adjustable]' --output table
\`\`\`

## Pedir el aumento

\`\`\`bash
aws service-quotas request-service-quota-increase \\
  --service-code $code \\
  --quota-code <QUOTA_CODE> \\
  --desired-value <VALOR> \\
  --region <REGION>
\`\`\`

## Plantilla de justificación

> Para cuotas que pasan a revisión manual o se piden por caso de soporte.

\`\`\`text
Servicio: $name ($code)
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
\`\`\`

## Cuotas que se suelen pedir

| Cuota | Quota code | Notas |
|-------|------------|-------|
|       |            |       |
TPL
echo "creado: $code"
