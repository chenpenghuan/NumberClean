#!/usr/bin/env python
# -*- coding:utf-8 -*-
import zipfile
import os
import glob
import codecs
import csv
import random
import shutil
import re
import chardet
from pymysql import *
from time import *
#global zf
#global tid
def select(sql):
        try:
	        conn=connect(host='192.168.1.195',user='root',passwd='123123',db='cleanpt',port=3306,charset='utf8')
	        cur=conn.cursor()
	        cur.execute(sql)
	        data=cur.fetchall()
        except Exception as err:
	        data='connection error:'+str(err)
        finally:
                return data
def update(sql):
	conn=connect(host='127.0.0.1',user='root',passwd='123123',db='pc',port=3306,charset='utf8')
	cur=conn.cursor()
	if cur.execute(sql):
		conn.commit()
		return 1
	else:
		return 0
def scan_mysql():
	conn=connect(host='127.0.0.1',user='root',passwd='123123',db='pc',port=3306,charset='utf8')
	cur=conn.cursor()
	findtask(3)
	cur.close()
	conn.close()
def findtask(waittime):
	sleep(waittime)
	conn=connect(host='127.0.0.1',user='root',passwd='123123',db='pc',port=3306,charset='utf8')
	cur=conn.cursor()
	cur.execute('select taskid,username,tasktime,taskcode,upload,tasklevel,taskstatus,filename from taskinfo where taskstatus<2 order by tasklevel desc limit 1')
	data=cur.fetchall()
	if(len(data)>0):
		print('发现任务，信息如下，交给大数据平台处理')
		zf=list(str(data[0][4]).split('/'))[-1:][0]
		print(zf)
		zp=str(data[0][4])[0:-len(zf)][0:-1]
		print(zp)
		tid=str(data[0][0])
		#print(tid)
		flag1=0
		if data[0][6]==0:
			flag1=update('update taskinfo set taskstatus=1 where taskid='+str(data[0][0]))
		if data[0][6]==1:
			flag1=1
		if flag1==1:
			print('update taskinfo set taskstatus=1 where taskid='+str(data[0][0]))
			print('大数据平台开始处理')
			if zf[-4:]!='.zip':
				shutil.copyfile(str(data[0][4]),'/home/cph/'+data[0][7])
				#shutil.move(str(data[0][4]),'/home/cph/')
				print('上传文件是'+str(data[0][4]))
				zfexist=addzip2(file=data[0][7],path=zp)
				if zfexist!=0:
					zf=zfexist
			print(zf)
			readzip(zfile=zf,zpath=zp,topath='/result',logpath='/log',logf=str(data[0][0])+'.log')
			flag2=addzip()
			if flag2!=0:
				if update('update taskinfo set taskstatus=2,download="'+'/var/www/html/PC/Public/Downloads/'+flag2+'.zip" where taskid='+str(data[0][0])):
					print('全部处理完成')
					return 1
		else:
			print('大数据平台接受任务出错')
			print('马上开始查找下一个任务')
			findtask(waittime)
	else:
		print('没发现任务')
def addzip2(file='20160222检测号码.csv',path='/var/www/html/PC/Public/Downloads'):
	try:
		zfile=file[0:-4]+'.zip'
		print(zfile)
		tofile=path+'/'+zfile
		print(tofile)
		newzip=zipfile.ZipFile(tofile,'w',zipfile.ZIP_DEFLATED)
		newzip.write(file)
		newzip.close()
		return zfile
	except Exception as err:
		print('压缩处理结果出错')
		print(err)
		return 0
