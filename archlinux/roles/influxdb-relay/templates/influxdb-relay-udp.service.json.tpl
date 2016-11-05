{
  "service": {
    "id": "influxdb-relay-udp",
    "name": "influxdb-relay-udp",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 9096,
    "checks": [
      {
        "script": "systemctl is-active influxdb-relay",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:9096",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
