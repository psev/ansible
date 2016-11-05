{
  "service": {
    "id": "influxdb-udp",
    "name": "influxdb-udp",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 9095,
    "checks": [
      {
        "script": "systemctl is-active influxdb",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:9095",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
