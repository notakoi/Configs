#!/bin/sh
client=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
server=LithiumRaspiBox
nc -l -p 1337 > /tmp/mpd.fifo &
nc=$!
ssh -t pi@$server "nc $client 1337 < /tmp/mpd.fifo" &
ncmpcpp -h $server -S visualizer
kill $nc
