#!/bin/bash

filepath=$1
ext=$(echo ${filepath##*.})
type=$(file $filepath  | cut -d ' ' -f2)

#小文字化
ext=$(tr "[:upper:]" "[:lower:]" <<< $ext)
type=$(tr "[:upper:]" "[:lower:]" <<< $type)

#ファイルの存在確認
if [ -e $filepath ]; then
	:
else
	echo "$filepath が存在しません!"
	exit 0
fi

#jpegをjpgに統一
if [ ${type} = "jpeg" ]; then
	type="jpg"
fi
if [ ${ext} = "jpeg" ]; then
	ext="jpg"
fi

#画像以外は除外
if [ ${type} = "jpg" ]; then
	:
elif [ ${type} = "png" ]; then
	:
elif [ ${type} = "gif" ]; then
	:
else
	echo "$filepath が画像ではありません!"
	exit 0
fi

#echo $type
#echo $ext

if [ ${ext} = ${type} ]; then
	:
else
	echo "$filepath の拡張子が間違っています!"
fi
