{
  "service": {
    "id": "control-ssh",
    "name": "control",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 22,
    "checks": [
      {
        "script": "systemctl is-active sshd.socket",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:22",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
