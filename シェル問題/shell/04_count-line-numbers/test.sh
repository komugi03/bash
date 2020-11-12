#!/bin/bash

while read -r line
    do
    echo "$line"
    done <./test.txt

while read -r line
    do
    read -r test.txt | wc -l
    done <./test.txt

# while read -r line
#     do
#     cat test.txt | wc -l
#     done <./test.txt

while :
do
    read -r < test.txt | wc -l
done