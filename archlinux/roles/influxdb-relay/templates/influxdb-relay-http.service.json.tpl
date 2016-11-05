{
  "service": {
    "id": "influxdb-relay-http",
    "name": "influxdb-relay-http",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8086,
    "checks": [
      {
        "script": "systemctl is-active influxdb-relay",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8086",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
