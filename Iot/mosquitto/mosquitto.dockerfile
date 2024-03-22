FROM eclipse-mosquitto

# RUN apk update && \
#     apk add nano && \
#     rm -rf /var/cache/apk/*

# Comando padrão para manter o contêiner em execução
CMD ["tail", "-f", "/dev/null"]



