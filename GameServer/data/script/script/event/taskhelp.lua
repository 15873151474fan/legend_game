

--不能使用帮助的任务
task_help_ingore=
	{3391,3481,3541,3232,3252,
		3281,3621,3791,3601,3911,
		4051,4231,4321,4341,4381,
		1491,3461,3471,3641,3811,
		3831,4011,4161,4171,4181,
		4251,4313,4411,3822,4312,
		4001,4101,3111,3221,3341,
		3351,3671,3641,3711,4141,
		4271,4442,1492,1504,1542,
		1561,3803,}

--等级封印
function OnPlayerTaskHelp(uid)
	local info =
		{
			talk = "<p><n color='GXColorTab'>    任务求助方式:</n><newline/><n>   直接在世界频道中向其他玩家或客服请教当前任务。</n></p>",
			button = {
				{"客服和玩家求助(2,0,1)","OnTaskHelpDo($1,$2)","OnTaskHelpDoShow($1,$2)"},
				{"进入官方YY新手辅导频道(2,0,1)","OnTaskYYDo($1,$2)","OnTaskYYShow($1,$2)"},
				{"找一位辅导员老师(2,0,1)","OnTaskTeacherDo($1,$2)","OnTaskTeacherShow($1,$2)"},
				{"打开任务介绍界面(2,0,1)","OnOpenTaskDialog($1,$2)"},
			},
		}
	ShowNpcMenuByTable(uid,info,1)
end

function OnOpenTaskDialog(uid)
	s_OpenDialog(uid,3,5,0,11,0)
end
function OnTaskHelpDo(uid)
	s_taskHelpDo(uid)
	return VALUE_OK
end
function OnTaskHelpDoShow(uid)
	return VALUE_OK
end
function OnTaskYYDo(uid)
	yyid = 8190
	local msg = "点击加入将进入官方YY新手辅导频道：" .. yyid
	s_messageBox(uid,msg,"加入|3|Enter|取消|5|Esc",68,0,yyid)
	return VALUE_OK
end
function OnTaskYYShow(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 60 then
		return VALUE_FAIL
	end
	return VALUE_OK
end
function OnTaskTeacherDo(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 60 then
		return VALUE_FAIL
	end
	s_requestTeacher(uid)
	return VALUE_OK
end
function OnTaskTeacherShow(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 60 then
		return VALUE_FAIL
	end
	return VALUE_OK
end
function OnTaskHelpCommit(uid)
	s_taskHelpCommit(uid)
end
function OnTaskHelpCommitOk(uid,taskid)
	local TaskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if TaskProcess == TaskProcess_None then
		s_sysInfo(uid,"<p><n color=\"GXColorRed\">请接取任务后再尝试操作</n><book bookid=\"70052\">[关于求助]</book></p>")
		return VALUE_FAIL
	end
	msg = "完成任务" .. taskid
	if s_removeMoney(uid,MoneyType_Gold,100,msg) ~= VALUE_OK then
		msg = "<p><n color='GXColorRed'>直接完成需</n><money type=8 num=100/><n color='GXColorRed'>金币。您当前金币不足，请先</n><dialog hotkeyid='15' text='充值'/><book bookid='70007'>[关于金币]</book></p>"
		s_sysInfo(uid,msg)
		s_messageBox(uid,"银两不足")
		return VALUE_FAIL
	end
	local state = s_getTaskValue(uid,taskid,TaskValue_State)
	s_setTaskValue(uid,taskid,TaskValue_Operate,state)
	if FinishRoleTask(uid,taskid) == VALUE_OK then
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
		s_countryInfo(country,"<p><q buttonid=\"6005\" ownerid=" .. uid .. ">".. name .."</q><n color=GXColorBlueSky>使用求助功能快速完成任务！</n><book bookid=\"70052\">[关于求助]</book></p>",ChatPos_Sys+ChatPos_Honor)
		return VALUE_OK
	else
		s_sysInfo(uid,"<p><n color=\"GXColorRed\">请接取任务后再尝试操作</n><book bookid=\"70052\">[关于求助]</book></p>")
	end
	return VALUE_FAIL
end
