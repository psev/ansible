{
  "services": [
    {% for name in templates %}
    {
      "id": "mongo-{{ lookup('env', 'TAG') }}",
      "name": "mongo-{{ lookup('env', 'TAG') }}",
      "tags": [
        "{{ lookup('env', 'DEPLOY') }}"
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
