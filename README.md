# aws-quota-increase-templates

Plantillas para pedir aumentos de cuota (Service Quotas) en AWS: una carpeta por servicio, con los comandos para consultar las cuotas actuales, pedir el aumento y una plantilla de justificación para cuando la solicitud pasa a revisión manual.

## Estructura

```
services/<service-code>/README.md   # plantilla por servicio
scripts/new-service.sh              # crea la carpeta de un servicio
scripts/sync-services.sh            # crea las carpetas que falten leyendo Service Quotas
```

Cada carpeta se llama igual que el `service-code` de Service Quotas, que es el valor que se pasa a `--service-code` en la CLI.

## Cómo pedir un aumento

1. Busca el código de la cuota:
   ```bash
   aws service-quotas list-service-quotas --service-code ec2 \
     --query 'Quotas[?Adjustable].[QuotaCode,QuotaName,Value]' --output table
   ```
2. Pide el aumento:
   ```bash
   aws service-quotas request-service-quota-increase \
     --service-code ec2 --quota-code L-1216C47A --desired-value 256 --region us-east-1
   ```
3. Revisa el estado:
   ```bash
   aws service-quotas list-requested-service-quota-change-history --service-code ec2
   ```
4. Si AWS pide más contexto, responde el caso de soporte con la plantilla de justificación del servicio.

## Consejos para que lo aprueben rápido

- Pide un valor concreto y explica el cálculo (no "lo máximo posible").
- Indica la fecha en que lo necesitas y si hay un lanzamiento asociado.
- Pide en la región exacta donde vas a desplegar; las cuotas son por región.
- Muestra uso actual cercano al límite cuando aplique.
- En cuentas nuevas, los aumentos grandes suelen tardar más: pide con tiempo.

## Mantener la lista de servicios al día

Con credenciales AWS activas:

```bash
./scripts/sync-services.sh
```

Para añadir uno a mano:

```bash
./scripts/new-service.sh <service-code> "<Nombre del servicio>"
```

## Servicios

