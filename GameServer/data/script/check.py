#!/bin/env python
# -*- coding: utf-8 -*-
#查找所有lua脚本中重复定义的函数名

import os,re,sys,string

last_dir = ""
NAME_COUNT = {}

def visit(arg,dirname,names):
	global last_dir
	for item in names:
		if item[-3:] != "lua":
			continue
		if dirname != last_dir:
			last_dir = dirname
			print "check " + dirname + "\t------------------------------------------"
		file = os.path.join(dirname,item)
		for line in open(file).readlines():
			#buff目录内严禁强制删除buff以及调用s_setup-------------------
			if file.find("buff/") != -1:
				if line.find("s_setup") != -1:
					print "buff目录内不许调用s_setup:",item,":",line.lstrip()
				if line.find("s_removebuff") != -1:
					code = re.findall("s_removebuff\([^)]*\)",line)
					if code[0].count(",") == 3:
						print "buff目录内不许强制删除buff",item,":",line.lstrip()
			#c_开头的函数不允许直接调用------------------------------------
			if file.find("api.lua") == -1 and file.find("init.lua") == -1:
				if len(re.findall("[^a-zA-Z0-9]c_",line)) != 0:
					print "不允许调用c_开头的函数:",item,":",line.lstrip()
			#脚本函数重名检查-----------------------------------------------
			if line.find("function ") != -1 and line.find("local") == -1 and line.find("--") == -1:
				name = re.sub("\(.*$","",line)
				name = re.sub("function ","",name)
				name = re.sub("\n","",name)
				if name.find("OnClickNpc_$") == -1 and name.find("OnUseItemEvent_$")== -1 and name.lstrip() != "" and name in NAME_COUNT.keys():
					NAME_COUNT[name] += 1
					if NAME_COUNT[name] > 1:
						print "脚本函数重名:",item,":",name,"\t\t",NAME_COUNT[name]
				else:
					NAME_COUNT[name] = 1
			#s_addValue参数个数检查-----------------------------------------------
			if line.find("s_addValue(") != -1 and line.find("c_addvalue") == -1:
				code = re.findall("s_addValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_addValue参数个数错误:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_addValue参数指定的类型可能有问题",item,":",line.lstrip()
			#s_subValue参数个数检查-----------------------------------------------
			if line.find("s_subValue(") != -1 and line.find("c_subvalue") == -1:
				code = re.findall("s_subValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_subValue参数个数错误:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_subValue参数指定的类型可能有问题",item,":",line.lstrip()
			#s_getValue参数个数检查-----------------------------------------------
			if line.find("s_getValue(") != -1 and line.find("c_getvalue") == -1:
				code = re.findall("s_getValue\([^)]*\)",line)
				if code[0].count(",") != 2:
					print "s_getValue参数个数错误:",item,":",line.lstrip()
			#s_setValue参数个数检查-----------------------------------------------
			if line.find("s_setValue(") != -1 and line.find("c_setvalue") == -1:
				code = re.findall("s_setValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_setValue参数个数错误:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_setValue参数指定的类型可能有问题",item,":",line.lstrip()
			#s_refreshExp参数个数检查-----------------------------------------------
			if line.find("s_refreshExp(") != -1 and line.find("c_refreshExp") == -1:
				code = re.findall("s_refreshExp\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_refreshExp参数个数错误:",item,":",line.lstrip()
			#s_getTaskValue参数个数检查-----------------------------------------------
			if line.find("s_getTaskValue(") != -1 and line.find("TaskValue_") == -1:
				if line.find("c_getTaskValue") == -1:
						print "s_getTaskValue参数调用错误:",item,":",line.lstrip()
			if line.find("s_setTaskValue(") != -1 and line.find("TaskValue_") == -1:
				if line.find("c_setTaskValue") == -1:
					print "s_setTaskValue参数调用错误:",item,":",line.lstrip()
			#添加道具的绑定参数检查-----------------------------------------------
			if line.find("s_addSceneItem(") != -1 and line.find("1-1") != -1:
				if line.count(",") < 6:
					print "往场景添加绑定道具的参数错误:",item,":",line.lstrip()
			if line.find("s_addItem(") != -1 and line.find("1-1") != -1:
				if line.count(",") < 5:
					print "往背包添加绑定道具的参数错误:",item,":",line.lstrip()
#------------------------------------------------------------------------------

if __name__ == "__main__":
	print "脚本低级错误检查开始..."
	os.path.walk(".",visit,"")
	print "脚本低级错误检查结束..."
			
