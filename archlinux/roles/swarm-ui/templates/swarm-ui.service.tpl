[Unit]
Description=Docker Swarm UI (Portainer)
Requires=swarm-manager.service
After=swarm-manager.service

[Service]
EnvironmentFile=/etc/environment.network

ExecStartPre=-/usr/bin/docker stop swarm-ui
ExecStartPre=-/usr/bin/docker rm swarm-ui

ExecStartPre=/usr/bin/docker pull portainer/portainer

ExecStart=/usr/bin/docker run --name swarm-ui \
  -p 9000:9000 \
  -H tpc://{{ lookup('env', 'HOST_IP') }}:4000

ExecStop=/usr/bin/docker stop swarm-ui

[Install]
WantedBy=multi-user.target
