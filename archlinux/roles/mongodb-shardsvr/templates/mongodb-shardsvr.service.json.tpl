{
  "services": [
    {% for name in templates %}
    {
      "id": "mongo-{{ name }}-{{ lookup('env', 'CLUSTER') }}-{{ lookup('env', 'SHARD') }}",
      "name": "mongo-{{ name }}-{{ lookup('env', 'CLUSTER') }}-{{ lookup('env', 'SHARD') }}",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}",
        "{{ lookup('env', 'CLUSTER') }}",
        "{{ lookup('env', 'SHARD') }}"
      ],
      "address": "{{ lookup('env', 'HOST_IP') }}",
      "port": {{ port }},
      "checks": [
        {
          "script": "systemctl is-active mongodb-{{ name }}",
          "interval": "20s"
        },
        {
          "tcp": "{{ lookup('env', 'HOST_IP') }}:{{ port }}",
          "interval": "20s",
          "timeout": "1s"
        }
      ]
    }
    {% endfor %}
  ]
}
