[Unit]
Description=MongoDB Shard Server
Requires=environment.service
After=environment.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongod --shardsvr \
  --replSet {{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}-shard \
  --bind_ip {{ lookup('env', 'HOST_IP') }}


[Install]
WantedBy=multi-user.target