| Servicio | Service code |
|----------|--------------|
| [IAM Access Analyzer](services/access-analyzer/) | `access-analyzer` |
| [AWS Certificate Manager](services/acm/) | `acm` |
| [AWS Private Certificate Authority](services/acm-pca/) | `acm-pca` |
| [Amazon MWAA (Managed Workflows for Apache Airflow)](services/airflow/) | `airflow` |
| [AWS Amplify](services/amplify/) | `amplify` |
| [Amazon API Gateway](services/apigateway/) | `apigateway` |
| [AWS AppConfig](services/appconfig/) | `appconfig` |
| [Amazon AppFlow](services/appflow/) | `appflow` |
| [Application Auto Scaling](services/application-autoscaling/) | `application-autoscaling` |
| [AWS App Runner](services/apprunner/) | `apprunner` |
| [Amazon AppStream 2.0](services/appstream2/) | `appstream2` |
| [AWS AppSync](services/appsync/) | `appsync` |
| [Amazon Athena](services/athena/) | `athena` |
| [Amazon EC2 Auto Scaling](services/autoscaling/) | `autoscaling` |
| [AWS Backup](services/backup/) | `backup` |
| [AWS Batch](services/batch/) | `batch` |
| [Amazon Bedrock](services/bedrock/) | `bedrock` |
| [Amazon Braket](services/braket/) | `braket` |
| [Amazon Keyspaces](services/cassandra/) | `cassandra` |
| [AWS CloudFormation](services/cloudformation/) | `cloudformation` |
| [Amazon CloudFront](services/cloudfront/) | `cloudfront` |
| [AWS CloudHSM](services/cloudhsm/) | `cloudhsm` |
| [AWS CloudTrail](services/cloudtrail/) | `cloudtrail` |
| [AWS CodeBuild](services/codebuild/) | `codebuild` |
| [AWS CodeCommit](services/codecommit/) | `codecommit` |
| [AWS CodeDeploy](services/codedeploy/) | `codedeploy` |
| [AWS CodePipeline](services/codepipeline/) | `codepipeline` |
| [Amazon Cognito Identity Pools](services/cognito-identity/) | `cognito-identity` |
| [Amazon Cognito User Pools](services/cognito-idp/) | `cognito-idp` |
| [Amazon Comprehend](services/comprehend/) | `comprehend` |
| [AWS Config](services/config/) | `config` |
| [Amazon Connect](services/connect/) | `connect` |
| [AWS DataSync](services/datasync/) | `datasync` |
| [Amazon DynamoDB Accelerator (DAX)](services/dax/) | `dax` |
| [AWS Database Migration Service](services/dms/) | `dms` |
| [AWS Directory Service](services/ds/) | `ds` |
| [Amazon DynamoDB](services/dynamodb/) | `dynamodb` |
| [Amazon Elastic Block Store (EBS)](services/ebs/) | `ebs` |
| [Amazon Elastic Compute Cloud (EC2)](services/ec2/) | `ec2` |
| [Amazon Elastic Container Registry](services/ecr/) | `ecr` |
| [Amazon Elastic Container Service](services/ecs/) | `ecs` |
| [Amazon Elastic Kubernetes Service](services/eks/) | `eks` |
| [Amazon ElastiCache](services/elasticache/) | `elasticache` |
| [AWS Elastic Beanstalk](services/elasticbeanstalk/) | `elasticbeanstalk` |
| [Amazon Elastic File System (EFS)](services/elasticfilesystem/) | `elasticfilesystem` |
| [Elastic Load Balancing](services/elasticloadbalancing/) | `elasticloadbalancing` |
| [Amazon EMR](services/elasticmapreduce/) | `elasticmapreduce` |
| [Amazon EMR Serverless](services/emr-serverless/) | `emr-serverless` |
| [Amazon OpenSearch Service](services/es/) | `es` |
| [Amazon EventBridge](services/events/) | `events` |
| [Amazon Data Firehose](services/firehose/) | `firehose` |
| [Amazon FSx](services/fsx/) | `fsx` |
| [Amazon GameLift](services/gamelift/) | `gamelift` |
| [AWS Glue](services/glue/) | `glue` |
| [Amazon Managed Grafana](services/grafana/) | `grafana` |
| [AWS IoT Greengrass](services/greengrass/) | `greengrass` |
| [Amazon GuardDuty](services/guardduty/) | `guardduty` |
| [AWS Identity and Access Management (IAM)](services/iam/) | `iam` |
| [EC2 Image Builder](services/imagebuilder/) | `imagebuilder` |
| [Amazon Inspector](services/inspector2/) | `inspector2` |
| [AWS IoT Core](services/iot/) | `iot` |
| [Amazon Interactive Video Service](services/ivs/) | `ivs` |
| [Amazon MSK](services/kafka/) | `kafka` |
| [Amazon Kendra](services/kendra/) | `kendra` |
| [Amazon Kinesis Data Streams](services/kinesis/) | `kinesis` |
| [Amazon Kinesis Video Streams](services/kinesisvideo/) | `kinesisvideo` |
| [AWS Key Management Service](services/kms/) | `kms` |
| [AWS Lake Formation](services/lakeformation/) | `lakeformation` |
| [AWS Lambda](services/lambda/) | `lambda` |
| [Amazon Lex](services/lex/) | `lex` |
| [Amazon Lightsail](services/lightsail/) | `lightsail` |
| [Amazon CloudWatch Logs](services/logs/) | `logs` |
| [AWS Mainframe Modernization](services/m2/) | `m2` |
| [Amazon Macie](services/macie2/) | `macie2` |
| [AWS Elemental MediaConnect](services/mediaconnect/) | `mediaconnect` |
| [AWS Elemental MediaLive](services/medialive/) | `medialive` |
| [AWS Elemental MediaPackage](services/mediapackage/) | `mediapackage` |
| [Amazon MemoryDB](services/memorydb/) | `memorydb` |
| [AWS Application Migration Service](services/mgn/) | `mgn` |
| [Amazon Pinpoint](services/mobiletargeting/) | `mobiletargeting` |
| [Amazon CloudWatch](services/monitoring/) | `monitoring` |
| [AWS Network Firewall](services/network-firewall/) | `network-firewall` |
| [AWS Organizations](services/organizations/) | `organizations` |
| [AWS Outposts](services/outposts/) | `outposts` |
| [Amazon Personalize](services/personalize/) | `personalize` |
| [Amazon Polly](services/polly/) | `polly` |
| [Amazon QuickSight](services/quicksight/) | `quicksight` |
| [AWS Resource Access Manager](services/ram/) | `ram` |
| [Amazon Relational Database Service (RDS)](services/rds/) | `rds` |
| [Amazon Redshift](services/redshift/) | `redshift` |
| [Amazon Redshift Serverless](services/redshift-serverless/) | `redshift-serverless` |
| [Amazon Rekognition](services/rekognition/) | `rekognition` |
| [Amazon Route 53](services/route53/) | `route53` |
| [Amazon Route 53 Resolver](services/route53resolver/) | `route53resolver` |
| [Amazon Simple Storage Service (S3)](services/s3/) | `s3` |
| [Amazon SageMaker](services/sagemaker/) | `sagemaker` |
| [AWS Secrets Manager](services/secretsmanager/) | `secretsmanager` |
| [AWS Security Hub](services/securityhub/) | `securityhub` |
| [AWS Service Catalog](services/servicecatalog/) | `servicecatalog` |
| [AWS Cloud Map](services/servicediscovery/) | `servicediscovery` |
| [Amazon Simple Email Service (SES)](services/ses/) | `ses` |
| [AWS Shield](services/shield/) | `shield` |
| [Amazon Simple Notification Service (SNS)](services/sns/) | `sns` |
| [Amazon Simple Queue Service (SQS)](services/sqs/) | `sqs` |
| [AWS Systems Manager](services/ssm/) | `ssm` |
| [AWS IAM Identity Center](services/sso/) | `sso` |
| [AWS Step Functions](services/states/) | `states` |
| [AWS Storage Gateway](services/storagegateway/) | `storagegateway` |
| [Amazon Textract](services/textract/) | `textract` |
| [Amazon Timestream](services/timestream/) | `timestream` |
| [Amazon Transcribe](services/transcribe/) | `transcribe` |
| [AWS Transfer Family](services/transfer/) | `transfer` |
| [Amazon Translate](services/translate/) | `translate` |
| [Amazon Virtual Private Cloud (VPC)](services/vpc/) | `vpc` |
| [AWS WAF](services/wafv2/) | `wafv2` |
| [Amazon WorkSpaces](services/workspaces/) | `workspaces` |
| [AWS X-Ray](services/xray/) | `xray` |
