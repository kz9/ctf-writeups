#!/bin/bash

tar tf grep.tar | while read -r FILE
do
    if tar xf grep.tar $FILE  -O | grep "SECRET AUTH CODE" ;then
        echo "found pattern in : $FILE"
    fi
done
