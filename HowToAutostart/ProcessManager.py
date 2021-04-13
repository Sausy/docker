#!/usr/bin/env python3
#import numpy as np
import time
import sys
try:
    import systemd.daemon
except ImportError:
    sys.exit("""You need systemd.daemon
                install it via pip install systemd """)

class processManager:
   # PathRosCore = "/home/ubuntu/docker/node-red/x64/docker-exchange/controll/roscore"
   # PathRosInterface = ' /home/ubuntu/docker/node-red/x64/docker-exchange/controll/processing'
   # PathRosTracker = '/home/ubuntu/docker/node-red/x64/docker-exchange/controll/tracker'

    def __init__(self):
        print("processManager ... done")
        self.PathRosCore = "/home/ubuntu/docker/node-red/x64/docker-exchange/controll/roscore"
        self.PathRosInterface = "/home/ubuntu/docker/node-red/x64/docker-exchange/controll/processing"
        self.PathRosTracker = "/home/ubuntu/docker/node-red/x64/docker-exchange/controll/tracker"


    def getTransferData(self):
        f = open(self.PathRosCore,"r")
        print("PathRosCore {}".format(f.read()))
        f = open(self.PathRosInterface,"r")
        print("PathRosInterface {}".format(f.read()))
        f = open(self.PathRosTracker,"r")
        print("PathRosTracker {}".format(f.read()))



def main():
    print('Starting up ...')
    print('Starting up ... [wait 2sec]')
    time.sleep(2)
    print('Starting up ... [processManager]')
    mng = processManager()
    #systemd.daemon.notify('READY=1')

    while True:
        print('Hello from the Python Demo')
        mng.getTransferData()
        time.sleep(5)


if __name__ == "__main__":
    main()
