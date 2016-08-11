#!/usr/bin/env python2

import re, netifaces


resolv = open("/etc/resolv.conf")


domains = [ ]
servers = [ ]

# get the first interface after lo0
interface = netifaces.interfaces().pop(1)

host = netifaces.ifaddresses(interface)[netifaces.AF_INET][0]['addr']

for line in resolv.readlines():

    domain_match = re.search(r"domain (.*)", line)
    search_match = re.search(r"search (.*)", line)
    server_match = re.search(r"\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b", line)

    if search_match:
        domain = search_match.group(1)
        domains.append(domain)
        continue

    if domain_match:
        domain = domain_match.group(1)
        domains.append(domain)
        continue

    if server_match:
        server = server_match.group(0)
        if not server in [ "127.0.0.1" ]:
            servers.append(server)

network = open("/etc/environment.network", "w+")

for i in range(len(domains)):
    network.write("HOST_DOMAIN_%s=%s\n" % (i + 1, domains[i]))

for i in range(len(servers)):
    network.write("HOST_DNS_%s=%s\n" % (i + 1, servers[i]))

network.write("HOST_IP=%s\n" % host)

network.close()
