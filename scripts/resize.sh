#!/bin/bash

# argument 1 is the file name
# argument 2 is the scale percentage

magick mogrify -resize "$2"% "$1"