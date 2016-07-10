#!/bin/bash

# Simple script that will export a png image of gerber files.

# get a base name to use for the output file's name
filename="$(basename "$1")"
filename_base="${filename%.*}"
filename_base="${filename%_*}"
output_file="${filename_base}.png"

gerbv --antialias --export=png --dpi=300 --output="$output_file" "$@"

echo "saved to $output_file"

