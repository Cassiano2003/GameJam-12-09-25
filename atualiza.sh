#!/bin/bash
# Auto-sync do projeto GameMaker com merge seguro
# Autor: Cassiano

# Caminho opcional do repositório (se quiser fixar)
# cd /caminho/para/seu/repositorio || exit 1

# Configurações
branch="main"
usuario="Cassiano"
data_hora=$(date '+%d-%m-%Y_%H-%M-%S')

echo "==============================="
echo "🚀 Auto-sync iniciado - $data_hora"
echo "==============================="

# Garante que o Git está inicializado
if [ ! -d .git ]; then
  echo "❌ Este diretório não é um repositório Git."
  exit 1
fi

# Adiciona e faz commit
echo "✅ Salvando alterações locais..."
git add -A
git commit -m "${data_hora}-${usuario}" || echo "⚠️ Nenhuma alteração para commit."

# Busca o remoto
echo "🌐 Atualizando informações do repositório remoto..."
git fetch origin

# Faz pull com rebase para evitar merges desnecessários
echo "🔁 Aplicando alterações do remoto..."
if ! git pull --rebase origin "$branch"; then
    echo "⚠️ Conflitos detectados durante o rebase!"
    echo "👉 Use 'git status' e resolva manualmente, depois rode novamente este script."
    exit 1
fi

# Push das alterações
echo "⬆️ Enviando alterações para o remoto..."
if git push origin "$branch"; then
    echo "✅ Tudo sincronizado com sucesso!"
else
    echo "❌ Erro ao enviar para o remoto."
    exit 1
fi

echo "==============================="
echo "✨ Sincronização concluída!"
echo "==============================="
