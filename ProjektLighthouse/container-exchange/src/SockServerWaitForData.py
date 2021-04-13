#!/usr/bin/python
import socket
import time
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
#Bind Server to Port 8000
sock.bind(("",8000))

sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

print "Reply:", sock.recvfrom(1024)[0]
