#!/bin/bash

echo "🔄 Atualizando repositório orquestrador..."
git pull origin main || exit 1

echo ""
echo "📦 Atualizando submódulos..."
git submodule update --init --recursive

echo ""
echo "⬇️ Dando pull nos submódulos..."
git submodule foreach 'branch=$(git symbolic-ref --short HEAD); echo "📁 Atualizando $name (branch: $branch)..."; git pull origin $branch'

echo ""
echo "💾 Adicionando alterações dos submódulos no orquestrador..."
git add .

echo ""
read -p "📋 Mensagem do commit: " commit_msg
git commit -m "$commit_msg"

echo ""
echo "🚀 Pronto! Submódulos e orquestrador atualizados."
