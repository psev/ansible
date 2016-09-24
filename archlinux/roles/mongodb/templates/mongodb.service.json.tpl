{
  "service": {
    "id": "database",
    "name": "mongodb",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 27017,
    "checks": [
      {
        "script": "systemctl is-active mongodb",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:27017",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
