FROM debian:11

WORKDIR /var/hugo/info

RUN    apt update && apt upgrade && apt-get install -y \
            hugo \
            git \
            # shadow \
 &&     rm -fr /var/cache/apt/*
 
RUN hugo new site /var/hugo/info \
  &&     cd /var/hugo/info \
  &&     git clone https://github.com/Yukuro/hugo-theme-shell.git themes/shell \
  &&     hugo -b https://localhost/info

COPY    ./config.toml        /var/hugo/info/config.toml

EXPOSE 1337

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://localhost/info", \
         "-p", "1337", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]
  
