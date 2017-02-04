{
  "service": {
    "id": "vulcand",
    "name": "vulcand",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8182,
    "checks": [
      {
        "script": "systemctl is-active vulcand",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8181",
        "interval": "20s",
        "timeout": "1s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8182",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
