#!/bin/bash

sed -i 's/^# maxmemory <bytes>/maxmemory 2mb/g' redis.conf

sed -i 's/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g' redis.conf

sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/g' redis.conf
