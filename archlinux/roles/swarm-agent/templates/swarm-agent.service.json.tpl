{
  "service": {
    "id": "swarm-agent",
    "name": "swarm-agent",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 2375,
    "checks": [
      {
        "script": "systemctl is-active swarm-agent",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:2375",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
