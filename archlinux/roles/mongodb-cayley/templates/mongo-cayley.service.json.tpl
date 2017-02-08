{
  "service": {
    "id": "mongodb-cayley",
    "name": "mongodb-cayley",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 64210,
    "checks": [
      {
        "script": "systemctl is-active mongodb-cayley",
        "interval": "30s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:64210",
        "interval": "30s",
        "timeout": "1s"
      }
    ]
  }
}
