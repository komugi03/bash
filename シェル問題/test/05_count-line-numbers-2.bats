#!/usr/bin/env bats

@test "正常に列挙できる" {
    run shell/05_count-line-numbers-2/count-line-numbers-2 \
        "./test/data/05/file1" \
        "./test/data/05/file2 xxx"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = './test/data/05/file1: 10' ]]
    [[ ${lines[1]} = './test/data/05/file2 xxx: 20' ]]
}

@test "標準入力なし／パラメータなしのとき出力なし" {
    run shell/05_count-line-numbers-2/count-line-numbers-2

    [[ ${status} -eq 0 ]]
    [[ ${output} == "" ]]
}

@test "存在しないファイルを指定したときエラー" {
    run shell/05_count-line-numbers-2/count-line-numbers-2 ./test/data/05/file5

    [[ ${status} -eq 1 ]]
    [[ ${output} =~ ^エラー: ]]
}

@test "標準入力あり／パラメータなしのとき正常に列挙できる" {
    run shell/05_count-line-numbers-2/count-line-numbers-2 < ./test/data/05/input

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = './test/data/05/file3: 10' ]]
    [[ ${lines[1]} = './test/data/05/file4 xxx: 20' ]]
}

@test "標準入力あり／パラメータありのとき正常に列挙できる" {
    run shell/05_count-line-numbers-2/count-line-numbers-2 \
        "./test/data/05/file1" \
        "-" \
        "./test/data/05/file2 xxx" \
        < ./test/data/05/input

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = './test/data/05/file1: 10' ]]
    [[ ${lines[1]} = './test/data/05/file3: 10' ]]
    [[ ${lines[2]} = './test/data/05/file4 xxx: 20' ]]
    [[ ${lines[3]} = './test/data/05/file2 xxx: 20' ]]
}

@test "標準入力あり／パラメータあり／標準入力シンボル省略のとき正常に列挙できる" {
    run shell/05_count-line-numbers-2/count-line-numbers-2 \
        "./test/data/05/file1" \
        "./test/data/05/file2 xxx" \
        < ./test/data/05/input

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = './test/data/05/file1: 10' ]]
    [[ ${lines[1]} = './test/data/05/file2 xxx: 20' ]]
    [[ ${lines[2]} = './test/data/05/file3: 10' ]]
    [[ ${lines[3]} = './test/data/05/file4 xxx: 20' ]]
}

@test "標準入力に存在しないファイルを指定したときエラー" {
run shell/05_count-line-numbers-2/count-line-numbers-2 < ./test/data/05/input2

 

[[ ${status} -eq 1 ]]
[[ ${output} =~ ^エラー: ]]
}