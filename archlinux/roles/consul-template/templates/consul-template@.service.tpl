[Unit]
Description=Consul Template %i

[Service]
PermissionsStartOnly=true
PIDFile=/run/consul-template/consul-template.%i.pid

#User=consul
#Group=consul

ExecStartPre=-/usr/bin/mkdir /run/consul-template
ExecStartPre=-/usr/bin/touch /run/consul-template/consul-template.%i.pid
ExecStartPre=-/usr/bin/chown -R consul:consul /run/consul-template
ExecStartPre=-/usr/bin/chmod -R 0770 /run/consul-template

ExecStart=/usr/bin/consul-template \
  --pid-file /run/consul-template/consul-template.%i.pid \
  --config /etc/consul-template/config/%i.toml \
  --consul {{ lookup('env', 'HOST_IP') }}:8500

ExecReload=/usr/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
