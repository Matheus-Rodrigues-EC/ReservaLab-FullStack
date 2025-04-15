#  ReservaLab-FullStack
Ese repositório é utilizado com repositório orquetrador para unificar as aplicações front e backend.

Para rodar a aplicação  completa, use:
```bash
docker-compose up --build
```


## 🔄 Atualizar Submódulos (Frontend e Backend)

Este repositório utiliza **submódulos Git** para integrar os projetos do frontend e backend.

### 🧠 O que o script faz

- Dá `git pull` no repositório orquestrador
- Atualiza os submódulos (`ReservaLab-ReactJS` e `ReservaLab-NestJS`)
- Dá `git pull` em cada submódulo
- Realiza um commit com as atualizações

### 💻 Para usuários Linux/Mac (Bash)

1. Dê permissão ao script:
 ```bash
 chmod +x scripts/update-submodules.sh
  ```

Rode o script:
 ```bash
 ./scripts/update-submodules.sh
```

### 🪟 Para usuários Windows (PowerShell)

Certifique-se de permitir scripts no PowerShell:

 ```bash
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Rode o script:

 ```bash
  ./scripts/update-submodules.ps1
```
