@echo off
setlocal

set BRANCH=main
set USUARIO=Cassiano

for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set DATA=%%d-%%b-%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set HORA=%%a-%%b
)
set DATA_HORA=%DATA%_%HORA%

echo ===============================
echo 🚀 Auto-sync iniciado - %DATA_HORA%
echo ===============================

if not exist ".git" (
    echo ❌ Este diretório nao é um repositório Git.
    exit /b 1
)

echo ✅ Salvando alteracoes locais...
git add -A
git commit -m "%DATA_HORA%-%USUARIO%" || echo ⚠️ Nenhuma alteracao para commit.

echo 🌐 Atualizando informacoes do repositório remoto...
git fetch origin

echo 🔁 Aplicando alteracoes do remoto...
git pull --rebase origin %BRANCH%
if errorlevel 1 (
    echo ⚠️ Conflitos detectados! Resolva manualmente com "git status".
    exit /b 1
)

echo ⬆️ Enviando alteracoes para o remoto...
git push origin %BRANCH%
if errorlevel 1 (
    echo ❌ Erro ao enviar para o remoto.
    exit /b 1
)

echo ===============================
echo ✅ Tudo sincronizado com sucesso!
echo ===============================
pause
