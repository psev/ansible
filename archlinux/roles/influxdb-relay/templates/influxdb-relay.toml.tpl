[[http]]
# Name of the HTTP server, used for display purposes only.
name = "{{ lookup('env', 'HOSTNAME') }}-http"

# TCP address to bind to, for HTTP server.
bind-addr = "{{ lookup('env', 'HOST_IP') }}:8086"

# Enable HTTPS requests.
#ssl-combined-pem = "/etc/ssl/influxdb-relay.pem"

# Array of InfluxDB instances to use as backends for Relay.
    # name: name of the backend, used for display purposes only.
    # location: full URL of the /write endpoint of the backend
    # timeout: Go-parseable time duration. Fail writes if incomplete in this time.
    # skip-tls-verification: skip verification for HTTPS location. WARNING: it's insecure. Don't use in production.
output = [
    {% raw %}
    {{ range service "influxdb-http" }}
    { name="{{ .Name }}", location="http://{{ .Address }}:{{ .Port }}/write", timeout="10s" },
    {{ end }}
    {% endraw %}
]

#[[udp]]
# Name of the UDP server, used for display purposes only.
#name = "{{ lookup('env', 'HOSTNAME') }}-udp"

# UDP address to bind to.
#bind-addr = "{{ lookup('env', 'HOST_IP') }}:9096"

# Socket buffer size for incoming connections.
#read-buffer = 0 # default

# Precision to use for timestamps
#precision = "n" # Can be n, u, ms, s, m, h

# Array of InfluxDB instances to use as backends for Relay.
    # name: name of the backend, used for display purposes only.
    # location: host and port of backend.
    # mtu: maximum output payload size
#output = [
#    {% raw %}
#    {{ range service "influxdb-udp" }}
#    { name="{{ .Name }}", location="{{ .Address }}:{{ .Port }}", mtu=512 },
#    {{ end }}
#    {% endraw %}
#]
