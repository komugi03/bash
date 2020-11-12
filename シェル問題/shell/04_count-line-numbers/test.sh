#!/bin/bash

# while read -r line
#     do
#     echo "$line"
#     done <./test.txt

# while read -r line
#     do
#     read -r test.txt | wc -l
#     done <./test.txt

# # while read -r line
# #     do
# #     cat test.txt | wc -l
# #     done <./test.txt

# while :
# do
#     # read -r < test.txt | wc -l
# done

# < test.txt wc -l

declare -ri zero=1
# 
# パラメータが入力されているかを判定する
function enter_parameter_or_not() {
    declare -ri total=$1

    if [[ total -lt ${zero} ]]; then
        echo "$#"
    fi
}

enter_parameter_or_not
echo "OK"