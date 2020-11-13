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

# declare -ri zero=1
# # 
# # パラメータが入力されているかを判定する
# function enter_parameter_or_not() {
#     declare -ri total=$1

#     if [[ total -lt ${zero} ]]; then
#         echo "$#"
#     fi
# }

# enter_parameter_or_not
# echo "OK"


# declare -ri zero=1
# declare -ri total=$#

# # パラメータが入力されているかを判定する
# function enter_parameter_or_not() {


#     if [[ total -lt ${zero} ]]; then
#         echo "$#"
#     fi
# }

# enter_parameter_or_not
# echo "OK"


# declare -ri zero=0
# declare -ri total=$#

# # パラメータが入力されているかを判定する
# function enter_parameter_or_not() {

    
#     if [[ total -eq ${zero} ]]; then
#         echo "$#"
#     fi
# }

# enter_parameter_or_not
# echo "OK"

# < test.txt wc -l


# declare -r parameter="test.txt"

# # 指定されたファイルパスの行数をカウントする
# # $1: 指定ファイルパス
# function count_line_numbers() {
#     local file_name=$1
#     # exist_or_not "${file_name}"
#     < "${file_name}" wc -l
# }

# declare result_count_line_numbers
# result_count_line_numbers="$(count_line_numbers "${parameter}")"

# echo "${parameter}: ${result_count_line_numbers}"


# declare i
# echo "引数は$#個"

# for i in $(seq $#)
# do
#     declare parameter
#     parameter=$(eval echo '$'"${i}")
#     # declare parameter='$'${i}
#     echo "${parameter}"
# done

# declare -ri RC_NOT_EXIST_FILE=1

# function error() {
#     local -r message=$1
#     echo "${message}" >&2
# }

# function exist_or_not() {
#     local file_name=$1
#     echo "${file_name}"
#     if ! [ -e file_name ]; then
#         error "エラー: ファイル $file_name の処理中にエラーが発生しました。"
#         exit ${RC_NOT_EXIST_FILE}
#     else
#         echo "存在してる"
#     fi
# }

# exist_or_not ./test.txt

# # function count_line_numbers() {
# #     local file_name=$1
# #     exist_or_not "${file_name}"
# #     < "${file_name}" wc -l
# # }

# # declare parameter=$1
# # count_line_numbers "${parameter}"

declare num
num=$(echo "$@")
echo "${num}"
echo "$#"