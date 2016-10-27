{
  "service": {
    "id": "influxdb",
    "name": "influxdb",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8086,
    "checks": [
      {
        "script": "systemctl is-active influxdb",
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
