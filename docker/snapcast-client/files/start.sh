#!/bin/bash -el

echo "Setting default audio device"
amixer cset numid=3 1

echo "Starting snapcast client"
snapclient --soundcard 1 -h snapcast-server
