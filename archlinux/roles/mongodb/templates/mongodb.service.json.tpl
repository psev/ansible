{
  "service": {
    "name": "database",
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 27017,
    "checks": [
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:27017",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
