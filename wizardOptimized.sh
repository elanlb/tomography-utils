#!/bin/bash

echo "tomography-utils wizardOptimized.sh by Elan Bustos"

magick identify $1 | tail -1
echo "How many slices would you like to process?"
read lines

echo "How often should a slice be taken?"
read increment

echo "What percent should the image be scaled?"
read scale

# slice and scale the image with the special script
echo "Slicing and resizing the image..."
./scripts/resizeThenSlice.sh $1 $lines $increment $scale
echo "Image sliced."

echo "Done. Goodbye."
