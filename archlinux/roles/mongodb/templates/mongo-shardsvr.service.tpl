[Unit]
Description=MongoDB Configuration Server
Requires=systemd-networkd-wait-online.service
After=systemd-networkd-wait-online.service

[Service]
ExecStart=/usr/bin/mongod --shardsvr \
  --replset {{ lookup('env', 'IDENTIFIER') }}-shard

[Install]
WantedBy=multi-user.target
