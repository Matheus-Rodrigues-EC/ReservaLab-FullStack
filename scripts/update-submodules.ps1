Write-Host "🔄 Atualizando repositório orquestrador..."
git pull origin main
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "📦 Atualizando submódulos..."
git submodule update --init --recursive

Write-Host ""
Write-Host "⬇️ Dando pull nos submódulos..."

$submodules = Get-Content .gitmodules | Select-String 'path = ' | ForEach-Object { $_ -replace 'path = ', '' }
foreach ($submodule in $submodules) {
    Write-Host "📁 Atualizando $submodule..."
    Push-Location $submodule

    $branch = git rev-parse --abbrev-ref HEAD
    git pull origin $branch

    Pop-Location
}

Write-Host ""
Write-Host "💾 Adicionando alterações dos submódulos no orquestrador..."
git add .

Write-Host ""
$commit_msg = Read-Host "📋 Mensagem do commit"
git commit -m "$commit_msg"

Write-Host ""
Write-Host "🚀 Pronto! Submódulos e orquestrador atualizados."
