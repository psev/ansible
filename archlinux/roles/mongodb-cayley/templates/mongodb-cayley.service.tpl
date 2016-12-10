[Unit]
Description=Cayley Graph Layer
Requires=docker.service
After=docker.service

[Service]
ExecStartPre=-/usr/bin/docker stop cayley
ExecStartPre=-/usr/bin/docker rm cayley
ExecStartPre=-/usr/bin/docker pull docker-registry.service.consul/cayley

ExecStart=/usr/bin/docker run \
  --name cayley \
  -p {{ lookup('env', 'HOST_IP') }}:64210:64210 \
  docker-registry.service.consul/cayley -init http \
  -db mongo -dbpath mongodb.service.consul:27017

ExecStop=/usr/bin/docker stop cayley

[Install]
WantedBy=multi-user.target
