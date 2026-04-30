#!/bin/bash

Num1=100
Num2=200
Num3=400

SUM=$(($Num1+$Num2+$Num3))

echo "sum is $SUM"

#Array

FRUITS=("Apple" "Banana" "Mango")

echo "Fruits are ${FRUITS[@]}"
echo "First Fruit is ${FRUITS[0]}"
echo "second Fruit is ${FRUITS[1]}"
echo "Third Fruit is ${FRUITS[2]}"