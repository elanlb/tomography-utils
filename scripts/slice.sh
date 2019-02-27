#!/bin/bash

# argument 1 is the file name
# argument 2 is the number of layers in the original
# argument 3 is the increment

# create the starting image
magick "$1[0]" tmp.tif

# skip the slice already created
for (( i=$3; i<$2; i+=$3 ))
do
    echo "Slice $i"
    magick tmp.tif "$1[$i]" tmp.tif
done

cp tmp.tif $1
rm tmp.tif
