#!/usr/bin/env python

"""
Generates images from eagle .sch and .brd files and creates a markdown file
embedding the images.
"""

# install Dependencies with
#   pip2 install git+https://github.com/upverter/schematic-file-converter freetype-py

import subprocess as proc
import os
import errno
import argparse

parser = argparse.ArgumentParser(
    description="Generate a markdown file containing the renders of all eagle files in a directory")
parser.add_argument("directory",
                    type=str,
                    help="Directory containing eagle files")
parser.add_argument('-o',
    '--output_dir',
    type=str,
    default='gallery_out',
    help="The directory to place the output gallery in")
args = parser.parse_args()
args.output_dir = os.path.abspath(args.output_dir)

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
    mkdir_p(os.path.dirname(outfile))
    proc.check_call(['python2', '-m', 'upconvert.upconverter', '--unsupported', 
    '-i', infile, '-t', 'image', '-o', outfile, '-f', 'eaglexml'], stdout=LOGFILE, stderr=LOGFILE)


def enumerate_eagle_files(dirpath, exclude=[]):
    for root, dirs, files in os.walk(dirpath, topdown=True):
        dirs[:] = [d
                   for d in dirs
                   if os.path.abspath(root + '/' + d) not in exclude]
        for f in files:
            if f.endswith('.sch') or f.endswith('.brd'):
                yield root + '/' + f



def process_file(infile):
    # get filepath relative to @outdir
    subpath = infile[len(BASE_DIRECTORY) + 1:]
    success = False
    try:
        outfile = os.path.join(args.output_dir, subpath) + '.png'
        generate_image(infile, outfile)
        print("=> %s" % outfile)
        success = True
    except Exception as e:
        print('  failed: %s' % subpath)
        print(e)

    return (outfile, success)


print("Generating images for eagle files in directory '%s'\n" % BASE_DIRECTORY)

input_files = list(enumerate_eagle_files(BASE_DIRECTORY))

# Generate images for all files in parallel
from multiprocessing.pool import ThreadPool
pool = ThreadPool()
output_files = pool.map(process_file, input_files)

# write output.md with all image files embedded
OUTPUT_FILEPATH=os.path.join(args.output_dir, 'index.md')
with open(OUTPUT_FILEPATH, 'w') as file:
    # jekyll "front matter"
    file.write("---\ntitle: RoboJackets PCB Gallery\nlayout: main\n---\n\n")
    file.write("Table of Contents:\n")
    file.write("\n* TOC\n{:toc}\n\n")
    for (outfile, success) in output_files:
        outfile_rel = outfile[len(args.output_dir) + 1:]
        title = os.path.splitext(os.path.basename(outfile))[0]
        file.write("## %s\n" % title)
        file.write("![img](%s)\n" % outfile_rel)
        file.write("\n")

# done!
print("\nWrote output file: %s" % OUTPUT_FILEPATH)
