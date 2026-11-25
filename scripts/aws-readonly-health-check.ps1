[CmdletBinding()]
param([string]$Profile="", [string]$Region="ap-south-1", [string[]]$TargetGroupArns=@(), [string[]]$RdsIdentifiers=@(), [string[]]$EcsClusters=@())
# READ-ONLY: never starts, stops, reboots, modifies, scales or deletes resources.
$ErrorActionPreference="Continue"
$global:AwsArgs=@("--region",$Region,"--output","json")
if($Profile){$global:AwsArgs+=@("--profile",$Profile)}
function Invoke-AwsReadOnly { param([string[]]$Arguments)
  Write-Host "`n> aws $($Arguments -join ' ')" -ForegroundColor Cyan
  & aws @Arguments @global:AwsArgs
  if($LASTEXITCODE -ne 0){Write-Warning "Check permissions, region, identifiers and CLI configuration."}
}
Write-Host "AWS READ-ONLY HEALTH CHECK — $Region" -ForegroundColor Green
Invoke-AwsReadOnly @("sts","get-caller-identity")
Invoke-AwsReadOnly @("cloudwatch","describe-alarms","--state-value","ALARM")
Invoke-AwsReadOnly @("ec2","describe-instances","--query","Reservations[].Instances[].{Id:InstanceId,State:State.Name,Type:InstanceType,AZ:Placement.AvailabilityZone}")
foreach($tg in $TargetGroupArns){Invoke-AwsReadOnly @("elbv2","describe-target-health","--target-group-arn",$tg)}
foreach($db in $RdsIdentifiers){Invoke-AwsReadOnly @("rds","describe-db-instances","--db-instance-identifier",$db)}
foreach($cluster in $EcsClusters){Invoke-AwsReadOnly @("ecs","describe-clusters","--clusters",$cluster,"--include","STATISTICS"); Invoke-AwsReadOnly @("ecs","list-services","--cluster",$cluster)}
Write-Host "Complete. Output is evidence, not automatic diagnosis." -ForegroundColor Green
