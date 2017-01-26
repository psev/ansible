{
  "server": false,
  "bootstrap": false,
  "bootstrap_expect": 0,
  "datacenter": "{{ lookup('env', 'IDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}-{{ lookup('env', 'REGION') }}.aws.",
  "data_dir": "/var/consul",
  "log_level": "INFO",
  "start_join": [
    "consul-1", "consul-2", "consul-3"
  ],
  "retry_join": [
    "consul-1", "consul-2", "consul-3"
  ]
}
