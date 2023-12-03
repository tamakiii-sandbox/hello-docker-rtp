import socket
import psutil
import json

def get_ip_addresses():
    for interface, addresses in psutil.net_if_addrs().items():
        for address in addresses:
            if address.family == socket.AF_INET:
                yield interface, address.address

def format(addresses):
    return [{"interface": interface, "ip_address": ip} for interface, ip in addresses]

def main():
    addresses = get_ip_addresses()
    print(json.dumps(format(addresses), indent=4))

if __name__ == "__main__":
    main()
