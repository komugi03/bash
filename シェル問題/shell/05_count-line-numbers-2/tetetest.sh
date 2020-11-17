#!/bin/bash

# 引数を1つずつ配列に入れる。
# ファイル名として「-」が指定された場合は、その部分のファイルリストとして標準入力を用いる。
declare file_path
declare -a array=()
declare counter=0
declare contents_of_list

for file_path in "$@"; do
    # if [[ ${file_path} = '-' && ! -t 0 ]]; then
    #     while read -r contents_of_list || [[ -n "${contents_of_list}" ]]; do
    #         if [[ -n "${contents_of_list}" ]]; then
    #             array[${counter}]=${file_path}
    #             count=$((++count))
    #         fi
    #     done
    # # file_path が - で、＜がない場合はエラーを標準エラー出力に出力して終了。
    # elif [[ ${file_path} = '-' && -t 0 ]]; then
    #     error "エラー: 入力元を入力してください。" "${RC_NOT_EXIST_FILE}"
    #     count=$((++count))
    # else
        array[${counter}]=${file_path}
        counter=$((++counter))
    # fi
done

echo "${array[@]}"
echo "${#array[@]}"