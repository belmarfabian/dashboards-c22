# Script de deploy del repo dashboards-c22
# Correr este archivo desde g:\Mi unidad\CEP\27 MEGAREFORMA\_deploy_dashboards
# con:    powershell -ExecutionPolicy Bypass -File deploy.ps1
Set-Location $PSScriptRoot

Write-Host "Creando repo público belmarfabian/dashboards-c22 y haciendo push..."
gh repo create belmarfabian/dashboards-c22 `
    --public `
    --description "Dashboards interactivos del C22-CEP sobre la sociedad chilena" `
    --source . --push

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR creando repo. ¿Ya existe? Probá:  gh repo view belmarfabian/dashboards-c22" -ForegroundColor Red
    exit 1
}

Write-Host "Habilitando GitHub Pages..."
gh api repos/belmarfabian/dashboards-c22/pages `
    -X POST `
    -f source[branch]=main `
    -f source[path]=/

Write-Host ""
Write-Host "Listo. URLs (esperar 1-2 minutos para que GitHub Pages las publique):" -ForegroundColor Green
Write-Host "  Portal:       https://belmarfabian.github.io/dashboards-c22/"
Write-Host "  Megarreforma: https://belmarfabian.github.io/dashboards-c22/megareforma/"
