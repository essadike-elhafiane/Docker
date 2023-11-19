FROM   debian:11

RUN apt update && apt upgrade && apt install -y nginx

RUN apt-get install -y openssl 

RUN openssl req -x509 -nodes -out /etc/ssl/c.crt -keyout /etc/ssl/c.key -subj "/C=MA/ST=MS/L=benAhmed/O=42/OU=42/CN=eelhafia.42.fr/UID=eelhafia" 

COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY  ./s.html /usr/share/nginx/html/s.html

# RUN chown -R www-data:www-data /var/www/html && \
#     chmod -R 755 /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
