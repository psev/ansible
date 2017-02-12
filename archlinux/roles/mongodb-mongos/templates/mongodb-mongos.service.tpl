[Unit]
Description=MongoDB MongoS Server
Requires=consul.service
After=consul.service

[Service]
User=mongodb

ExecStart=/usr/bin/mongos --configdb {{ replset }}/mongodb-configsvr-{{ lookup('env', 'CLUSTER') }}.service.consul:{{ configsvr_port }} \
  --bind_ip {{ lookup('env', 'HOST_IP') }} \
  --port {{ port }}

[Install]
WantedBy=multi-user.target
