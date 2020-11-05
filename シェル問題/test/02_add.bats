#!/usr/bin/env bats

@test "正常に計算できる" {
    run shell/02_add/add 10 20

    [[ ${status} -eq 0 ]]
    [[ ${output} = '30' ]]
}

@test "負の値を正常に計算できる" {
    run shell/02_add/add -10 -20

    [[ ${status} -eq 0 ]]
    [[ ${output} = '-30' ]]
}

@test "パラメータなしのときエラー" {
    run shell/02_add/add

    [[ ${status} -eq 2 ]]
    [[ ${output} =~ ^エラー: ]]
}

@test "パラメータ1個のときエラー" {
    run shell/02_add/add 10

    [[ ${status} -eq 2 ]]
    [[ ${output} =~ ^エラー: ]]
}

@test "パラメータ3個のときエラー" {
    run shell/02_add/add 10 20 30

    [[ ${status} -eq 1 ]]
    [[ ${output} =~ ^エラー: ]]
}

@test "第1パラメータ不正のときエラー" {
    run shell/02_add/add xx 20

    [[ ${status} -eq 3 ]]
    [[ ${output} =~ ^エラー: ]]
}

@test "第2パラメータ不正のときエラー" {
    run shell/02_add/add 10 xx

    [[ ${status} -eq 4 ]]
    [[ ${output} =~ ^エラー: ]]
}
