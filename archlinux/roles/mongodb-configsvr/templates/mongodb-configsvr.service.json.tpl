{
  "services": [
    {% for name in templates %}
    {
      "id": "mongodb-{{ name }}-{{ lookup('env', 'CLUSTER') }}",
      "name": "mongodb-{{ name }}-{{ lookup('env', 'CLUSTER') }}",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}",
        "{{ lookup('env', 'CLUSTER') }}"
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
