{
  "server": false,
  "bootstrap": false,
  "datacenter": "{{ lookup('env', 'INDENTIFIER') }}-{{ lookup('env', 'DEPLOY') }}-{{ lookup('env', 'REGION') }}",
  "data_dir": "/var/consul",
  "log_level": "INFO",
  "start_join": [
    "consul-1", "consul-2", "consul-3"
  ],
  "retry_join": [
    "consul-1", "consul-2", "consul-3"
  ]
}
