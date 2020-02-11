-- 12 天
-- 13 火
-- 14 水
-- 15 沙
-- 16 风
-- 17 花
function RoleTaskInfo50036_Item_Num(uid, taskid, subtaskid, paramlist)
	local list = pack(s_getCountryList())
	local countrynum = table.getn(list)
	if countrynum < 2 then countrynum = 2 end
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	subinfo.task[2][4] = countrynum  - 1
end

RoleTaskInfo50036 =
{
	countryList = {"天","火","水","沙","风","花"},
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{RoleTaskInfo50036_Item_Num,{}},
		},
		task = {s_taskGather,{357,357,55145,1,0,0}},
	},
}

function RoleTaskInfo50036:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87 * (50 + 0.1*level^2.2) * 2
	return math.floor(exp)
end

--任务奖励
function RoleTaskInfo50036:TaskReward(uid, taskid, subtaskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87 * (50 + 0.1*level^2.2) * 2
	s_refreshExp(uid,exp,ExpType_OptionalTask,50036)
	local lastget = s_getVar(uid,10013,4)
	local weeks = s_getCurTime(TIME_CURYWEEKS)
	if weeks ~= lastget then
		s_addVar(uid,10013,4,weeks)
		s_addItem(uid,55146,3,1,0,"1-1","免费参团卡")
		s_sysInfo(uid,"完成出国巡游任务，获得了一张免费参团卡！")
	end
end

function RoleTaskInfo50036:GetSubTaskPromptText(uid, taskid, subtaskid)
	local msg = [["   请向各国的国内情报员获得旅游快报后交给我吧！需要交付$1个旅游快报。"
	]]	
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	local list = pack(s_getCountryList())
	local countrynum = table.getn(list)
	if countrynum < 2 then countrynum = 2 end
	local value = countrynum - 1
	msg = FormatString(msg,value)
	return msg
end

function RoleTaskInfo50036:GetTaskTraceText(uid)
	local list = pack(s_getCountryList())
	local countrynum = table.getn(list) - 1
	local subid = s_getTaskVar(uid,50036,MvarIndex_SubTask)
	local taskProcess = s_getTaskValue(uid,50036, TaskValue_Process)
	local msg = [[<p>
		<n></n>
		</p>
		]]	
	if countrynum == 5 and s_getTaskVar(uid,50036,12) == 1 and s_getTaskVar(uid,50036,13) == 1 and s_getTaskVar(uid,50036,14) == 1 and
		s_getTaskVar(uid,50036,15) == 1 and s_getTaskVar(uid,50036,16) == 1 then
		msg = [[<p><n>   已巡游全部国家</n><newline/>
		<n>  回复</n><goto id='357' mapid='5' flagpoint='1' />
		</p>
		]]	
	elseif s_getTaskVar(uid,50036,12) == 1 and s_getTaskVar(uid,50036,13) == 1 and s_getTaskVar(uid,50036,14) == 1 and
		s_getTaskVar(uid,50036,15) == 1 and s_getTaskVar(uid,50036,16) == 1 and s_getTaskVar(uid,50036,17) == 1 then
		msg = [[<p><n>   已巡游全部国家</n><newline/>
		<n>  回复</n><goto id='357' mapid='5' flagpoint='1' />
		</p>
		]]
	else
		msg = [[<p><n>   每日19-20点通过</n><goto id='126' mapid='7' flagpoint='1' />
		<newline/><n>  去各国找</n><goto id='60187' mapid='7' flagpoint='1' /><newline/>
		<n>  收集各国的旅游快报</n><newline/>
		<n>  $1</n>
		</p>
		]]
	end
	local country2,country3,country4,country5,country6,country7 = "","","","","","",""
	local country = ""
	if s_getTaskVar(uid,50036,12) ~= 1 then country2 = RoleTaskInfo50036.countryList[1] end
	if s_getTaskVar(uid,50036,13) ~= 1 then country3 = RoleTaskInfo50036.countryList[2] end
	if s_getTaskVar(uid,50036,14) ~= 1 then country4 = RoleTaskInfo50036.countryList[3] end
	if s_getTaskVar(uid,50036,15) ~= 1 then country5 = RoleTaskInfo50036.countryList[4] end
	if s_getTaskVar(uid,50036,16) ~= 1 then country6 = RoleTaskInfo50036.countryList[5] end
	if s_getTaskVar(uid,50036,17) ~= 1 then country7 = RoleTaskInfo50036.countryList[6] end
	if countrynum == 5 then country7 = "" end
	if country2 == nil then country2 = "" end
	if country3 == nil then country3 = "" end
	if country4 == nil then country4 = "" end
	if country5 == nil then country5 = "" end
	if country6 == nil then country6 = "" end
	if country7 == nil then country7 = "" end
	country = string.format("未巡游国家：%s%s%s%s%s%s",country2,country3,country4,country5,country6,country7);
	msg = FormatString(msg,country)
	return msg
end

