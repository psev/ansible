[Unit]
Description=Logentries Systemd Monitor
Requires=systemd-journal-gatewayd.socket
After=docker.service systemd-journal-gatewayd.socket
PartOf=docker.service

[Service]
TimeoutStartSec=0

ExecStartPre=-/usr/bin/docker stop systemd-logentries
ExecStartPre=-/usr/bin/docker rm systemd-logentries
ExecStartPre=/usr/bin/docker pull psev/log-forward

ExecStart=/usr/bin/docker run --name systemd-logentries \
  -e HOSTNAME=${HOSTNAME} \
  -v /run/journald.sock:/run/journald.sock psev/log-forward journal \
  --system-journal-token="{{ logentries_systemd_token }}" \
  --system-journal-sock="unix:///run/journald.sock"

ExecStop=/usr/bin/docker stop systemd-logentries

[Install]
WantedBy=multi-user.target
