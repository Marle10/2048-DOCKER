FROM ubuntu:latest

# Instalar dependencias necesarias
RUN apt-get update && \
    apt-get install -y nginx git && \
    rm -rf /var/lib/apt/lists/*

# Limpiar el contenido de /var/www/html antes de clonar
RUN rm -rf /var/www/html/*

# Clonar la aplicación en la carpeta de Nginx
RUN git clone https://github.com/josejuansanchez/2048 /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Ejecutar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
