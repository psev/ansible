{
  "service": {
    "id": "influxdb-admin",
    "name": "influxdb-admin",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8083,
    "checks": [
      {
        "script": "systemctl is-active influxdb",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8083",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
