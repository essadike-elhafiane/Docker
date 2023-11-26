FROM debian:11

WORKDIR /var/hugo/static 

RUN    apt update && apt upgrade && apt-get install -y \
            hugo \
            git \
            # shadow \
 &&     rm -fr /var/cache/apt/*

RUN hugo new site /var/hugo/static\ 
  &&      cd /var/hugo/static\ 
  && git clone https://github.com/LordMathis/hugo-theme-nightfall themes/nightfall\ 
  && hugo new posts/docker.md\ 
  && hugo -b https://localhost/static \ 
&& mkdir -p /var/hugo/info/content/posts 

# conf/ designing a good markdown file and moving the config file
 COPY ./config.toml /var/hugo/static/config.toml 
# COPY conf/docker.md /var/hugo/static/content/posts/docker.md 
# COPY conf/about.md /var/hugo/static/content/about/index.md 
# COPY conf /1.png /var/hugo/static/themes/nightfall/static/1.png 
# COPY conf/2.png /var/hugo/static/themes/nightfall/static/2.png 

EXPOSE 1337 

CMD [ "hugo" , . "server" , \ 
         "--bind=0.0.0.0" , \ 
         "--baseURL=https://localhost/static" , \ 
         "-p" , "1337" , \ 
         "--logFile= /dev/stdout" , \ 
        "--appendPort=false "]
