#!/usr/bin/env bats

@test "Hello World を出力できる" {
    run shell/01_hello-world/hello-world

    [[ ${status} -eq 0 ]]
    [[ ${output} = 'Hello World' ]]
}
