#!/bin/bash

# p.214
# 名前
#   sum.sh - 数値の合計を計算する
# 
# 書式 
#   sum.sh NUMBER...
# 
# 説明
#   引数で指定した全ての数字の合計値を標準出力に出力する。
#   指定できる数値は整数（０または負の数値も含む）。小数は指定できない。

readonly SCRIPT_NAME=${0##*/}

result=0

for number in "$@"
do
    if [[ ! $number =~ ^-?[0-9]+$ ]];then
        printf '%s¥n' "${SCRIPT_NAME}: '$number': non-integer number"
1>&2
        exit 1
    fi

    ((result+=number))
done

printf '%s¥n' "$result"