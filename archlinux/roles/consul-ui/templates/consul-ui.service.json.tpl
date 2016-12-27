{
  "service": {
    "id": "consul-ui",
    "name": "consul-ui",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 8500,
    "checks": [
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:8500",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
