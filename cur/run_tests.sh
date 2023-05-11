#!/bin/bash

rm -Rf tmp
mkdir tmp
cd tmp

# [AKR1] Keine Deltas

mkdir delta
for l in $(../pw --deltas); do
	echo "not expecting line '$l'" >&2
	exit 10
done

# [AKR2] 2 Zeilen

files=("1-first.patch" "2-2nd.patch")
for f in ${files[*]}; do touch delta/$f; done

i=0
for l in $(../pw --deltas); do
	if ((i == ${#files[@]})); then
		echo "not expecting line '$l'" >&2
		exit 10
	fi
	if [[ $l != ${files[$i]} ]]; then
		echo "expecting '${files[$i]}' but got '$l'" >&2
		exit 10
	fi
	((i++))
done
if ((i != ${#files[@]})); then
	echo "not enough lines; got $i but expected ${#files[@]}" >&2
	exit 10
fi

cd ..
rm -Rf tmp
