import socket
import argparse

def udp_client(server_host, server_port, message):
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

def main():
    parser = argparse.ArgumentParser(description='UDP Server')
    parser.add_argument('--host', type=str, default='127.0.0.1', help='Host to send message')
    parser.add_argument('--port', type=int, default=16384, help='Port to send message')
    parser.add_argument('--message', type=str, default='Hello, UDP Server!', help='Message to send')

    args = parser.parse_args()

    udp_client(args.host, args.port, args.message)

if __name__ == "__main__":
    main()
