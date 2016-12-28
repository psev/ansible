{
  "service": {
    "id": "swarm-manager",
    "name": "swarm",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 4000,
    "checks": [
      {
        "script": "systemctl is-active swarm-manager",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:4000",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
