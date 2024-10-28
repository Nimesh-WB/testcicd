# Fetch the short commit hash to use as the version
$Version = git rev-parse --short HEAD

# Define the path to your deployment YAML file
$DeploymentFile = "./deployment.yaml"

# Update the version label in the YAML file (Deployment and Service if present)
(Get-Content $DeploymentFile) -replace 'version: v.*', "version: v$Version" | Set-Content $DeploymentFile

# Update the Docker image tag with the commit hash to ensure Kubernetes detects a change
(Get-Content $DeploymentFile) -replace 'image: .*/wb01:.*', "image: jnims07/wb01:$Version" | Set-Content $DeploymentFile

Write-Host "Updated version to v$Version and Docker image to jnims07/wb01:$Version"
