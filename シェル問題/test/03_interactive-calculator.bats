#!/usr/bin/env bats

@test "正常に計算できる（加算）" {
    INPUT="+
100
200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '100 + 200 = 300' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "負の値を正常に計算できる（加算）" {
    INPUT="+
-100
-200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '-100 + -200 = -300' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "正常に計算できる（減算）" {
    INPUT="-
100
200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '100 - 200 = -100' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "負の値を正常に計算できる（減算）" {
    INPUT="-
-100
-200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '-100 - -200 = 100' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "正常に計算できる（乗算）" {
    INPUT="*
100
200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '100 * 200 = 20000' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "負の値を正常に計算できる（乗算）" {
    INPUT="*
-100
-200
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '-100 * -200 = 20000' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "正常に計算できる（除算）" {
    INPUT="/
200
100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '200 / 100 = 2' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "負の値を正常に計算できる（除算）" {
    INPUT="/
-200
-100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '-200 / -100 = 2' ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "不正な演算子が入力された場合にエラーメッセージを表示し、再度入力を求めることができる" {
    INPUT="X
+
200
100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} =~ ^エラー: ]]
    [[ ${lines[1]} = '200 + 100 = 300' ]]
    [[ ${lines[2]} = '処理を終了します。' ]]
}

@test "不正な左項値が入力された場合にエラーメッセージを表示し、再度入力を求めることができる" {
    INPUT="+
100.0
200
100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} =~ ^エラー: ]]
    [[ ${lines[1]} = '200 + 100 = 300' ]]
    [[ ${lines[2]} = '処理を終了します。' ]]
}

@test "不正な右項値が入力された場合にエラーメッセージを表示し、再度入力を求めることができる" {
    INPUT="+
200
100.0
100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} =~ ^エラー: ]]
    [[ ${lines[1]} = '200 + 100 = 300' ]]
    [[ ${lines[2]} = '処理を終了します。' ]]
}

@test "ゼロ除算が実行されたときにエラーを表示することができる" {
    INPUT="/
200
0
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} =~ ^エラー: ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "ゼロ除算が実行されたときにエラーを表示することができる（パターン2）" {
    INPUT="/
200
-0
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} =~ ^エラー: ]]
    [[ ${lines[1]} = '処理を終了します。' ]]
}

@test "複数回計算を実行することができる" {
    INPUT="+
200
100
yes
-
200
100
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '200 + 100 = 300' ]]
    [[ ${lines[1]} = '200 - 100 = 100' ]]
    [[ ${lines[2]} = '処理を終了します。' ]]
}

@test "不正なyes/no値が入力された場合にエラーを出力することができる" {
    INPUT="+
100
200
bye
no"
    run shell/03_interactive-calculator/icalc <<< "${INPUT}"

    echo "${lines[@]}"

    [[ ${status} -eq 0 ]]
    [[ ${lines[0]} = '100 + 200 = 300' ]]
    [[ ${lines[1]} = 'エラー: yes または no 以外の値が入力されました。' ]]
    [[ ${lines[2]} = '処理を終了します。' ]]
}