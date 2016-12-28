{
  "service": {
    "id": "swarm-ui",
    "name": "swarm-ui",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 9000,
    "checks": [
      {
        "script": "systemctl is-active swarm-ui",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:9000",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
