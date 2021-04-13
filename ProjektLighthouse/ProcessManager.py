#!/usr/bin/python3

import sys
import subprocess
from sets import Set

ContainerIsStopped = 'false'
ContainerRunning= 'true'
container = {'roscore':ContainerIsStopped,'interface':ContainerIsStopped,'triang':ContainerIsStopped}

CONTAINER_STOP = 'docker stop '
CONTAINER_START = 'docker ps -aq -f before=%s'

class container:
    def __init__(self, arg):
        super(container, self).__init__()
        self.arg = arg

    def start(self,containerName):
        print("Starting Container: {}".format(containerName))

    def stop(self,containerName)
        print("STOP Container: {}".format(containerName))

c = container()
c.start()

class ClassName(object):
    """docstring for ."""

    def __init__(self, arg):
        super(, self).__init__()
        self.arg = arg
