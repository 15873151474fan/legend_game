RoleTaskInfo50014 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck1 =
		{
			{s_checkHour,{18,19,"需要在18-19点才能接取任务"}},
			{s_checkRoleTrafficType, {0, "需要在步行下接取任务，会有变化的哦~"}},
		},
		onacceptcheck =
		{
			{s_checkYearMonthDay,{{2013,{10,{26,31}},{11,{1,4}}}},},
		},
		onaccept =
		{
			{s_actionChangeToNpc,{60939,60*15}},
		},
		onfinish =
		{
			{s_actionChangeToNpc,{0,0}},
		},
		task = {s_taskCustom, {337,337,6 , 0}},
	},
}

function RoleTaskInfo50014:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 43 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end

function RoleTaskInfo50014:Showflower(uid)
	local process = s_getTaskValue(uid,50014,TaskValue_Process)
	if process == TaskProcess_None or process ~= TaskProcess_Doing then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function RoleTaskInfo50014:Dealflower(uid)
	local hours = s_getCurTime(TIME_CURHOURS)
	if hours < 18 or hours >= 19 then
		s_sysInfo(uid,"游行活动在18-19点开始，开始后才可以撒花哦~~",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local cold = 15
	local last = s_getTaskVar(uid,50014,13)
	local now = s_getCurTime(TIME_ALLSECONDS)
	if now <= last or (now - last <= cold) then
		local msg = string.format("  播洒鲜花需要间隔%u秒。",last + cold - now)
		ShowNpcMenuBottomStyle(uid,msg,"确定(3)")
		return
	end
	local callback = "RoleTaskInfo50014:Getflower($1)"
	s_showbar(uid,1500,callback,0,4)
end

function RoleTaskInfo50014:Getflower(uid)
	local process = s_getTaskValue(uid,50014,TaskValue_Process)
	if process == TaskProcess_None then
		return
	end
	local now = s_getCurTime(TIME_ALLSECONDS)
	s_addTaskVar(uid,50014,13,now)
	AddRoleTaskOperate(uid,50014,"播洒鲜花")
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 5 * (50 + 0.1*level^2.2)
	s_refreshExp(uid,exp,ExpType_OptionalTask,50014)
	local smile = {3,6,7,9,10,11}
	local rand = math.random(1,100)
	if rand < 5 then
		local smileid = smile[math.random(1,table.getn(smile))]
		s_smile(uid,uid,smileid)
	elseif rand < 15 then
		s_addbuff(SCENE_ENTRY_PLAYER,uid,5017,1,10)
	end
end
--播洒鲜花
AppendMenuToNpc(60938,"播洒鲜花(2)","RoleTaskInfo50014:Dealflower($1)","RoleTaskInfo50014:Showflower($1)")
