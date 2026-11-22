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

Con credenciales AWS activas (la lista se sacó de `us-east-1`):

```bash
AWS_PROFILE=<perfil> ./scripts/sync-services.sh
```

Para añadir uno a mano:

```bash
./scripts/new-service.sh <service-code> "<Nombre del servicio>"
```

## Servicios

| Servicio | Service code |
|----------|--------------|
| [Access Analyzer](services/access-analyzer/) | `access-analyzer` |
| [Account access manager](services/account-access/) | `account-access` |
| [Amazon AI Operations](services/aiops/) | `aiops` |
| [Amazon API Gateway](services/apigateway/) | `apigateway` |
| [Amazon AppFlow](services/appflow/) | `appflow` |
| [Amazon Application Recovery Controller Region Switch](services/arc-region-switch/) | `arc-region-switch` |
| [Amazon Athena](services/athena/) | `athena` |
| [Amazon Aurora DSQL](services/dsql/) | `dsql` |
| [Amazon Bedrock](services/bedrock/) | `bedrock` |
| [Amazon Bedrock AgentCore](services/bedrock-agentcore/) | `bedrock-agentcore` |
| [Amazon Bedrock Web Search](services/bedrock-websearch/) | `bedrock-websearch` |
| [Amazon Braket](services/braket/) | `braket` |
| [Amazon Chime](services/chime/) | `chime` |
| [Amazon CloudFront](services/cloudfront/) | `cloudfront` |
| [Amazon CloudWatch](services/monitoring/) | `monitoring` |
| [Amazon CloudWatch Anomaly Detection](services/cloudwatchpredictions/) | `cloudwatchpredictions` |
| [Amazon CloudWatch Application Signals](services/application-signals/) | `application-signals` |
| [Amazon CloudWatch Evidently](services/evidently/) | `evidently` |
| [Amazon CloudWatch Logs](services/logs/) | `logs` |
| [Amazon CloudWatch Network Monitor](services/networkmonitor/) | `networkmonitor` |
| [Amazon CloudWatch Observability Access Manager](services/oam/) | `oam` |
| [Amazon CloudWatch Observability Admin](services/observabilityadmin/) | `observabilityadmin` |
| [Amazon CloudWatch Omni](services/cloudwatch/) | `cloudwatch` |
| [Amazon CloudWatch RUM](services/rum/) | `rum` |
| [Amazon CodeGuru Profiler](services/codeguru-profiler/) | `codeguru-profiler` |
| [Amazon CodeGuru Reviewer](services/codeguru-reviewer/) | `codeguru-reviewer` |
| [Amazon Cognito Federated Identities](services/cognito-identity/) | `cognito-identity` |
| [Amazon Cognito Sync](services/cognito-sync/) | `cognito-sync` |
| [Amazon Cognito User Pools](services/cognito-idp/) | `cognito-idp` |
| [Amazon Comprehend](services/comprehend/) | `comprehend` |
| [Amazon Comprehend Medical](services/comprehendmedical/) | `comprehendmedical` |
| [Amazon Connect](services/connect/) | `connect` |
| [Amazon Connect Application Integrations](services/app-integrations/) | `app-integrations` |
| [Amazon Connect Cases](services/cases/) | `cases` |
| [Amazon Connect Customer Profiles](services/profile/) | `profile` |
| [Amazon Connect Decisions](services/scn/) | `scn` |
| [Amazon Connect Health](services/health-agent/) | `health-agent` |
| [Amazon Connect outbound campaigns](services/connect-campaigns/) | `connect-campaigns` |
| [Amazon Connect Voice ID](services/voiceid/) | `voiceid` |
| [Amazon Data Lifecycle Manager](services/dlm/) | `dlm` |
| [Amazon DataZone](services/datazone/) | `datazone` |
| [Amazon DocumentDB (with MongoDB compatibility)](services/docdb/) | `docdb` |
| [Amazon DocumentDB Elastic Clusters](services/docdb-elastic/) | `docdb-elastic` |
| [Amazon DynamoDB](services/dynamodb/) | `dynamodb` |
| [Amazon DynamoDB Accelerator (DAX)](services/dax/) | `dax` |
| [Amazon EC2 Auto Scaling](services/autoscaling/) | `autoscaling` |
| [Amazon EKS MCP](services/eks-mcp/) | `eks-mcp` |
| [Amazon Elastic Block Store (Amazon EBS)](services/ebs/) | `ebs` |
| [Amazon Elastic Compute Cloud (Amazon EC2)](services/ec2/) | `ec2` |
| [Amazon Elastic Container Registry (Amazon ECR)](services/ecr/) | `ecr` |
| [Amazon Elastic Container Registry Public (Amazon ECR Public)](services/ecr-public/) | `ecr-public` |
| [Amazon Elastic Container Service (Amazon ECS)](services/ecs/) | `ecs` |
| [Amazon Elastic File System (EFS)](services/elasticfilesystem/) | `elasticfilesystem` |
| [Amazon Elastic Inference](services/elastic-inference/) | `elastic-inference` |
| [Amazon Elastic Kubernetes Service (Amazon EKS)](services/eks/) | `eks` |
| [Amazon Elastic VMware Service](services/evs/) | `evs` |
| [Amazon ElastiCache](services/elasticache/) | `elasticache` |
| [Amazon EMR](services/elasticmapreduce/) | `elasticmapreduce` |
| [Amazon EMR on EKS](services/emr-containers/) | `emr-containers` |
| [Amazon EMR Serverless](services/emr-serverless/) | `emr-serverless` |
| [Amazon EventBridge (CloudWatch Events)](services/events/) | `events` |
| [Amazon EventBridge Scheduler](services/scheduler/) | `scheduler` |
| [Amazon EventBridge Schema Registry](services/schemas/) | `schemas` |
| [Amazon FinSpace](services/finspace/) | `finspace` |
| [Amazon Forecast](services/forecast/) | `forecast` |
| [Amazon Fraud Detector](services/frauddetector/) | `frauddetector` |
| [Amazon FSx](services/fsx/) | `fsx` |
| [Amazon GameLift Servers](services/gamelift/) | `gamelift` |
| [Amazon Glacier](services/glacier/) | `glacier` |
| [Amazon GuardDuty](services/guardduty/) | `guardduty` |
| [Amazon Inspector](services/inspector2/) | `inspector2` |
| [Amazon Inspector Classic](services/inspector/) | `inspector` |
| [Amazon Interactive Video Service](services/ivs/) | `ivs` |
| [Amazon Interactive Video Service Chat](services/ivschat/) | `ivschat` |
| [Amazon Kendra](services/kendra/) | `kendra` |
| [Amazon Kendra Intelligent Ranking](services/kendra-ranking/) | `kendra-ranking` |
| [Amazon Keyspaces (for Apache Cassandra)](services/cassandra/) | `cassandra` |
| [Amazon Kinesis Data Firehose](services/firehose/) | `firehose` |
| [Amazon Kinesis Data Streams](services/kinesis/) | `kinesis` |
| [Amazon Kinesis Video Streams](services/kinesisvideo/) | `kinesisvideo` |
| [Amazon Lex](services/lex/) | `lex` |
| [Amazon Lightsail](services/lightsail/) | `lightsail` |
| [Amazon Location Service (Amazon Location)](services/geo/) | `geo` |
| [Amazon Lookout for Equipment](services/lookoutequipment/) | `lookoutequipment` |
| [Amazon Lookout for Vision](services/lookoutvision/) | `lookoutvision` |
| [Amazon Machine Learning](services/machinelearning/) | `machinelearning` |
| [Amazon Macie](services/macie2/) | `macie2` |
| [Amazon Managed Blockchain](services/managedblockchain/) | `managedblockchain` |
| [Amazon Managed Blockchain Query](services/managedblockchain-query/) | `managedblockchain-query` |
| [Amazon Managed Grafana](services/grafana/) | `grafana` |
| [Amazon Managed Prometheus](services/aps/) | `aps` |
| [Amazon Managed Service for Apache Flink](services/kinesisanalytics/) | `kinesisanalytics` |
| [Amazon Managed Streaming for Kafka (MSK)](services/kafka/) | `kafka` |
| [Amazon Managed Workflows for Apache Airflow](services/airflow/) | `airflow` |
| [Amazon MemoryDB](services/memorydb/) | `memorydb` |
| [Amazon Monitron](services/monitron/) | `monitron` |
| [Amazon MQ](services/mq/) | `mq` |
| [Amazon MWAA Serverless (airflow-serverless)](services/airflow-serverless/) | `airflow-serverless` |
| [Amazon Neptune](services/neptune/) | `neptune` |
| [Amazon Neptune Analytics](services/neptune-graph/) | `neptune-graph` |
| [Amazon OpenSearch Serverless](services/aoss/) | `aoss` |
| [Amazon OpenSearch Service](services/es/) | `es` |
| [Amazon Personalize](services/personalize/) | `personalize` |
| [Amazon Pinpoint](services/pinpoint/) | `pinpoint` |
| [Amazon Polly](services/polly/) | `polly` |
| [Amazon Q](services/qbusiness/) | `qbusiness` |
| [Amazon Q Apps](services/qapps/) | `qapps` |
| [Amazon QuickSight](services/quicksight/) | `quicksight` |
| [Amazon Recycle Bin](services/rbin/) | `rbin` |
| [Amazon Redshift](services/redshift/) | `redshift` |
| [Amazon Redshift Serverless](services/redshift-serverless/) | `redshift-serverless` |
| [Amazon Rekognition](services/rekognition/) | `rekognition` |
| [Amazon Relational Database Service (Amazon RDS)](services/rds/) | `rds` |
| [Amazon Route 53](services/route53/) | `route53` |
| [Amazon S3 Files](services/s3files/) | `s3files` |
| [Amazon SageMaker](services/sagemaker/) | `sagemaker` |
| [Amazon Simple Email Service(Amazon SES)](services/ses/) | `ses` |
| [Amazon Simple Notification Service (Amazon SNS)](services/sns/) | `sns` |
| [Amazon Simple Queue Service (Amazon SQS)](services/sqs/) | `sqs` |
| [Amazon Simple Storage Service (Amazon S3)](services/s3/) | `s3` |
| [Amazon Simple Workflow Service](services/swf/) | `swf` |
| [Amazon SimpleDB](services/sdb/) | `sdb` |
| [Amazon Textract](services/textract/) | `textract` |
| [Amazon Timestream](services/timestream/) | `timestream` |
| [Amazon Timestream for InfluxDB](services/timestream-influxdb/) | `timestream-influxdb` |
| [Amazon Transcribe](services/transcribe/) | `transcribe` |
| [Amazon Translate](services/translate/) | `translate` |
| [Amazon Verified Permissions](services/verifiedpermissions/) | `verifiedpermissions` |
| [Amazon Virtual Private Cloud (Amazon VPC)](services/vpc/) | `vpc` |
| [Amazon WorkSpaces](services/workspaces/) | `workspaces` |
| [Amazon WorkSpaces Application Manager](services/wam/) | `wam` |
| [Amazon WorkSpaces Applications](services/appstream2/) | `appstream2` |
| [Amazon WorkSpaces Managed Instances](services/workspaces-instances/) | `workspaces-instances` |
| [Amazon WorkSpaces Secure Browser](services/workspaces-web/) | `workspaces-web` |
| [Amazon WorkSpaces Thin Client](services/thinclient/) | `thinclient` |
| [Amplify UI Builder](services/amplifyuibuilder/) | `amplifyuibuilder` |
| [Application Auto Scaling](services/application-autoscaling/) | `application-autoscaling` |
| [Application Migration](services/mgn/) | `mgn` |
| [AWS Account Management](services/account/) | `account` |
| [AWS Agent Registry](services/agent-registry/) | `agent-registry` |
| [AWS Amplify](services/amplify/) | `amplify` |
| [AWS App Mesh](services/appmesh/) | `appmesh` |
| [AWS App Runner](services/apprunner/) | `apprunner` |
| [AWS AppConfig](services/appconfig/) | `appconfig` |
| [AWS AppFabric](services/appfabric/) | `appfabric` |
| [AWS Application Cost Profiler](services/application-cost-profiler/) | `application-cost-profiler` |
| [AWS Application Discovery Service](services/discovery/) | `discovery` |
| [AWS AppSync](services/appsync/) | `appsync` |
| [AWS Audit Manager](services/auditmanager/) | `auditmanager` |
| [AWS Auto Scaling Plans](services/autoscaling-plans/) | `autoscaling-plans` |
| [AWS Backup](services/backup/) | `backup` |
| [AWS Batch](services/batch/) | `batch` |
| [AWS Billing And Cost Management Data Exports](services/bcm-data-exports/) | `bcm-data-exports` |
| [AWS Billing Conductor](services/billingconductor/) | `billingconductor` |
| [AWS Billing View Service](services/billing/) | `billing` |
| [AWS Budgets](services/aws-budgetservice/) | `aws-budgetservice` |
| [AWS Certificate Manager (ACM)](services/acm/) | `acm` |
| [AWS Chatbot](services/chatbot/) | `chatbot` |
| [AWS Clean Rooms](services/cleanrooms/) | `cleanrooms` |
| [AWS Clean Rooms ML](services/cleanrooms-ml/) | `cleanrooms-ml` |
| [AWS Cloud Map](services/AWSCloudMap/) | `AWSCloudMap` |
| [AWS Cloud9](services/cloud9/) | `cloud9` |
| [AWS CloudFormation](services/cloudformation/) | `cloudformation` |
| [AWS CloudHSM](services/cloudhsm/) | `cloudhsm` |
| [AWS CloudShell](services/cloudshell/) | `cloudshell` |
| [AWS CloudTrail](services/cloudtrail/) | `cloudtrail` |
| [AWS CodeArtifact](services/codeartifact/) | `codeartifact` |
| [AWS CodeBuild](services/codebuild/) | `codebuild` |
| [AWS CodeCommit](services/codecommit/) | `codecommit` |
| [AWS CodeDeploy](services/codedeploy/) | `codedeploy` |
| [AWS CodePipeline](services/codepipeline/) | `codepipeline` |
| [AWS Compute Optimizer](services/compute-optimizer/) | `compute-optimizer` |
| [AWS Compute Optimizer Automation](services/aco-automation/) | `aco-automation` |
| [AWS Config](services/config/) | `config` |
| [AWS Control Tower](services/controltower/) | `controltower` |
| [AWS Cost Explorer](services/ce/) | `ce` |
| [AWS Cost Optimization Hub](services/cost-optimization-hub/) | `cost-optimization-hub` |
| [AWS Cross Organization Delegation and Access](services/coda/) | `coda` |
| [AWS Data Exchange](services/dataexchange/) | `dataexchange` |
| [AWS Data Pipeline](services/datapipeline/) | `datapipeline` |
| [AWS Database Migration Service (AWS DMS)](services/dms/) | `dms` |
| [AWS DataSync](services/datasync/) | `datasync` |
| [AWS Deadline Cloud](services/deadline/) | `deadline` |
| [AWS DevOps Agent](services/aidevops/) | `aidevops` |
| [AWS Direct Connect](services/directconnect/) | `directconnect` |
| [AWS Directory Service](services/ds/) | `ds` |
| [AWS Elastic Beanstalk](services/elasticbeanstalk/) | `elasticbeanstalk` |
| [AWS Elemental Inference](services/elemental-inference/) | `elemental-inference` |
| [AWS Elemental MediaConnect](services/mediaconnect/) | `mediaconnect` |
| [AWS Elemental MediaConvert](services/mediaconvert/) | `mediaconvert` |
| [AWS Elemental MediaLive](services/medialive/) | `medialive` |
| [AWS Elemental MediaPackage](services/mediapackage/) | `mediapackage` |
| [AWS Elemental MediaPackage v2](services/mediapackagev2/) | `mediapackagev2` |
| [AWS Elemental MediaStore](services/mediastore/) | `mediastore` |
| [AWS Elemental MediaTailor](services/mediatailor/) | `mediatailor` |
| [AWS End User Messaging](services/end-user-messaging/) | `end-user-messaging` |
| [AWS End User Messaging SMS](services/sms-voice/) | `sms-voice` |
| [AWS End User Messaging Social](services/social-messaging/) | `social-messaging` |
| [AWS Entity Resolution](services/entityresolution/) | `entityresolution` |
| [AWS Fargate](services/fargate/) | `fargate` |
| [AWS Fault Injection Service (AWS FIS)](services/fis/) | `fis` |
| [AWS FinOps Agent](services/finops-agent/) | `finops-agent` |
| [AWS Firewall Manager](services/fms/) | `fms` |
| [AWS Global Accelerator](services/globalaccelerator/) | `globalaccelerator` |
| [AWS Glue](services/glue/) | `glue` |
| [AWS Glue DataBrew](services/databrew/) | `databrew` |
| [AWS Ground Station](services/groundstation/) | `groundstation` |
| [AWS Health Imaging](services/medical-imaging/) | `medical-imaging` |
| [AWS HealthLake](services/healthlake/) | `healthlake` |
| [AWS HealthOmics](services/omics/) | `omics` |
| [AWS IAM Identity Center](services/signin/) | `signin` |
| [AWS IAM Identity Center (successor to AWS Single Sign-On)](services/sso/) | `sso` |
| [AWS Identity and Access Management (IAM)](services/iam/) | `iam` |
| [AWS Interconnect](services/interconnect/) | `interconnect` |
| [AWS IoT](services/iot/) | `iot` |
| [AWS IoT Core](services/iotcore/) | `iotcore` |
| [AWS IoT Core Device Advisor](services/iotdeviceadvisor/) | `iotdeviceadvisor` |
| [AWS IoT Events](services/iotevents/) | `iotevents` |
| [AWS IoT Fleet Hub](services/iotfleethub/) | `iotfleethub` |
| [AWS IoT FleetWise](services/iotfleetwise/) | `iotfleetwise` |
| [AWS IoT Greengrass](services/greengrass/) | `greengrass` |
| [AWS IoT SiteWise](services/iotsitewise/) | `iotsitewise` |
| [AWS IoT Things Graph](services/iotthingsgraph/) | `iotthingsgraph` |
| [AWS IoT TwinMaker](services/iottwinmaker/) | `iottwinmaker` |
| [AWS IoT Wireless](services/iotwireless/) | `iotwireless` |
| [AWS Key Management Service (AWS KMS)](services/kms/) | `kms` |
| [AWS Lake Formation](services/lakeformation/) | `lakeformation` |
| [AWS Lambda](services/lambda/) | `lambda` |
| [AWS Launch Wizard](services/launchwizard/) | `launchwizard` |
| [AWS License Manager](services/license-manager/) | `license-manager` |
| [AWS License Manager Linux Subscriptions](services/license-manager-linux-subscriptions/) | `license-manager-linux-subscriptions` |
| [AWS License Manager User Subscriptions](services/license-manager-user-subscriptions/) | `license-manager-user-subscriptions` |
| [AWS Mainframe Modernization](services/m2/) | `m2` |
| [AWS Marketplace](services/aws-marketplace/) | `aws-marketplace` |
| [AWS Marketplace Agreement Service](services/marketplaceagreement/) | `marketplaceagreement` |
| [AWS Marketplace Vendor Insights](services/vendor-insights/) | `vendor-insights` |
| [AWS MCP](services/aws-mcp/) | `aws-mcp` |
| [AWS Migration Hub Journeys](services/mgh/) | `mgh` |
| [AWS Migration Hub Refactor Spaces](services/refactor-spaces/) | `refactor-spaces` |
| [AWS Network Firewall](services/network-firewall/) | `network-firewall` |
| [AWS Network Manager](services/networkmanager/) | `networkmanager` |
| [AWS Network Security Manager](services/network-security-manager/) | `network-security-manager` |
| [AWS Organizations](services/organizations/) | `organizations` |
| [AWS Outposts](services/outposts/) | `outposts` |
| [AWS Panorama](services/panorama/) | `panorama` |
| [AWS Parallel Computing Service](services/pcs/) | `pcs` |
| [AWS Partner Central Account](services/partnercentral-account/) | `partnercentral-account` |
| [AWS Partner Central Agents](services/partnercentral-agents/) | `partnercentral-agents` |
| [AWS Partner Central Benefits](services/partnercentral-benefits/) | `partnercentral-benefits` |
| [AWS Partner Central Channel](services/partnercentral-channel/) | `partnercentral-channel` |
| [AWS Partner Central Marketing](services/partnercentral-marketing/) | `partnercentral-marketing` |
| [AWS Partner Central Revenue Measurement](services/partnercentral-prm/) | `partnercentral-prm` |
| [AWS Partner Central Selling](services/partnercentral/) | `partnercentral` |
| [AWS Payment Cryptography](services/payment-cryptography/) | `payment-cryptography` |
| [AWS Pricing Calculator](services/bcm-pricing-calculator/) | `bcm-pricing-calculator` |
| [AWS Private 5G](services/private-networks/) | `private-networks` |
| [AWS Private Certificate Authority](services/acm-pca/) | `acm-pca` |
| [AWS Proton](services/proton/) | `proton` |
| [AWS Resilience Hub](services/resiliencehub/) | `resiliencehub` |
| [AWS Resource Access Manager](services/ram/) | `ram` |
| [AWS Resource Explorer](services/resource-explorer-2/) | `resource-explorer-2` |
| [AWS Resource Groups](services/resource-groups/) | `resource-groups` |
| [AWS RoboMaker](services/robomaker/) | `robomaker` |
| [AWS S3 Outposts](services/s3-outposts/) | `s3-outposts` |
| [AWS Secrets Manager](services/secretsmanager/) | `secretsmanager` |
| [AWS Security Agent](services/securityagent/) | `securityagent` |
| [AWS Security Hub](services/securityhub/) | `securityhub` |
| [AWS Server Migration Service](services/sms/) | `sms` |
| [AWS Serverless Application Repository](services/serverlessrepo/) | `serverlessrepo` |
| [AWS Service Catalog](services/servicecatalog/) | `servicecatalog` |
| [AWS Shield Advanced](services/shield/) | `shield` |
| [AWS Signer](services/signer/) | `signer` |
| [AWS Snow Device Management](services/snow-device-management/) | `snow-device-management` |
| [AWS Snow Family](services/snowball/) | `snowball` |
| [AWS Step Functions](services/states/) | `states` |
| [AWS Storage Gateway](services/storagegateway/) | `storagegateway` |
| [AWS Support](services/support/) | `support` |
| [AWS Support App](services/supportapp/) | `supportapp` |
| [AWS Support Authorization](services/supportauthz/) | `supportauthz` |
| [AWS Sustainability](services/sustainability/) | `sustainability` |
| [AWS Systems Manager](services/ssm/) | `ssm` |
| [AWS Systems Manager - Quicksetup](services/ssm-quicksetup/) | `ssm-quicksetup` |
| [AWS Systems Manager for SAP](services/ssm-sap/) | `ssm-sap` |
| [AWS Systems Manager GUI Connect](services/ssm-guiconnect/) | `ssm-guiconnect` |
| [AWS Systems Manager Incident Manager](services/ssm-incidents/) | `ssm-incidents` |
| [AWS Systems Manager Incident Manager Contacts](services/ssm-contacts/) | `ssm-contacts` |
| [AWS Telco Network Builder](services/tnb/) | `tnb` |
| [AWS Transfer Family](services/transfer/) | `transfer` |
| [AWS Transform](services/qt-platform/) | `qt-platform` |
| [AWS Trusted Advisor](services/trustedadvisor/) | `trustedadvisor` |
| [AWS User Notifications](services/notifications/) | `notifications` |
| [AWS WAF](services/wafv2/) | `wafv2` |
| [AWS WAF Classic (Global)](services/waf/) | `waf` |
| [AWS WAF Classic (Regional)](services/waf-regional/) | `waf-regional` |
| [AWS Well-Architected Tool](services/wellarchitected/) | `wellarchitected` |
| [AWS X-Ray](services/xray/) | `xray` |
| [B2B Data Interchange](services/b2bi/) | `b2bi` |
| [CloudWatch Internet Monitor](services/internetmonitor/) | `internetmonitor` |
| [Connect AI agent](services/wisdom/) | `wisdom` |
| [Diagnostic Tools](services/ts/) | `ts` |
| [EC2 Fast Launch](services/ec2fastlaunch/) | `ec2fastlaunch` |
| [EC2 Image Builder](services/imagebuilder/) | `imagebuilder` |
| [EC2 VM Import/Export](services/vmimportexport/) | `vmimportexport` |
| [Elastic Load Balancing (ELB)](services/elasticloadbalancing/) | `elasticloadbalancing` |
| [ElasticDisasterRecovery](services/drs/) | `drs` |
| [IAM Roles Anywhere](services/rolesanywhere/) | `rolesanywhere` |
| [IPAM](services/ec2-ipam/) | `ec2-ipam` |
| [Kiro](services/kiro/) | `kiro` |
| [Managed Streaming for Kafka Connect](services/kafkaconnect/) | `kafkaconnect` |
| [Mechanical Turk](services/crowdscale-usagelimitservice/) | `crowdscale-usagelimitservice` |
| [Migration Hub Orchestrator](services/migrationhuborchestrator/) | `migrationhuborchestrator` |
| [Migration Hub Strategy Recommendations](services/migrationhubstrategy/) | `migrationhubstrategy` |
| [Multi-party approval](services/mpa/) | `mpa` |
| [Network Insights](services/networkinsights/) | `networkinsights` |
| [Nova Act](services/nova-act/) | `nova-act` |
| [OpenSearch Application](services/opensearch/) | `opensearch` |
| [Private CA Connector for Active Directory](services/pca-connector-ad/) | `pca-connector-ad` |
| [Private CA Connector for Simple Certificate Enrollment Protocol](services/pca-connector-scep/) | `pca-connector-scep` |
| [Route 53 Profiles](services/route53profiles/) | `route53profiles` |
| [Route 53 Resolver](services/route53resolver/) | `route53resolver` |
| [RTB Fabric](services/rtbfabric/) | `rtbfabric` |
| [Security Incident Response](services/security-ir/) | `security-ir` |
| [Service Quotas](services/servicequotas/) | `servicequotas` |
| [VPC Lattice](services/vpc-lattice/) | `vpc-lattice` |
