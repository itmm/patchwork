#!/bin/bash

rm -Rf tmp
mkdir tmp
cd tmp

# [AKR2] Keine Deltas

mkdir delta
for l in $(../pw); do
	print "not expecting line '$l'" >&2
	exit 10
done

rm -Rf tmp
