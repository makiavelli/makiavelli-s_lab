#!/usr/bin/python

import threading, sys

def fucking_thread():
    """Example of thread function"""
 
    print("I'm your fucking thread!");
    return

t = threading.Thread(target=fucking_thread)
t.start()

sys.exit(1);
