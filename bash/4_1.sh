#!/bin/bash

if [ -n "$1" ]
then
    echo "$1"
else
    echo "fdd"
fi

echo $*

echo $0
args=$#
lastarg=${!args}
echo $lastarg
