#!/bin/bash


kadai4="./kadai4.sh"

echo "正常な動作の確認"
result=$($kadai4 48 18)  # 6が出力される
if [ "$result" = "48 と 18 の最大公約数: 6" ]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi
    
# 不正な入力に対するエラー確認
echo "不正な入力(要素が1つ)に対するエラー確認"
error_msg=$($kadai4 4 2>&1)  # 引数が2つでないためエラーになる
if [[ $error_msg == "引数は2つ入力してください。" ]]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi

echo "不正な入力(要素が3つ)に対するエラー確認"
error_msg=$($kadai4 4 8 16 2>&1)  # 引数が2つでないためエラーになる
if [[ $error_msg == "引数は2つ入力してください。" ]]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi
    
echo "不正な入力(因数が英字)に対するエラー確認"
error_msg=$($kadai4 abc def 2>&1)  # 引数が自然数でないためエラーになる
if [[ $error_msg == "自然数を入力してください。" ]]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi

echo "不正な入力(因数が0)に対するエラー確認"
error_msg=$($kadai4 0 10 2>&1)  # 0は自然数ではないためエラーになる
if [[ $error_msg == "自然数を入力してください。" ]]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi

echo "不正な入力(因数が負の数)に対するエラー確認"
error_msg=$($kadai4 -5 10 2>&1)  # 負の数は自然数でないためエラーになる
if [[ $error_msg == "自然数を入力してください。" ]]; then
    echo "OK"
else
    echo "NG"
    exit 1
fi
