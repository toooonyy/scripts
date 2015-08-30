#!/usr/bin/env python
# -* - coding: UTF-8 -* -

import os,re,sys,shutil

def search(src,dest,handle):
    filelist=os.listdir(src)
    for f in filelist:
        cf=src+'/'+f
        df=dest+'/'+f
        handle(cf,df)

def convert(file_in,file_out):
    fi=open(file_in,'r')
    content=fi.read()
    try:
        content=content.decode('gbk')
        fo=open(file_out,'w')
        fo.write(content.encode('utf-8'))
        fo.flush()
        fo.close()
        fi.close()

    except:
        fi.close()
        sys.exit()


if __name__ == '__main__':
    srcDir=sys.argv[1]
    dstDir=sys.argv[2]
search(srcDir,dstDir,convert)
