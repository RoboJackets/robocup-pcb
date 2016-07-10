#! /usr/bin/env python
import re

# Remove spaces from the end of a string
def rmspcs(str):
    return re.sub("\s","",str.strip())

ff = open("~/PROJECTS/RoboCup/boards/partslist/pp", "r")
list = ""
lines = ff.readlines()

for line in lines:
    part = rmspcs(line[0:9])
    value = rmspcs(line[9:28])
    device = rmspcs(line[28:47])
    package = rmspcs(line[47:60])
    lib = rmspcs(line[60:73])
    sht = rmspcs(line[73:-1])
    list = list+part+','+value+','+device+','+package+','+lib+','+sht+'\n'

# print list
o = open("oo.csv", "w")
o.write(list)
o.close()
