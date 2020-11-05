#!/usr/bin/env bats

@test "正常に列挙できる" {
    run shell/04_count-line-numbers/count-line-numbers ./test/data/04/*

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = './test/data/04/file1: 10' ]]
    [[ ${lines[1]} = './test/data/04/file2 xxx: 20' ]]
}

@test "パラメータなしのとき出力なし" {
    run shell/04_count-line-numbers/count-line-numbers

    [[ ${status} -eq 0 ]]
    [[ ${output} == "" ]]
}

@test "存在しないファイルを指定したときエラー" {
    run shell/04_count-line-numbers/count-line-numbers ./test/data/04/file3

    [[ ${status} -eq 1 ]]
    [[ ${output} =~ ^エラー: ]]
}
