[Unit]
Description=Docker Registry Container
Requires=docker.service
After=docker.service

[Service]
EnvironmentFile=/etc/environment
EnvironmentFile=/etc/environment.network

TimeoutStartSec=0

ExecStartPre=-/usr/bin/docker stop registry
ExecStartPre=-/usr/bin/docker rm registry
ExecStartPre=/usr/bin/docker pull psev/s3registry

ExecStart=/usr/bin/docker run \
  --name registry \
  -p ${HOST_IP}:80:5000 \
  -p 127.0.0.1:80:5000 \
  -e LOG_SERVICE=sugarush \
  -e LOG_ENVIRONMENT={{ lookup('env', 'DEPLOY') }} \
  -e S3_REGION={{ lookup('env', 'REGION') }} \
  -e S3_ACCESSKEY={{ access_key.data.Value }} \
  -e S3_SECRETKEY={{ secret_key.data.Value }} \
  -e S3_BUCKET={{ bucket.data.Value }} \
  -e S3_ROOTDIRECTORY=/registry \
  -e LISTEN_ADDRESS=:5000 \
  psev/s3registry

ExecStop=/usr/bin/docker stop registry
