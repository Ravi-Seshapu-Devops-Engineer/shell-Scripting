#!/bin/bash

Country=India

echo "I'm in $Country"
echo "PID is $$"

#sh 19.script-2.sh #calling script2 from here but it wil take variables from script 2 only

#If yoy want to use variables from script1 give source command as follows

source ./19.script-2.sh