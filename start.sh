#!/bin/bash

# Start MongoDB in background with replica set and open to all interfaces
mongod --replSet rs0 --bind_ip_all --port 27017 &

# Wait for MongoDB to initialize
sleep 5

# Try to initiate the replica set (won't fail if already initialized)
mongosh --eval 'try { rs.initiate() } catch(e) { print(e) }'

# Start a minimal Python HTTP server to keep Render happy
# It will serve on port 10000 and respond to health checks
cd /
python3 -m http.server 10000
