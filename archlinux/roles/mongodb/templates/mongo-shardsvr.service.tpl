[Unit]
Description=MongoDB Configuration Server
Requires=systemd-networkd-wait-online.service
After=systemd-networkd-wait-online.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongod --shardsvr \
  --replSet {{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}-shard

[Install]
WantedBy=multi-user.target
