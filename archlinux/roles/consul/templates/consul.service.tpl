[Unit]
Description=Consul Agent
After=environment.service
Requires=environment.service

[Service]
PermissionsStartOnly=true

User=consul
Group=consul

Environment=GOMAXPROCS=4

Restart=on-failure
KillSignal=SIGINT

PIDFile=/run/consul/consul.pid

ExecStart=/usr/bin/consul agent -data-dir /var/consul/ -pid-file /run/consul/consul.pid -config-dir /etc/consul/agent -advertise {{ lookup('env', 'HOST_IP') }} -client {{ lookup('env', 'HOST_IP') }}

ExecReload=/usr/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
