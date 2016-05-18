#!/usr/bin/env python3

"""
Generates images from eagle .sch and .brd files and creates a markdown file
embedding the images.
"""

# install with
#   pip2 install git+https://github.com/upverter/schematic-file-converter freetype-py
import upconvert

import subprocess as proc
import os
import errno
import argparse

parser = argparse.ArgumentParser(
    description="Generate a markdown file containing the renders of all eagle files in a directory")
parser.add_argument("directory",
                    type=str,
                    help="Directory containing eagle files")
args = parser.parse_args()

BASE_DIRECTORY = os.path.abspath(args.directory)
LOGFILE = open('image-gen.log', 'w')

def mkdir_p(dirname):
    try:
        os.makedirs(dirname)
    except OSError as exc: 
        if exc.errno == errno.EEXIST and os.path.isdir(dirname):
            pass
        else:
            raise


def generate_image(infile, outfile):
    # print('outfile: %s' % outfile)
    mkdir_p(os.path.dirname(outfile))
    # print('dirname: %s' % os.path.dirname(outfile))
    proc.check_call(['python2', '-m', 'upconvert.upconverter',
    '-i', infile, '-t', 'image', '-o', outfile, '-f', 'eaglexml'], stdout=LOGFILE, stderr=LOGFILE)


def enumerate_eagle_files(dirpath, exclude=[]):
    for root, dirs, files in os.walk(dirpath, topdown=True):
        dirs[:] = [d
                   for d in dirs
                   if os.path.abspath(root + '/' + d) not in exclude]
        for f in files:
            if f.endswith('.sch') or f.endswith('.brd'):
                yield root + '/' + f



def process_file(infile, outdir='out'):
    # get filepath relative to @outdir
    subpath = infile[len(BASE_DIRECTORY) + 1:]

    print('generating image for file: %s' % subpath)
    success = False
    try:
        outfile = os.path.join('out', subpath) + '.png'
        generate_image(os.path.join('../', subpath), outfile)
        print("=> %s" % outfile)
        success = True
    except Exception as e:
        print('  failed: %s' % subpath)
        # print(e)

    return (outfile, success)


print("Generating images for eagle files in directory '%s'" % BASE_DIRECTORY)
print()

input_files = list(enumerate_eagle_files(BASE_DIRECTORY))

# Generate images for all files in parallel
from multiprocessing.pool import ThreadPool
pool = ThreadPool()
output_files = pool.map(process_file, input_files)

# write output.md with all image files embedded
OUTPUT_FILEPATH='output.md'
with open(OUTPUT_FILEPATH, 'w') as file:
    file.write("# Images\n\n")
    for (outfile, success) in output_files:
        title = os.path.splitext(os.path.basename(outfile))[0]
        file.write("## %s\n" % title)
        file.write("![img](%s)\n" % outfile)
        file.write("\n")

# done!
print()
print("Wrote output file: %s" % OUTPUT_FILEPATH)
