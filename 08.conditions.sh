#!/bin/bash

Number=$1

# -gt greater than
# -lt less tan
# -eq eqal to
# -ne not equal to

if [ $Number -gt 20 ]; then
    echo "Given number $Number is greater than 20"
elif
    echo "Given number $Number is equal to 20"
else
    echo "Given number is $Number is less than 20"
fi