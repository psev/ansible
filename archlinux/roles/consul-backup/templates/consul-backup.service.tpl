[Unit]
Description=Consul Backup
After=docker.service
BindsTo=docker.service

[Service]
ExecStartPre=-/usr/bin/docker stop consul-backup
ExecStartPre=-/usr/bin/docker rm consul-backup
ExecStartPre=-/usr/bin/docker pull sugarush/consul-backup

ExecStart=/usr/bin/docker run \
  --name consul-backup \
  --env AWS_REGION={{ lookup('env', 'REGION') }} \
  sugarush/consul-backup save \
  --host {{ lookup('env', 'HOST_IP') }}:8500 \
  --bucket {{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'REGION') }}-{{ lookup('env', 'DEPLOY') }}-consul-backup \
  --kv-ignore "consul-backup,consul-alerts/checks,consul-alerts/leader" \
  --kv

ExecStop=/usr/bin/docker stop consul-backup
