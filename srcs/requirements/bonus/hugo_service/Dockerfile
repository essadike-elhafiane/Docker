FROM debian:11

WORKDIR /var/hugo/info

RUN    apt update && apt upgrade && apt-get install -y \
            hugo \
            git \
 &&     rm -fr /var/cache/apt/*
 
RUN hugo new site /var/hugo/info \
  &&     cd /var/hugo/info \
  &&     git clone https://github.com/sbruder/spectral.git themes/spectral \
  &&     hugo -b https://localhost/hugo

COPY    ./config.toml        /var/hugo/info/config.toml

EXPOSE 1337

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://localhost/hugo", \
         "-p", "1337", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]
  
