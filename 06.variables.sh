#!/bin/bash

echo "All arguments passes to the script $@"
echo "No of variables passed to the script $#"
echo "Present working directory $PWD"
echo "Script name $0"
echo "Who is running the script $USER"
echo "Home directory of the curent user $HOME"
echo "PID odf the script $$"
sleep 100 &
echo "PID of the recently executed background process $!"
echo "all arguments passed to the script $*"
