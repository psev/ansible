[Unit]
Description=MongoDB MongoS Server
Requires=consul.service
After=consul.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongos --configdb {{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}-config/mongo-configsvr.service.consul:27019 \
  --bind_ip {{ lookup('env', 'HOST_IP') }}

[Install]
WantedBy=multi-user.target
