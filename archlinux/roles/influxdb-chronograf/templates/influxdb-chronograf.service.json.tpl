{
  "service": {
    "id": "influxdb-chronograf",
    "name": "influxdb-chronograf",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 10000,
    "checks": [
      {
        "script": "systemctl is-active chronograf",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:10000",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
