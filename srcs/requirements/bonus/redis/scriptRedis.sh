#!/bin/bash
if [ ! -f "/etc/redis/exist" ]; then 
    cp /etc//redis/redis.conf /etc/redis/exist 
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g " /etc/redis/redis.conf 
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf 
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys -lru|g" /etc/redis/redis.conf 
fi
redis-server --protected-mode no