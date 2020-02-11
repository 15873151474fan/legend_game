#!/bin/env python
# -*- coding: utf-8 -*-
#��������lua�ű����ظ�����ĺ�����

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
			#buffĿ¼���Ͻ�ǿ��ɾ��buff�Լ�����s_setup-------------------
			if file.find("buff/") != -1:
				if line.find("s_setup") != -1:
					print "buffĿ¼�ڲ������s_setup:",item,":",line.lstrip()
				if line.find("s_removebuff") != -1:
					code = re.findall("s_removebuff\([^)]*\)",line)
					if code[0].count(",") == 3:
						print "buffĿ¼�ڲ���ǿ��ɾ��buff",item,":",line.lstrip()
			#c_��ͷ�ĺ���������ֱ�ӵ���------------------------------------
			if file.find("api.lua") == -1 and file.find("init.lua") == -1:
				if len(re.findall("[^a-zA-Z0-9]c_",line)) != 0:
					print "���������c_��ͷ�ĺ���:",item,":",line.lstrip()
			#�ű������������-----------------------------------------------
			if line.find("function ") != -1 and line.find("local") == -1 and line.find("--") == -1:
				name = re.sub("\(.*$","",line)
				name = re.sub("function ","",name)
				name = re.sub("\n","",name)
				if name.find("OnClickNpc_$") == -1 and name.find("OnUseItemEvent_$")== -1 and name.lstrip() != "" and name in NAME_COUNT.keys():
					NAME_COUNT[name] += 1
					if NAME_COUNT[name] > 1:
						print "�ű���������:",item,":",name,"\t\t",NAME_COUNT[name]
				else:
					NAME_COUNT[name] = 1
			#s_addValue�����������-----------------------------------------------
			if line.find("s_addValue(") != -1 and line.find("c_addvalue") == -1:
				code = re.findall("s_addValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_addValue������������:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_addValue����ָ�������Ϳ���������",item,":",line.lstrip()
			#s_subValue�����������-----------------------------------------------
			if line.find("s_subValue(") != -1 and line.find("c_subvalue") == -1:
				code = re.findall("s_subValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_subValue������������:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_subValue����ָ�������Ϳ���������",item,":",line.lstrip()
			#s_getValue�����������-----------------------------------------------
			if line.find("s_getValue(") != -1 and line.find("c_getvalue") == -1:
				code = re.findall("s_getValue\([^)]*\)",line)
				if code[0].count(",") != 2:
					print "s_getValue������������:",item,":",line.lstrip()
			#s_setValue�����������-----------------------------------------------
			if line.find("s_setValue(") != -1 and line.find("c_setvalue") == -1:
				code = re.findall("s_setValue\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_setValue������������:",item,":",line.lstrip()
				if code[0].find("VALUE_TYPE_") == -1:
					print "s_setValue����ָ�������Ϳ���������",item,":",line.lstrip()
			#s_refreshExp�����������-----------------------------------------------
			if line.find("s_refreshExp(") != -1 and line.find("c_refreshExp") == -1:
				code = re.findall("s_refreshExp\([^)]*\)",line)
				if code[0].count(",") != 3:
					print "s_refreshExp������������:",item,":",line.lstrip()
			#s_getTaskValue�����������-----------------------------------------------
			if line.find("s_getTaskValue(") != -1 and line.find("TaskValue_") == -1:
				if line.find("c_getTaskValue") == -1:
						print "s_getTaskValue�������ô���:",item,":",line.lstrip()
			if line.find("s_setTaskValue(") != -1 and line.find("TaskValue_") == -1:
				if line.find("c_setTaskValue") == -1:
					print "s_setTaskValue�������ô���:",item,":",line.lstrip()
			#��ӵ��ߵİ󶨲������-----------------------------------------------
			if line.find("s_addSceneItem(") != -1 and line.find("1-1") != -1:
				if line.count(",") < 6:
					print "��������Ӱ󶨵��ߵĲ�������:",item,":",line.lstrip()
			if line.find("s_addItem(") != -1 and line.find("1-1") != -1:
				if line.count(",") < 5:
					print "��������Ӱ󶨵��ߵĲ�������:",item,":",line.lstrip()
#------------------------------------------------------------------------------

if __name__ == "__main__":
	print "�ű��ͼ������鿪ʼ..."
	os.path.walk(".",visit,"")
	print "�ű��ͼ����������..."
			
