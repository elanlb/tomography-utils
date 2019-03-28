# tomography-utils
Collection of scripts to reduce the size of layered tiff files.

## Requirements
Image Magick must be installed:
- Ubuntu: `$ sudo apt install imagemagick`
- Mac: `$ brew install imagemagick`
  - If Homebrew is not installed, run `$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  - Read more at [Homebrew](https://brew.sh/)

## Usage
Clone the repository to your computer
- `$ cd Desktop` or wherever you want to work
- `$ git clone https://github.com/elanlb/tomography-utils`
- `$ cd tomography-utils`

### Wizard
To run the wizard (easiest), follow the steps below.
- Download your layered tiff file and place it in the `tomography-utils` folder.
- Rename it to something convenient (e.g. `scan.tif`).
- Start the wizard with `$ ./wizardOptimized.sh scan.tif` (not `wizard.sh`- see note below).
  - It will output something like `scan.tif[1079] TIFF 1076x1280 1076x1...`.
  - When prompted about the amount of slices to process, enter the first number between the brackets (e.g. 1079).
  - The next prompt is how often a slice should be included. For example, 20 will result in an image with 1079 / 20 = 54 slices.
  - Finally, enter the desired scale percentage as a number, with no percent sign.
  - The command will take a while and then will say `Done. Goodbye.` at the end.

Note: `wizard.sh` is from an older version and is significantly less efficient (resulting in crashes). The old `wizard.sh` first scales the entire tiff stack, then assembles the slices. This is incredibly inefficient and resource-intensive because most of the work being done in the scaling stage is thrown away when the slices are assembled. Swapping the stages would not increase the efficiency because it is also very resource-intensive to disassemble and reassemble full size tiff stacks. The new `wizardOptimized.sh` selects one slice at a time, scales it, and then inserts it into the final stack.

### Manual usage
You can run the individual scripts for resizing and slicing. 

Resize syntax
- `$ ./scripts/resize FILE_NAME SCALE_PERCENTAGE`
- `$ ./scripts/resize test.tif 50` resizes the image by 50%

Slice syntax
- `$ ./scripts/slice FILE_NAME ORIGINAL_SLICES INCREMENT`
- `$ ./scripts/slice test.tif 1000 20` produces an image with 1000 / 20 = 50 slices

Resize then slice syntax
- `$ ./scripts/resizeThenSlice FILE_NAME ORIGINAL_SLICES INCREMENT SCALE_PERCENTAGE`
- `$ ./scripts/resizeThenSlice test.tif 1000 20 50` produces an image with 1000 / 20 = 50 slices that has 50% slice size compared to the original

## Example
```
$ ./wizardOptimized.sh scripts/test.tif
tomography-utils wizardOptimized.sh by Elan Bustos
test.tif[1079] TIFF 1076x1280 1076x1280+0+0 8-bit Grayscale Gray 0.040u 0:00.059
How many slices would you like to process?
1079
How often should a slice be taken?
20
What percent should the image be scaled?
50
Scaling and resizing image...
Slice 20
Slice 40
...
Slice 1040
Slice 1060
Slicing completed.
Done. Goodbye.
```
