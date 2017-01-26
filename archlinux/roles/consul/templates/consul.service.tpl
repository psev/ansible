[Unit]
Description=Consul Agent
Requires=systemd-resolved.service unbound.service
Before=systemd-resolved.service unbound.service

[Service]
PermissionsStartOnly=true

User=consul
Group=consul

Environment=GOMAXPROCS=4

Restart=on-failure
KillSignal=SIGINT

PIDFile=/run/consul/consul.pid

ExecStartPre=/usr/bin/mkdir -p -m 0770 /run/consul
ExecStartPre=/usr/bin/chown -R consul:consul /run/consul


ExecStart=/usr/bin/consul agent -data-dir /var/consul/ -pid-file /run/consul/consul.pid -config-dir /etc/consul/agent -advertise {{ lookup('env', 'HOST_IP') }} -client {{ lookup('env', 'HOST_IP') }}

ExecReload=/usr/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
