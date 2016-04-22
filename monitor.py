from os import *
from time import *
from shutil import *
import sys
sys.setrecursionlimit(15000)
#path='E:\\monitor'
def moni(fpath):
    sleep(3)
    result=listdir(fpath)
    print(len(result))
    while len(result)>0:
        for file in result:
            option=input('有文件/文件夹  '+file+'  请选择操作:')
            if option:
                print('操作完成，将删除文件...')
                if path.isdir(fpath+'\\'+file):
                    rmtree(fpath+'\\'+file)
                else:
                    remove(fpath+'\\'+file)
                result.remove(file)
    moni(fpath)
moni('E:\\monitor')
