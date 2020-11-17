#!/bin/bash

declare -a array=()
array[0]=test1
array[1]=test2

echo "${array[@]}"
echo "${#array[@]}"

array+=( "file_path" )

echo "${array[@]}"
echo "${#array[@]}"
