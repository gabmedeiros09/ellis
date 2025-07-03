FROM python:3.11-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
# Isso aproveita o cache de camadas do Docker. A instalação das dependências
# só será executada novamente se o arquivo requirements.txt for alterado.
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta em que a aplicação irá rodar
EXPOSE 8000

# Comando para executar a aplicação com Uvicorn
# --host 0.0.0.0 permite que a aplicação seja acessível externamente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
