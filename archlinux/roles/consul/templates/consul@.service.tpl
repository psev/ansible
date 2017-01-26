[Unit]
Description=Consul Agent
Before=unbound.service
Requires=unbound.service

[Service]
PermissionsStartOnly=true

User=consul
Group=consul

Environment=GOMAXPROCS=4

Restart=on-failure
KillSignal=SIGINT

PIDFile=/run/consul/consul.pid

ExecStartPre=/usr/bin/touch /etc/consul/consul.pid
ExecStartPre=/usr/bin/chown consul:consul /etc/consul/consul.pid

ExecStart=/usr/bin/consul agent -data-dir /var/consul/ -pid-file /run/consul/consul.pid -config-dir /etc/consul/consul.d/%i -advertise {{ lookup('env', 'HOST_IP') }} -client {{ lookup('env', 'HOST_IP') }} -datacenter {{ lookup('env', 'REGION') }}

ExecReload=/usr/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
