#!/bin/bash

declare -a array=()

# array[0]=test1
# array[1]=test2

# echo "${array[0]}"
# echo "${array[1]}"

function count_line(){
    < $1 grep -c ''
}

# function loading_list(){
#     リストからファイルを読み込んでくる
# }


for file_path in "$@"; do
    if [[ ${file_path}='-' && ! -t 0 ]]; then
        while read str || [[ -n "${str}" ]]; do
            配列に入れる
            カウンターを進める
        done 
    else
        配列に入れる
        カウンターを進める
    fi
done

if [[ ! -t 0 ]]; then
    while read str || [[ -n "${str}" ]]; do
        配列に入れる
    done 
fi

(foo.txt foo.txt bar.txt bar.txt)

for file_name_inputed in "${array[@]}"; do
    if is_exist "${file_name_inputed}"; then
        result_count_line_numbers="$(count_line_numbers "${file_name_inputed}")"
    else
        error "エラー: ファイル $file_name_inputed の処理中にエラーが発生しました。"
        exit ${RC_NOT_EXIST_FILE}
    fi
    echo "${file_name_inputed}": "${result_count_line_numbers}"
done

exit success