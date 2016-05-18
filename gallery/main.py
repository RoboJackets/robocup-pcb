#!/usr/bin/env python3

# install with
#   pip2 install git+https://github.com/upverter/schematic-file-converter freetype-py
import upconvert
import subprocess as proc
import os

import os
import errno

# the actual code
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
    proc.check_call(['python2', '-m', 'upconvert.upconverter',
    '-i', infile, '-t', 'image', '-o', outfile, '-f', 'eaglexml'])



file_subpaths = [
    'active-pcb/control-2015-a/control-2015-a.sch'
]


for subpath in file_subpaths:
    try:
        generate_image(os.path.join('../', subpath), os.path.join('out', subpath, '.png'))
    except Exception as e:
        print('failed: %s' % subpath)
        print(e)
