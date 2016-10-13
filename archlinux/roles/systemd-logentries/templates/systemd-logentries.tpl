[Unit]
Description=Logentries Systemd Monitor
Requires=systemd-journal-gatewayd.socket
After=docker.service systemd-journal-gatewayd.socket
PartOf=docker.service

[Service]
EnvironmentFile=/etc/environment.private
TimeoutStartSec=0

ExecStartPre=-/usr/bin/docker stop logentries-systemd
ExecStartPre=-/usr/bin/docker rm logentries-systemd
ExecStartPre=/usr/bin/docker pull psev/log-forward

ExecStart=/usr/bin/docker run --name logentries-systemd \
  -e HOSTNAME=${HOSTNAME} \
  -v /run/journald.sock:/run/journald.sock psev/log-forward journal \
  --system-journal-token="{{ logentries_systemd }}" \
  --system-journal-sock="unix:///run/journald.sock"

ExecStop=/usr/bin/docker stop logentries-systemd

[Install]
WantedBy=multi-user.target
