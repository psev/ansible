[Unit]
Description=MongoDB Shard Server
Requires=environment.service
After=environment.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongod --shardsvr \
  --replSet {{ replset }}-{{ lookup('env', 'SHARD') }} \
  --bind_ip {{ lookup('env', 'HOST_IP') }} \
  --port {{ port }}


[Install]
WantedBy=multi-user.target
