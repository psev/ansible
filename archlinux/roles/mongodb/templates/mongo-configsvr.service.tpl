[Unit]
Description=MongoDB Configuration Server
Requires=systemd-networkd-wait-online.service
After=systemd-networkd-wait-online.service

[Service]
ExecStart=/usr/bin/mongod --configsvr \
  --replSet {{ lookup('env', 'IDENTIFIER') }}-config

[Install]
WantedBy=multi-user.target
