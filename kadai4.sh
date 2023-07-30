#!/bin/bash

# 引数の数が2つでない場合、エラーを表示して終了
if [ "$#" -ne 2 ]; then
    echo "引数は2つ入力してください。"
    exit 1
fi

# 引数が自然数でない場合、エラーを表示して終了
if ! [[ "$1" =~ ^[1-9][0-9]*$ && "$2" =~ ^[1-9][0-9]*$ ]]; then
    echo "自然数を入力してください。"
    exit 1
fi

# 最大公約数を計算する関数
function gcd() {
    local a=$1
    local b=$2
    while [ $b -ne 0 ]; do
        local remainder=$((a % b))
        a=$b
        b=$remainder
    done
    return $a
}

# 引数を取得
num1=$1
num2=$2

# 最大公約数を計算して出力
gcd "$num1" "$num2"
result=$?
echo "最大公約数: $result"
exit 0
