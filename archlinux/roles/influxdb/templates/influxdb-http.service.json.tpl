{
  "service": {
    "id": "influxdb-http",
    "name": "influxdb-http",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8085,
    "checks": [
      {
        "script": "systemctl is-active influxdb",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8085",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
