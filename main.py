import socket

def udp_server(host='0.0.0.0', port=16384):
    # Create a socket for UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Bind the socket to the address and port
    sock.bind((host, port))

    print(f"Listening on {host}:{port}")

    while True:
        # Receive data from a client
        data, addr = sock.recvfrom(1024)  # buffer size is 1024 bytes
        print(f"Received message: {data.decode()} from {addr}")

if __name__ == "__main__":
    udp_server()
