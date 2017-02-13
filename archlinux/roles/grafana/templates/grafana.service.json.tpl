{
  "service": {
    "id": "grafana",
    "name": "grafana",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 11000,
    "checks": [
      {
        "script": "systemctl is-active grafana",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:11000",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
