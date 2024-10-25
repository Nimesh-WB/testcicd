# Fetch the short commit hash to use as the version
$Version = git rev-parse --short HEAD

# Define the path to your deployment YAML file
$DeploymentFile = "./deployment.yaml"

# Update the version label in the YAML file (Deployment and Service if present)
(Get-Content $DeploymentFile) -replace 'version: v.*', "version: v$Version" | Set-Content $DeploymentFile

# Update the Docker image tag with the commit hash to ensure Kubernetes detects a change
(Get-Content $DeploymentFile) -replace 'image: .*/demo1cicd:.*', "image: jnims07/demo1cicd:$Version" | Set-Content $DeploymentFile

Write-Host "Updated version to v$Version and Docker image to jnims07/demo1cicd:$Version"
