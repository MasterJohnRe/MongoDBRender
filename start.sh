#!/bin/bash

# Start MongoDB in background
mongod --replSet rs0 --bind_ip_all --port 27017 &

# Wait for MongoDB to be ready
sleep 5

# Initialize replica set (will fail if already initiated — that's fine)
mongosh --eval 'try { rs.initiate() } catch(e) { print(e) }'

# Dummy HTTP server to keep Render happy (Python)
# Responds with "MongoDB OK" to any request
echo -e "HTTP/1.1 200 OK\n\nMongoDB OK" > response.txt
while true; do
  { cat response.txt; } | nc -l -p 10000 -q 1;
done