def readzip(zfile='test.zip',zpath='E:',topath='E:\\temp',logpath='E:\\log',logf='readme.log'):
	if os.path.exists(logpath):
		print('日志文件夹存在，继续后续操作')
	else:
		print('日志文件夹不存在，马上创建')
		os.mkdir(logpath)
	logfile=open(logpath+'/'+logf,'a',encoding='gbk')
	infofile=open(topath+'/'+'readme.txt','a',encoding='gbk')
	if os.path.exists(zpath+'//'+zfile):
		print('压缩文件存在，继续后续操作')
	else:
		print('压缩文件不存在，退出程序')
		#continue
	if os.path.exists(topath):
		print('文件夹存在，继续后续操作')
	else:
		print('文件夹不存在，马上创建')
		os.mkdir(topath)
	zflen=len(zfile)
	try:
		file=zipfile.ZipFile(zpath+'/'+zfile,'r')
	except Exception as err:
		fte=1		#file_type_error
		logfile.write(zpath+'/'+zfile+'文件类型错误，不是zip包'+"\r\n")
		infofile.write(zpath+'/'+zfile+'文件类型错误，不是zip包'+"\r\n")
		return 1
	for f in file.namelist():
		#print(f)
		try:
			filename=f.encode('cp437').decode('gbk')
		except Exception as err:
			filename=f.encode('utf-8').decode('utf-8')
		print(filename)
		if filename!='':
			if filename.find('/')!=-1:		#文件名有'/'符号
				#print(type(filename.find('/')))
				logfile.write('文件名错误，可能有压缩包'+"\r\n")
				print(filename)
				infofile.write('文件命名有错，我们的平台暂不支持压缩文件夹上传，如果您的压缩包是纯文件，请检查文件名是否含有"/"等特殊字符'+filename+"类型错误\n")
				continue
			try:
				#content=file.read(f).decode('utf-8')
				start=time()
				stop=time()+20
				#codedetect = chardet.detect(file.read(f))['encoding']
				content=file.read(f).decode('gbk','ignore')
				#content=file.read(f).decode(codedetect,'ignore')
				#print(codedetect)
				#print(content)
			except Exception as err:
				logfile.write(str(err)+"\n")
				infofile.write('文件'+filename+'无法打开，可能是类型错误'+"\r\n")
				#content=file.read(f)
				#print(content)
				#finalfile=open(filenamestr,'bw')
				continue
			content=list(content.split("\r\n"))
			#print(content)
			where=''
			dic={}
			num_c=0
			for line in content:
				#filter(str.isdigit,line)
				#re.sub('\D','',line).replace(' ','')[-11:-1].isdigit()

				#line=line.replace(' ','')
				#re.compile(^1[34578]\d{9}).match()
				if re.compile('^1[34578]\d{9}').match(re.sub('\D','',line).replace(' ','')[-11:]):
					num_c=num_c+1
					where=where+re.sub('\D','',line).replace(' ','')[-11:]+','
					dic[str(line)]=-1	#初始化为匹配不到
				else:
					#where=where+line+','
					dic[str(line)]=4	#非号码，正则匹配没通过的都是非号码
			if num_c>0:		#如果文件中存在号码
				where=where[:-1]
				print(where)
				sql='select num,code from status where num in('+where+')';
				#print(sql)
				result1=select(sql)
				#print(result1[0:16])
				#num=0
				#logfile.write('数据库连接错误'+"\n")
				while result1[0:16]=='connection error':
					sleep(5)
					print('数据库连接错误')
					#if num>1000:
						#num=0
					result1=select(sql)
					#num+=1
				for m,n in result1:
					#print('字典'+str(m)+'\t'+str(n))
					dic[str(m)]=n
				#print(dic)
				#print(result1)
				filenamestr=topath+'/'+filename;
				#print(filenamestr)
				#finalfile=open(filenamestr,'w',encoding=codedetect)
				finalfile=open(filenamestr,'w',encoding='gbk')
				if filename[-4:]=='.csv':  #这个if else指定分隔符
					expl=','
				else:
					expl="\t"
				for k in dic:
					if k!='':
						finalfile.write(k+expl+str(dic[k])+"\r\n")
				finalfile.close()
			else:					#如果文件中不存在号码
				infofile.write('文件'+filename+"中不存在号码\r\n")
	logfile.close()
	file.close()
	infofile.close()
def addzip(pathf='/result',patht='/var/www/html/PC/Public/Downloads'):
	#print(tid)
	try:
		ftime=str(time())+'_'+str(random.randint(0,10000))
		tofile=patht+'/'+ftime+'.zip'
		newzip=zipfile.ZipFile(tofile,'w',zipfile.ZIP_DEFLATED)
		for f in os.listdir(pathf):
			print(f)
			newzip.write(pathf+'/'+f)
		newzip.close()
		return ftime
	except Exception as err:
		print('压缩处理结果出错')
		print(err)
		return 0
def start(i=0):
	while 1:
		try:
			files=os.listdir('/result')
			if len(files)>0:
				print(files)
				os.remove('/result/'+files[0])
				start(i=i+1)
		except Exception as err:
			undo=update('update taskinfo set tasklevel=-1,taskstatus=0 where taskstatus=1')
			if undo==1:
				file=open('/home/cph/pc/undo.log','a',encoding='utf-8')
				file.write('发现程序无法处理的异常，平台暂未执行该任务，错误信息如下:'+str(err)+"\r\n")
				file.close()
			#print(tid)
		finally:
			scan_mysql()
start()
