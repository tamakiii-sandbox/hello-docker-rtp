import socket

def udp_client(server_host='192.168.1.19', server_port=16384, message="Hello, UDP Server!"):
    # Create a socket for UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    try:
        # Send data
        print(f"Sending data to: {server_host}:{server_port}")
        sock.sendto(message.encode(), (server_host, server_port))
        print(f"Sent message: {message}")
    finally:
        # Close the socket
        sock.close()

if __name__ == "__main__":
    udp_client()

