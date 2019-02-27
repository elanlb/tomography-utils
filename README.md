# tomography-utils
Collection of scripts to reduce the size of layered tiff files.

## Requirements
Image Magick must be installed:
- Ubuntu: `$ sudo apt install imagemagick`
- Mac: `$ brew install imagemagick`

## Usage
Clone the repository to your computer
- `$ cd Desktop` or wherever you want to work
- `$ git clone https://github.com/elanlb/tomography-utils`
- `$ cd tomography-utils`

### Wizard
To run the wizard (easiest), follow the steps below.
- Download your layered tiff file and place it in the `tomography-utils` folder.
- Rename it to something convenient (e.g. `scan.tif`).
- Start the wizard with `$ ./wizard.sh scan.tif`.
  - It will output something like `scan.tif[1079] TIFF 1076x1280 1076x1...`.
  - When prompted about the amount of slices to process, enter the first number between the brackets (e.g. 1079).
  - The next prompt is for how often a slice should be included. For example, if we enter 20, our final image will contain 1079 / 20 = 54 slices.
  - Finally, enter the desired scale percentage as a number, with no percent sign.
  - The command will take a while and then will say `Done. Goodbye.` and the end.

### Manual usage
You can run the individual scripts for resizing and slicing. 

Resize syntax
- `$ ./scripts/resize FILE_NAME SCALE_PERCENTAGE`
- `$ ./scripts/resize test.tif 50`

Slice syntax
- `$ ./scripts/slice FILE_NAME ORIGINAL_SLICES INCREMENT`
- `$ ./scripts/slice test.tif 1000 20` produces an image with 1000 / 20 = 50 slices

## Example
```shell
$ ./wizard.sh scripts/test.tif
scripts/test.tif[1079] TIFF 1076x1280 1076x1280+0+0 8-bit Grayscale Gray 0.040u 0:00.059
How many slices would you like to process?
1079
How often should a slice be taken?
20
What percent should the image be scaled?
50
Scaling the image...
Image scaled.
Slicing the image...
Slice 20
Slice 40
...
Slice 1040
Slice 1060
Slicing completed.
Done. Goodbye.
```