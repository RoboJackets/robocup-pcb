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


LOGFILE=open('image-gen.log', 'w')


OUTPUT_MDFILE=open('output.md', 'w')

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
    subpath = infile[3:]
    print('generating image for file: %s' % subpath)
    try:
        outfile = os.path.join('out', subpath) + '.png'
        generate_image(os.path.join('../', subpath), outfile)
        return outfile
    except Exception as e:
        print('  failed: %s' % subpath)
        # print(e)



from multiprocessing.pool import ThreadPool

pool = ThreadPool()
outfiles = pool.map(process_file, enumerate_eagle_files('../active-pcb'))

print(outfile)


OUTPUT_MDFILE.write("# Images\n")
OUTPUT_MDFILE.write("# Render\n")
OUTPUT_MDFILE.write("![img](%s)\n" % outfile)
OUTPUT_MDFILE.write("\n")
