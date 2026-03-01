# 🚀 Deploy LIMPANOME no Render - Passo a Passo

## ✅ O que você vai fazer:

1. Criar repositório no GitHub ✅ (já feito!)
2. Fazer upload do código ✅ (já feito!)
3. Conectar ao Render
4. Configurar banco de dados
5. Deploy automático

---

## 🌐 Passo 1: Acessar Render

1. Acesse https://render.com
2. Clique em "Sign Up" ou "Sign In"
3. Conecte com GitHub (autorize o Render)

---

## 🗄️ Passo 2: Criar Banco de Dados PostgreSQL

### 2.1 No Dashboard do Render
1. Clique em "New +" (canto superior direito)
2. Selecione "PostgreSQL"

### 2.2 Preencha os dados
- **Name**: `limpanome-db`
- **Database**: `limpanome`
- **User**: `limpanome_user`
- **Region**: Escolha a mais próxima (ex: São Paulo)
- **PostgreSQL Version**: 15
- **Plan**: Free

### 2.3 Clique em "Create Database"
- Aguarde 2-3 minutos
- **Copie a Internal Database URL** (você vai precisar)

---

## 🚀 Passo 3: Criar Web Service

### 3.1 No Dashboard do Render
1. Clique em "New +" (canto superior direito)
2. Selecione "Web Service"

### 3.2 Conecte seu repositório
1. Clique em "Connect a repository"
2. Selecione `HN2026/limpanome` da lista
3. Clique em "Connect"

### 3.3 Preencha as configurações
- **Name**: `limpanome`
- **Environment**: `Node`
- **Build Command**: `npm install && npm run build`
- **Start Command**: `npm start`
- **Plan**: Free (ou Starter conforme necessário)
- **Region**: Mesma do banco de dados

### 3.4 Clique em "Create Web Service"

---

## 🔐 Passo 4: Configurar Variáveis de Ambiente

### 4.1 No Web Service do Render
1. Vá para a aba "Environment"
2. Clique em "Add Environment Variable"

### 4.2 Adicione cada variável:

**DATABASE_URL**
- Copie a URL do banco de dados PostgreSQL
- Cole aqui

**NODE_ENV**
- Valor: `production`

**JWT_SECRET**
- Gere uma chave segura (use: https://generate-random.org/)
- Exemplo: `abc123def456ghi789jkl012mno345pqr`

**OPENAI_API_KEY** (opcional)
- Se você tiver uma chave OpenAI, adicione aqui
- Senão, deixe em branco

### 4.3 Clique em "Save"

---

## ⏳ Passo 5: Deploy Automático

### 5.1 Aguarde o build
1. Vá para a aba "Logs"
2. Veja o progresso do build
3. Deve levar 5-10 minutos

### 5.2 Quando terminar
- Você verá "Deploy successful" nos logs
- Um URL será gerado: `https://limpanome.onrender.com`

---

## ✅ Passo 6: Testar seu Site

### 6.1 Acesse o URL
```
https://limpanome.onrender.com
```

### 6.2 Teste as funcionalidades
1. Clique em "ENTRAR"
2. Digite um email
3. Clique em "SOLICITAR PIN"
4. Verifique seu email
5. Digite o PIN recebido
6. Você deve ser redirecionado para o dashboard

---

## 🐛 Troubleshooting

### Erro: "Build failed"
- Verifique se todos os arquivos foram commitados
- Verifique se o `package.json` está correto
- Veja os logs para mais detalhes

### Erro: "Cannot connect to database"
- Verifique a DATABASE_URL
- Certifique-se de que o banco de dados está rodando
- Tente fazer uma nova migration

### Erro: "Port not available"
- O Render fornece a porta automaticamente
- Certifique-se de que o servidor está usando `process.env.PORT`

### Site fica em "Building" por muito tempo
- Pode ser que o build esteja travado
- Clique em "Cancel Deploy" e tente novamente

---

## 📊 Monitoramento Contínuo

### Acessar logs
1. No Dashboard do Render
2. Selecione seu Web Service
3. Vá para "Logs"

### Monitorar recursos
1. Vá para "Metrics"
2. Veja CPU, memória e requisições

---

## 🎉 Pronto!

Seu site LIMPANOME está online! 

**URL**: `https://limpanome.onrender.com`

### Próximos passos:
1. Configurar domínio customizado (opcional)
2. Ativar SSL (automático no Render)
3. Configurar backups do banco de dados
4. Monitorar performance

---

## 📞 Suporte

Se encontrar problemas:
1. Verifique os logs no Render
2. Consulte a documentação: https://render.com/docs
3. Abra uma issue no GitHub

**Sucesso! 🚀**
