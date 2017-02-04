[Unit]
Description=Vulcand Reverse Proxy
Requires=docker.service
After=docker.service

[Service]
Restart=on-failure

ExecStartPre=-/usr/bin/docker pull docker-registry.service.consul/vulcand
ExecStartPre=-/usr/bin/docker rm vulcand

ExecStart=/usr/bin/docker run --name vulcand \
  -p 8181:8181 \
  -p 8182:8182 \
  docker-registry.service.consul/vulcand vulcand \
  -apiInterface=0.0.0.0 \
  -etcd=http://etcd.service.consul:2379

ExecStop=/usr/bin/docker stop vulcand

[Install]
WantedBy=multi-user.target
