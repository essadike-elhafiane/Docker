FROM debian:11

RUN apt-get update && apt-get install -y redis && rm -rf /var/lib/apt/lists/*

COPY ./scriptRedis.sh /

RUN chmod +x /scriptRedis.sh

EXPOSE 6379

CMD [ "./scriptRedis.sh" ]
