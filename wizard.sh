#!/bin/bash

magick identify $1 | tail -1
echo "How many slices would you like to process?"
read lines

echo "How often should a slice be taken?"
read increment

echo "What percent should the image be scaled?"
read scale

# scale the image
echo "Scaling the image..."
./scripts/resize.sh $1 $scale
echo "Image scaled."

# skuce the image
echo "Slicing the image..."
./scripts/slice.sh $1 $lines $increment
echo "Slicing completed."

echo "Done. Goodbye."