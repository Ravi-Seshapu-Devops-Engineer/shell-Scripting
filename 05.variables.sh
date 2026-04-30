#!/bin/bash

TIME_STAMP=$(date)

echo "the code is executed at $TIME_STAMP"

START_TIME=$(date +%s)
sleep 10

END_TIME=$(date +%s)

Total_TIME=$(($END_TIME - $START_TIME))

echo "Script executed in $Total_TIME"