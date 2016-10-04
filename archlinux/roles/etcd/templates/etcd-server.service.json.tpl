{
  "service": {
    "id": "etcd-server",
    "name": "etcd",
    "tags": [
      "{{ lookup('env', 'DEPLOY') }}"
    ],
    "address": "{{ lookup('env', 'HOST_IP') }}",
    "port": 2380,
    "checks": [
      {
        "script": "systemctl is-active etcd-server",
        "interval": "20s"
      },
      {
        "tcp": "{{ lookup('env', 'HOST_IP') }}:2379",
        "interval": "20s",
        "timeout": "1s"
      }
    ]
  }
}
