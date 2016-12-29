[Unit]
Description=Docker Swarm UI (Portainer)
Requires=docker.service
After=docker.service

[Service]
EnvironmentFile=/etc/environment.network

ExecStartPre=-/usr/bin/docker stop swarm-ui
ExecStartPre=-/usr/bin/docker rm swarm-ui

ExecStartPre=/usr/bin/docker pull portainer/portainer

ExecStart=/usr/bin/docker run --name swarm-ui \
  -p 9000:9000 \
  portainer/portainer \
  -H tcp://swarm-manager.service.consul:4000

ExecStop=/usr/bin/docker stop swarm-ui

[Install]
WantedBy=multi-user.target
