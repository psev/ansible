{
  "services": [
    {
      "id": "mongo-configsvr",
      "name": "mongo-configsvr",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}"
      ],
      "address": "{{ lookup('env', 'HOST_IP') }}",
      "port": 27019,
      "checks": [
        {
          "script": "systemctl is-active mongo-configsvr",
          "interval": "20s"
        },
        {
          "tcp": "{{ lookup('env', 'HOST_IP') }}:27019",
          "interval": "20s",
          "timeout": "1s"
        }
      ]
    },
    {
      "id": "mongo-shardsvr",
      "name": "mongo-shardsvr",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}"
      ],
      "address": "{{ lookup('env', 'HOST_IP') }}",
      "port": 27018,
      "checks": [
        {
          "script": "systemctl is-active mongo-shardsvr",
          "interval": "20s"
        },
        {
          "tcp": "{{ lookup('env', 'HOST_IP') }}:27018",
          "interval": "20s",
          "timeout": "1s"
        }
      ]
    },
    {
      "id": "mongo-mongos",
      "name": "mongo-mongos",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}"
      ],
      "address": "{{ lookup('env', 'HOST_IP') }}",
      "port": 27017,
      "checks": [
        {
          "script": "systemctl is-active mongo-mongos",
          "interval": "20s"
        },
        {
          "tcp": "{{ lookup('env', 'HOST_IP') }}:27017",
          "interval": "20s",
          "timeout": "1s"
        }
      ]
    }
  ]
}
