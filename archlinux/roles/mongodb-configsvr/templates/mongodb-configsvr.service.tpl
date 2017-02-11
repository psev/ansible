[Unit]
Description=MongoDB Configuration Server
Requires=environment.service
After=environment.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongod --configsvr \
  --replSet {{ replset }} \
  --bind_ip {{ lookup('env', 'HOST_IP') }} \
  --port {{ port }}

[Install]
WantedBy=multi-user.target
