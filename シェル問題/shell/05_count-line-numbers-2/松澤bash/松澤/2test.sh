#!/bin/bash

while read str || [[ -n "${str}" ]]; do
    echo "${str}"
done