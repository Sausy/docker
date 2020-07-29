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

'''
        while :
do
  state_current=$( cat /home/ubuntu/docker/node-red/x64/docker-exchange/controll/roscore )
  if [ $state_last != $state_current ]
    then
      state_last=$state_current
      if [ $state_current == 'false' ]
        then
        echo "kill roscore"
        #docker exec -it myroscore killall roslaunch
        docker stop myroscore
	killall roboy_lighthouse2
        else
        docker start myroscore
	#& sleep 30 && \
        #./roboy_lighthouse2

      fi
  fi

  state_current_int=$( cat /home/ubuntu/docker/node-red/x64/docker-exchange/controll/tracker )
  if [ $state_last_int != $state_current_int ]
    then
      state_last_int=$state_current_int
      if [ $state_current_int == 'false' ]
        then
        echo "kill lh2"
        #docker exec -it myroscore killall roslaunch
        #docker stop myroscore
        killall roboy_lighthouse2
        else
        #docker start myroscore
        #killall roboy_lighthouse2
       # /home/ubuntu/start_udpinterface.sh &
        /home/ubuntu/roboy_lighthouse2 &
        #& sleep 30 && \
        #./roboy_lighthouse2

      fi
  fi

  state_current_int2=$( cat /home/ubuntu/docker/node-red/x64/docker-exchange/controll/processing )
  if [ $state_last_int2 != $state_current_int2 ]
    then
      state_last_int2=$state_current_int2
      if [ $state_current_int2 == 'false' ]
        then
        echo "kill lh2"
        #docker exec -it myroscore killall roslaunch
        #docker stop myroscore
        killall roboy_lighthouse2_tracking
        sleep 1
        else
        #docker start myroscore
        #killall roboy_lighthouse2
        /home/ubuntu/roboy_lighthouse2_tracking &
        sleep 3
        #& sleep 30 && \
        #./roboy_lighthouse2

      fi
  fi

	sleep 3
done
'''
