# Get the short commit hash for versioning
$Version = git rev-parse --short HEAD

# Path to your deployment YAML file
$DeploymentFile = "./deployment.yaml"

# Update the version in the YAML file
(Get-Content $DeploymentFile) -replace 'version: v.*', "version: $Version" | Set-Content $DeploymentFile

Write-Host "Updated version to $Version"