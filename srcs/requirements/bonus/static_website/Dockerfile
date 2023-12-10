FROM debian:11

WORKDIR /var/hugo/static 

RUN    apt update && apt upgrade && apt-get install -y \
            hugo \
            git \
 &&     rm -fr /var/cache/apt/*

RUN hugo new site /var/hugo/static\  
  && hugo -b https://eelhafia.42.fr/static 

COPY ./config.toml /var/hugo/static/config.toml 
COPY ./tools/* /var/hugo/static/static
COPY ./tools/index.html /var/hugo/static/layouts
 

EXPOSE 1337

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://eelhafia.42.fr/static", \
         "-p", "1337", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]

