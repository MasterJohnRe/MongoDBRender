#!/bin/bash

# Start mongod in the background
mongod --replSet rs0 --bind_ip_all &

# Wait for it to be ready
sleep 5

# Initiate replica set (if not already initiated)
mongo --eval 'rs.initiate({_id: "rs0", members: [{ _id: 0, host: "localhost:27017" }]})'

# Keep container running
tail -f /dev/null
