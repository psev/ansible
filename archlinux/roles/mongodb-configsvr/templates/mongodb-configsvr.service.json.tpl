{
  "services": [
    {% for name in templates %}
    {
      "id": "mongo-{{ name }}-{{ lookup('env', 'CLUSTER') }}",
      "name": "mongo-{{ name }}-{{ lookup('env', 'CLUSTER') }}",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}",
        "{{ lookup('env', 'CLUSTER') }}"
      ],
      "address": "{{ lookup('env', 'HOST_IP') }}",
      "port": {{ port }},
      "checks": [
        {
          "script": "systemctl is-active mongo-{{ name }}",
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
