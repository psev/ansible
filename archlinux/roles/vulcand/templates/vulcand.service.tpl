[Unit]
Description=Vulcand Reverse Proxy
Requires=docker.service
After=docker.service

[Service]
Restart=on-failure

ExecStartPre=-/usr/bin/docker pull docker-registry.service.consul/vulcand
ExecStartPre=-/usr/bin/docker rm vulcand

ExecStart=/usr/bin/docker run --name vulcand \
  docker-registry.service.consul/vulcand vulcand

ExecStop=/usr/bin/docker stop vulcand

[Install]
WantedBy=multi-user.target
