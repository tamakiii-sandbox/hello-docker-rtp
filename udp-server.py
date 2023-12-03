import socket
import argparse

def udp_server(host, port):
    # Create a socket for UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

    # Bind the socket to the address and port
    sock.bind((host, port))

    print(f"Listening on {host}:{port}")

    while True:
        # Receive data from a client
        data, addr = sock.recvfrom(1024)  # buffer size is 1024 bytes
        print(f"Received message: {data.decode()} from {addr}")

def main():
    parser = argparse.ArgumentParser(description='UDP Server')
    parser.add_argument('--host', type=str, default='0.0.0.0', help='Host to listen on')
    parser.add_argument('--port', type=int, default=16384, help='Port to listen on')

    args = parser.parse_args()

    udp_server(args.host, args.port)

if __name__ == "__main__":
    main()
