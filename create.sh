#!/bin/bash

set -eu

x=$1
y=$2
name=$3
src=$4
ext=${src##*.}

emojipx=128

xpx=$(expr $emojipx \* $x)
ypx=$(expr $emojipx \* $y)

tmp1=${name}_tmp1_resized.$ext
convert $src -resize ${xpx}x${ypx} -gravity center -background white -extent ${xpx}x${ypx} $tmp1
for i in $(seq 0 $(expr $x - 1))
do
  for j in $(seq 0 $(expr $y - 1))
  do
    convert $tmp1 -crop ${emojipx}x${emojipx}+$(expr $emojipx \* $i)+$(expr $emojipx \* $j) ${name}_${j}_${i}.$ext
    echo -n ":${name}_${j}_${i}:"
  done
    echo
done
