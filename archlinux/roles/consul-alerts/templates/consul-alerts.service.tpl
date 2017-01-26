[Unit]
Description=Consul Alerts
After=docker.service consul.service
BindsTo=docker.service consul.service

[Service]
Restart=on-failure

ExecStartPre=-/usr/bin/docker stop consul-alerts
ExecStartPre=-/usr/bin/docker rm consul-alerts
ExecStartPre=/usr/bin/docker pull sugarush/consul-alerts

ExecStart=/usr/bin/docker run --name consul-alerts sugarush/consul-alerts \
  start --consul-addr=${HOST_IP}:8500 \
  --consul-dc="{{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}" \
  --watch-events --watch-checks --log-level info

ExecStop=/usr/bin/docker stop consul-alerts

[Install]
WantedBy=multi-user.target
