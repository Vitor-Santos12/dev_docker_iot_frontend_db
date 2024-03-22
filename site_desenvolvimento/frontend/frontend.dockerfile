FROM node:lts-alpine

# Super usuario
USER root

# Instalação de pacotes gerais

RUN npm install -g @vue/cli 

# instala um servidor http simples para servir conteúdo estático
RUN npm install -g http-server

# copia arquivos e pastas para o diretório atual de trabalho (pasta 'app')
COPY ./src/vue/public /app/vue/public

COPY ./src/vue/src /app/vue/src

COPY package*.json /src/vue

# faz da pasta 'app' o diretório atual de trabalho
WORKDIR /app/vue

RUN npm install axios --force

RUN npm install cors --force

# Instalação do Ambiente

# RUN vue create bitdog

RUN npm install --force or --legacy-peer-deps

# RUN npm run lint -- --fix

# RUN npm run build

# Verificação da versão

# RUN vue --version

# RUN npm run serve

EXPOSE 8000

# Start the http-server with specified port and serving the content from the 'dist' directory

CMD [ "npm","run","serve","--","--port","8000" ]

# CMD [ "http-server", "dist", "-p", "8001" ]

# RUN npm run serve -- --port 8000

# http-server dist -p 8001

# ## Instalação 

ENTRYPOINT ["tail", "-f", "/dev/null"]

## INSTALAÇÂO

# ## Criação do projeto

# # 1. Features -> Babel, CSS Pre-processo, Linter/Formatter, Router
# # 2. Pick a CSS pre-processor -> SCSS/SASS
# # 3. Pick a linter -> Stanart
# # 4. Pick adicional lint -> Lint on save
# # 5. config for babel -> In dedicate config files
# # 6. Save config -> "no" 

# RUN vue create vue

# ## Acessar o programa 

# Instalar o bootstrap e fontawesome
# RUN npm i --save bootstrap @fortawesome/fontawesome-free

# RUN npm install axios

# RUN cd bitdog

# RUN npm run serve

# RUN npm bootstrap
