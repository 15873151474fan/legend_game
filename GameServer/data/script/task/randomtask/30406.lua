function RoleTaskInfo30406_oncheck(uid, taskid, subtaskid, paramlist)
	local countryid = 0
	countryid = s_getTaskVar(uid,30406,11)
	if countryid == nil or countryid == 0 then
		return	VALUE_FAIL
	end
	local hours = s_getCurTime(TIME_CURHOURS)
	if hours < 12 then
		s_sysInfo(uid,"国外救援任务在12-24点方可进行。",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local curcountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	if curcountry == countryid	then
		return	VALUE_OK
	end
	if paramlist[2] ~= nil then
		s_sysInfo(uid,paramlist[2],ChatPos_Sys + ChatPos_Important)
	end
	return VALUE_FAIL
end

function s_actionGetCountryVar30406_1_15(uid, taskid, subtaskid, paramlist)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local countryid = GetQBTaskTargetCountry(homeland)
	s_addTaskVar(uid,taskid,11,countryid)
end

RoleTaskInfo30406 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{30,100,{30407}},
			{60,100,{30409}},
			{100,100,{30408}},
		},
		accepttext = parseToTalk([[body(    亲爱的player(),我有一个好朋友，叫瑞恩。你知道的，我跟他一起长大的兄弟，平时都是形影不离的。但是，现在已经三天没有看到他了。他一定是出事了！（每日12-24点可前往救援）)]]),
		prompttext = [[   尚未完成任务，请完成任务后，找我交付任务]],
		onacceptcheck1 =
		{
			{s_checkHour,{12,24,"需要在12-24点进行国外救援任务"}},
		},
		onaccept =
		{
			{s_actionGetCountryVar30406_1_15,{}},
		},
		task = {s_taskRandomTask, {0}},
	},
}

--任务A
RoleTaskInfo30407 =
{
	parent = 30406,
	subtasknum = 7,
	subtask1 =
	{
		prompttext = [[   需要找到巡逻的马车。]],
		accepttext = parseToTalk([[body(    亲爱的player(),我有一个好朋友，叫瑞恩。你知道的，我跟他一起长大的兄弟，平时都是形影不离的。但是，现在已经三天没有看到他了。他一定是出事了！（每日12-24点可前往救援）)]]),
		finishtext = parseToTalk([[body(    你是问一个有点傻傻的年轻人吗？三天前倒是遇到过一个，他往沙漠深处走了，你往那个方向找找看。当然，我也不确定他是不是你要找的人。)]]),
		task = {s_taskTalk,{5089,60915}},
	},
	subtask2 =
	{
		prompttext = [[   2无法交付。]],
		accepttext = parseToTalk([[body(    2接取)]]),
		finishtext = parseToTalk([[body(    2交付)]]),
		onacceptcheck1 =
		{
			{s_checkHour,{12,24,"需要在12-24点进行国外救援任务"}},
			{s_checkRoleNoTrafficType, {3, "团魔甲中无法获取巡逻马车情报..."}},
		},
		task = {s_taskCustom, {60915,60917,1 , 0}},
		onfinish =
		{
			{s_taskplay,{8}},
		},
		autofinish = true,
	},
	subtask3 =
	{
		prompttext = [[   3无法交付。]],
		accepttext = parseToTalk([[body(    3接取)]]),
		finishtext = parseToTalk([[body(    3交付)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60920, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60917,60928}},
		autofinish = true,
	},
	subtask4 =
	{
		prompttext = [[   4无法交付。]],
		accepttext = parseToTalk([[body(    4接取)]]),
		finishtext = parseToTalk([[body(    4交付)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60921, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60920, 60928}},
		autofinish = true,
	},
	subtask5 =
	{
		prompttext = [[   5无法交付。]],
		accepttext = parseToTalk([[body(    5接取)]]),
		finishtext = parseToTalk([[body(    5交付)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60922, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60921, 60928}},
		autofinish = true,
	},
	subtask6 =
	{
		prompttext = [[   救出瑞恩了吗？]],
		accepttext = parseToTalk([[body(    6接取)]]),
		finishtext = parseToTalk([[body(    好样的！你把瑞恩救出来了。瑞恩获救了，把这个消息告诉不死老兵吧。他一定想念他的青梅竹马的兄弟了。)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60923, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60922, 60928}},
	},
	subtask7 =
	{
		accepttext = parseToTalk([[body(    )]]),
		finishtext = parseToTalk([[body(    谢谢你救出了我的兄弟！)]]),
		task = {s_taskTalk,{60928,5089}},
	},
}

function RoleTaskInfo30407:GetSubTaskDescText(uid,taskid,subtaskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local text = [[<p>
		<n></n>
		</p>
		]]	
	if subtaskid ==1 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>，在</n><goto pos="156,400" mapid="7" flagpoint="1" taskid="30407"/><n color='GXColorGreen'>的沙漠小镇</n><n>和</n><goto pos="540,75" mapid="7" flagpoint="1" taskid="30407"/><n color='GXColorGreen'>的边境</n><n>之间寻找</n><n color='GXColorGreen'>巡逻马车</n><n>，打探瑞恩的行踪。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<newline/>
			<n>    马车在沙漠小镇与前线速递交车点来回巡逻。</n>			
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			<newline/>
			<n>    在任务过程中有一定几率获得</n><n color='GXColorGreen'>瑞恩的日记（左）或（右）</n><n>。它可以换取不菲的经验奖励。</n>
			</p>]]
			)
	elseif subtaskid ==2 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><goto pos="243,203" mapid="7" flagpoint="1" taskid="30407"/><n> 打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    三天前有一个年轻人来到了遗忘沙漠。他问我帝皇之心在哪，我随便指了一个方向。也许你能在沙漠的深处找到他吧。如果他还活着的话……</n>
			</p>]]
			)
	elseif subtaskid ==3 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第一块</n><goto id="60920" mapid="7" flagpoint="1" taskid="30407"/><n>处，标志方向。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==4 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第二块</n><goto id="60921" mapid="7" flagpoint="1" taskid="30407"/><n>处，标志方向。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==5 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第三块</n><goto id="60922" mapid="7" flagpoint="1" taskid="30407"/><n>处，标志方向。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==6 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第四块</n><goto id="60923" mapid="7" flagpoint="1" taskid="30407"/><n>处标志方向，标记成功后回复</n><goto id="60928" mapid="7" flagpoint="1" taskid="30407"/>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30407"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==7 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    返回本国</n><n color='GXColorGreen'>军乐城</n><n>回复</n><goto id="5089" mapid="5" flagpoint="1" taskid="30407"/>
			<newline/>
			</p>]]
			)
	end
	local countryid = s_getTaskVar(uid,30406,11)
	if countryid ~= nil and countryid ~= 0 then
		local name = s_getCountryName(countryid)
		text = string.gsub(text,"xx",name)
	end
	return text
end

--任务追踪
function RoleTaskInfo30407:GetTaskTraceText(uid)
	local subid = s_getTaskVar(uid,30407,MvarIndex_SubTask)
	local taskProcess = s_getTaskValue(uid,30407, TaskValue_Process)
	local msg = [[<p>
		<n></n>
		</p>
		]]	
	if subid ==1 then
		msg = [[<p>
		<n>  目标：$1</n>
		<newline/>
		<n> 跳转：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>
		<n> 找到</n>
		<goto pos="156,400" mapid="7" taskid="30407"/><n>与</n><goto pos="540,75" mapid="7" taskid="30407"/><n>间巡逻的马车</n>
		</p>
		]]
	elseif subid ==2 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 前往</n>
		<n> </n><goto pos="243,203" mapid="7"  flagpoint="1"/>
		<newline/>
		<n> 打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
		</p>
		]]
	elseif subid ==3 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在第一块</n>
		<n> </n><goto id="60920" mapid="7" flagpoint="1" />	
		<n> 处标志方向</n>
		</p>
		]]	
	elseif subid ==4 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在第二块</n>
		<n> </n><goto id="60921" mapid="7" flagpoint="1" />	
		<n> 处标志方向</n>
		</p>
		]]	
	elseif subid ==5 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在第三块</n>
		<n> </n><goto id="60922" mapid="7" flagpoint="1" />	
		<n> 处标志方向</n>
		</p>
		]]	
	elseif subid ==6 then
		if taskProcess ~= TaskProcess_CanDone then
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 在第四块</n>
			<n> </n><goto id="60923" mapid="7" flagpoint="1" />	
			<n> 处标志方向</n>
			</p>
			]]	
		else
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 回复</n>
			<n> </n><goto id="60928" mapid="7" flagpoint="1" />	
			</p>
			]]	
		end
	elseif subid ==7 then
		msg = [[<p>
		<n>  返回本国</n>
		<newline/>
		<n> 跳转NPC：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>		
		<n> 回复</n>
		<n> </n><goto id="5089" mapid="5" flagpoint="1" />	
		</p>
		]]			
	end
	local countryid = s_getTaskVar(uid,30406,11)
	local name = s_getCountryName(countryid)
	if name == nil then name = "" end
	msg = FormatString(msg,name)
	return msg
end

--任务B
RoleTaskInfo30408 =
{
	parent = 30406,
	subtasknum = 6,
	subtask1 =
	{
		prompttext = [[   需要找到巡逻的马车。]],
		accepttext = parseToTalk([[body(    亲爱的player(),我有一个好朋友，叫瑞恩。你知道的，我跟他一起长大的兄弟，平时都是形影不离的。但是，现在已经三天没有看到他了。他一定是出事了！（每日12-24点可前往救援）)]]),
		finishtext = parseToTalk([[body(    你是问一个有点傻傻的年轻人吗？三天前倒是遇到过一个，他往沙漠深处走了，你往那个方向找找看。当然，我也不确定他是不是你要找的人。)]]),
		task = {s_taskTalk,{5089,60915}},
	},
	subtask2 =
	{
		prompttext = [[   2无法交付。]],
		accepttext = parseToTalk([[body(    2接取)]]),
		finishtext = parseToTalk([[body(    2交付)]]),
		onacceptcheck1 =
		{
			{s_checkHour,{12,24,"需要在12-24点进行国外救援任务"}},
			{s_checkRoleNoTrafficType, {3, "团魔甲中无法获取巡逻马车情报..."}},
		},
		task = {s_taskCustom, {60915,60917,1 , 0}},
		onfinish =
		{
			{s_taskplay,{8}},
		},
		autofinish = true,
	},
	subtask3 =
	{
		prompttext = [[   3无法交付。]],
		accepttext = parseToTalk([[body(    3接取)]]),
		finishtext = parseToTalk([[body(    3交付)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60924, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60917,60928}},
		autofinish = true,
	},
	subtask4 =
	{
		prompttext = [[   4无法交付。]],
		accepttext = parseToTalk([[body(    4接取)]]),
		finishtext = parseToTalk([[body(    4交付)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60925, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60920, 60928}},
		autofinish = true,
	},
	subtask5 =
	{
		prompttext = [[   救出瑞恩了吗？]],
		accepttext = parseToTalk([[body(    5接取)]]),
		finishtext = parseToTalk([[body(    好样的！你把瑞恩救出来了。瑞恩获救了，把这个消息告诉不死老兵吧。他一定想念他的青梅竹马的兄弟了。)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60926, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60921, 60928}},
	},
	subtask6 =
	{
		accepttext = parseToTalk([[body(    )]]),
		finishtext = parseToTalk([[body(    谢谢你救出了我的兄弟！)]]),
		task = {s_taskTalk,{60928,5089}},
	},
}

function RoleTaskInfo30408:GetSubTaskDescText(uid,taskid,subtaskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local text = [[<p>
		<n></n>
		</p>
		]]	
	if subtaskid ==1 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>，在</n><goto pos="156,400" mapid="7" flagpoint="1" taskid="30408"/><n color='GXColorGreen'>沙漠小镇</n><n>和</n><goto pos="540,75" mapid="7" flagpoint="1" taskid="30408"/><n color='GXColorGreen'>边境</n><n>之间寻找</n><n color='GXColorGreen'>巡逻马车</n><n>，打探瑞恩的行踪。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30408"/><n>处进行跳转。</n>
			<newline/>
			<newline/>
			<n>    马车在沙漠小镇与前线速递交车点来回巡逻。</n>			
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			<newline/>
			<n>    在任务过程中有一定几率获得</n><n color='GXColorGreen'>瑞恩的日记（左）或（右）</n><n>。它可以换取不菲的经验奖励。</n>
			</p>]]
			)
	elseif subtaskid ==2 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><goto pos="282,529" mapid="7" flagpoint="1" taskid="30408"/><n> 打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30408"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    三天前有一个年轻人来到了遗忘沙漠。他问我帝皇之心在哪，我随便指了一个方向。也许你能在沙漠的深处找到他吧。如果他还活着的话……</n>
			</p>]]
			)
	elseif subtaskid ==3 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第一块</n><goto id="60924" mapid="7" flagpoint="1" taskid="30408"/><n>处，标志方向。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30408"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==4 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第二块</n><goto id="60925" mapid="7" flagpoint="1" taskid="30408"/><n>处，标志方向。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30408"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==5 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>第三块</n><goto id="60926" mapid="7" flagpoint="1" taskid="30408"/><n>处标志方向，标记成功后回复</n><goto id="60928" mapid="7" flagpoint="1" taskid="30407"/>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30408"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==6 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    返回本国</n><n color='GXColorGreen'>军乐城</n><n>回复</n><goto id="5089" mapid="5" flagpoint="1" taskid="30408"/>
			<newline/>
			</p>]]
			)
	end
	local countryid = s_getTaskVar(uid,30406,11)
	if countryid ~= nil and countryid ~= 0 then
		local name = s_getCountryName(countryid)
		text = string.gsub(text,"xx",name)
	end
	return text
end

--任务追踪
function RoleTaskInfo30408:GetTaskTraceText(uid)
	local subid = s_getTaskVar(uid,30408,MvarIndex_SubTask)
	local taskProcess = s_getTaskValue(uid,30408, TaskValue_Process)
	local msg = [[<p>
		<n></n>
		</p>
		]]	
	if subid ==1 then
		msg = [[<p>
		<n>  目标：$1</n>
		<newline/>
		<n> 跳转：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>
		<n> 找到</n>
		<goto pos="156,400" mapid="7" taskid="30407"/><n>与</n><goto pos="540,75" mapid="7" taskid="30407"/><n>间巡逻的马车</n>
		</p>
		]]
	elseif subid ==2 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 前往</n>
		<n> </n><goto pos="282,529" mapid="7"  flagpoint="1"/>
		<newline/>
		<n> 打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
		</p>
		]]
	elseif subid ==3 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在第一块</n>
		<n> </n><goto id="60924" mapid="7" flagpoint="1" />	
		<n> 处标志方向</n>
		</p>
		]]	
	elseif subid ==4 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在第二块</n>
		<n> </n><goto id="60925" mapid="7" flagpoint="1" />	
		<n> 处标志方向</n>
		</p>
		]]	
	elseif subid ==5 then
		if taskProcess ~= TaskProcess_CanDone then
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 在第三块</n>
			<n> </n><goto id="60926" mapid="7" flagpoint="1" />	
			<n> 处标志方向</n>
			</p>
			]]	
		else
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 回复</n>
			<n> </n><goto id="60928" mapid="7" flagpoint="1" />	
			</p>
			]]	
		end
	elseif subid ==6 then
		msg = [[<p>
		<n>  返回本国</n>
		<newline/>
		<n> 跳转NPC：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>			
		<n> 回复</n>
		<n> </n><goto id="5089" mapid="5" flagpoint="1" />	
		</p>
		]]			
	end
	local countryid = s_getTaskVar(uid,30406,11)
	local name = s_getCountryName(countryid)
	if name == nil then name = "" end
	msg = FormatString(msg,name)
	return msg
end

--任务C
RoleTaskInfo30409 =
{
	parent = 30406,
	subtasknum = 4,
	subtask1 =
	{
		prompttext = [[   需要找到巡逻的马车。]],
		accepttext = parseToTalk([[body(    亲爱的player(),我有一个好朋友，叫瑞恩。你知道的，我跟他一起长大的兄弟，平时都是形影不离的。但是，现在已经三天没有看到他了。他一定是出事了！（每日12-24点可前往救援）)]]),
		finishtext = parseToTalk([[body(    你是问一个有点傻傻的年轻人吗？三天前倒是遇到过一个，他往沙漠深处走了，你往那个方向找找看。当然，我也不确定他是不是你要找的人。)]]),
		task = {s_taskTalk,{5089,60915}},
	},
	subtask2 =
	{
		prompttext = [[   2无法交付。]],
		accepttext = parseToTalk([[body(    2接取)]]),
		finishtext = parseToTalk([[body(    2交付)]]),
		onacceptcheck1 =
		{
			{s_checkHour,{12,24,"需要在12-24点进行国外救援任务"}},
			{s_checkRoleNoTrafficType, {3, "团魔甲中无法获取巡逻马车情报..."}},
		},
		task = {s_taskCustom, {60915,60917,1 , 0}},
		onfinish =
		{
			{s_taskplay,{8}},
		},
		autofinish = true,
	},
	subtask3 =
	{
		prompttext = [[   救出瑞恩了吗？]],
		accepttext = parseToTalk([[body(    3接取)]]),
		finishtext = parseToTalk([[body(    好样的！你把瑞恩救出来了。瑞恩获救了，把这个消息告诉不死老兵吧。他一定想念他的青梅竹马的兄弟了。)]]),
		oncheck =
		{
			{RoleTaskInfo30406_oncheck, {0, "必须在任务目标国标记"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"嗯，就在这里做个标志，瑞恩应该能跟上了。", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"", 34}},
		},
		clicknpc = {60927, 1, 0, 3500, 100, 100},
		task = {s_taskClickNpc, {60917,60928}},
	},
	subtask4 =
	{
		accepttext = parseToTalk([[body(    )]]),
		finishtext = parseToTalk([[body(    谢谢你救出了我的兄弟！)]]),
		task = {s_taskTalk,{60928,5089}},
	},
}

function RoleTaskInfo30409:GetSubTaskDescText(uid,taskid,subtaskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local text = [[<p>
		<n></n>
		</p>
		]]	
	if subtaskid ==1 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><n color='GXColorGreen'>遗忘沙漠</n><n>，在</n><goto pos="156,400" mapid="7" flagpoint="1" taskid="30409"/><n color='GXColorGreen'>沙漠小镇</n><n>和</n><goto pos="540,75" mapid="7" flagpoint="1" taskid="30409"/><n color='GXColorGreen'>边境</n><n>之间寻找</n><n color='GXColorGreen'>巡逻马车</n><n>，打探瑞恩的行踪。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30409"/><n>处进行跳转。</n>
			<newline/>
			<newline/>
			<n>    马车在沙漠小镇与前线速递交车点来回巡逻。</n>			
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			<newline/>
			<n>    在任务过程中有一定几率获得</n><n color='GXColorGreen'>瑞恩的日记（左）或（右）</n><n>。它可以换取不菲的经验奖励。</n>
			</p>]]
			)
	elseif subtaskid ==2 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><goto pos="613,359" mapid="7" flagpoint="1" taskid="30409"/><n>打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30409"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    三天前有一个年轻人来到了遗忘沙漠。他问我帝皇之心在哪，我随便指了一个方向。也许你能在沙漠的深处找到他吧。如果他还活着的话……</n>
			</p>]]
			)
	elseif subtaskid ==3 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    在xx的</n><n color='GXColorGreen'>遗忘沙漠</n><goto id="60927" mapid="7" flagpoint="1" taskid="30409"/><n>处标志方向，标记成功后回复</n><goto id="60928" mapid="7" flagpoint="1" taskid="30409"/>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="30409"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
			)
	elseif subtaskid ==4 then
		text =(
			[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">国外营救</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    返回本国</n><n color='GXColorGreen'>军乐城</n><n>回复</n><goto id="5089" mapid="5" flagpoint="1" taskid="30409"/>
			<newline/>
			</p>]]
			)
	end
	local countryid = s_getTaskVar(uid,30406,11)
	if countryid ~= nil and countryid ~= 0 then
		local name = s_getCountryName(countryid)
		text = string.gsub(text,"xx",name)
	end
	return text
end

--任务追踪
function RoleTaskInfo30409:GetTaskTraceText(uid)
	local subid = s_getTaskVar(uid,30409,MvarIndex_SubTask)
	local taskProcess = s_getTaskValue(uid,30409, TaskValue_Process)
	local msg = [[<p>
		<n></n>
		</p>
		]]	
	if subid ==1 then
		msg = [[<p>
		<n>  目标：$1</n>
		<newline/>
		<n> 跳转：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>
		<n> 找到</n>
		<goto pos="156,400" mapid="7" taskid="30407"/><n>与</n><goto pos="540,75" mapid="7" taskid="30407"/><n>间巡逻的马车</n>
		</p>
		]]
	elseif subid ==2 then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 前往</n>
		<n> </n><goto pos="613,359" mapid="7"  flagpoint="1"/>
		<newline/>
		<n> 打开牢笼救出瑞恩（也有可能触发机关发生其他事件）</n>
		</p>
		]]
	elseif subid ==3 then
		if taskProcess ~= TaskProcess_CanDone then
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 在</n>
			<n> </n><goto id="60927" mapid="7" flagpoint="1" />	
			<n> 处标志方向</n>
			</p>
			]]	
		else
			msg = [[<p>
			<n>  目标国家：$1</n>
			<newline/>
			<n> 回复</n>
			<n> </n><goto id="60928" mapid="7" flagpoint="1" />	
			</p>
			]]	
		end
	elseif subid ==4 then
		msg = [[<p>
		<n>  返回本国</n>
		<newline/>
		<n> 跳转NPC：</n>
		<n> </n><goto id="126" mapid="7" flagpoint="1" />
		<newline/>			
		<n> 回复</n>
		<n> </n><goto id="5089" mapid="5" flagpoint="1" />	
		</p>
		]]			
	end
	local countryid = s_getTaskVar(uid,30406,11)
	local name = s_getCountryName(countryid)
	if name == nil then name = "" end
	msg = FormatString(msg,name)
	return msg
end
--检查接取
--检查是否可以接受任务
function RoleTaskInfo30406:CheckAccept(uid)
	local process = s_getTaskValue(uid,30406,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minLevel = s_getTaskValue(uid,30406,TaskValue_MinLevel)
	local maxLevel = s_getTaskValue(uid,30406,TaskValue_MaxLevel)
	if minLevel ~= nil and minLevel > level then
		return VALUE_FAIL
	end
	if maxLevel ~= nil  and maxLevel < level then
		return VALUE_FAIL
	end
	if CheckRoundAndRing(uid, 30406) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function RoleTaskInfo30406:CheckAcceptTiled1(uid)
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_USABLE_TILED_POINT) < 35 then
		return VALUE_FAIL
	end
	if RoleTaskInfo30406:ShowAcceptVar116_64(uid) == VALUE_FAIL then return end
	return self:CheckAccept(uid)
end

function RoleTaskInfo30406:CheckAcceptTiled3(uid)
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_USABLE_TILED_POINT) < 105 then
		return VALUE_FAIL
	end
	if RoleTaskInfo30406:ShowAcceptVar116_64(uid) == VALUE_FAIL then return end
	return self:CheckAccept(uid)
end
function RoleTaskInfo30406:CheckAcceptTiled4(uid)
	if RoleTaskInfo30406:ShowAcceptVar116_65(uid) == VALUE_FAIL then return end
	return self:CheckAccept(uid)
end

--显示接取
--经验任务
function RoleTaskInfo30406:ShowAcceptVar116_64(uid)
	if s_getVar(uid,116,64) >= 1 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--赏金任务
function RoleTaskInfo30406:ShowAcceptVar116_65(uid)
	if s_getVar(uid,116,65) >= 2 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function RoleTaskInfo30406:ShowAccept(uid)
	local msg = GetSubTaskAcceptText(uid,30406,1)
	local addcall = "RoleTaskInfo30406:AddTask($1)"
	ShowNpcMenuBottomStyle(uid,msg,"接受(3)",addcall,"离开(3)")
end

function RoleTaskInfo30406:ShowAcceptTiled1_1(uid)
	s_addVar(uid, 30406, TvarIndex_TiledTimes, 1)
	s_addVar(uid, 30406, TvarIndex_TiledMode, 1)
	s_addVar(uid, 30406,TvarIndex_TiledMoneyReward, 0)
	self:ShowAccept(uid)
end

function RoleTaskInfo30406:ShowAcceptTiled1_2(uid)
	s_addVar(uid, 30406, TvarIndex_TiledTimes, 1)
	s_addVar(uid, 30406, TvarIndex_TiledMode, 2)
	s_addVar(uid, 30406,TvarIndex_TiledMoneyReward, 0)
	self:ShowAccept(uid)
end

function RoleTaskInfo30406:ShowAcceptTiled3_1(uid)
	s_addVar(uid, 30406, TvarIndex_TiledTimes, 3)
	s_addVar(uid, 30406, TvarIndex_TiledMode, 1)
	s_addVar(uid, 30406,TvarIndex_TiledMoneyReward, 0)
	self:ShowAccept(uid)
end

function RoleTaskInfo30406:ShowAcceptTiled4_1(uid)
	s_addVar(uid, 30406, TvarIndex_TiledTimes, 0)
	s_addVar(uid, 30406, TvarIndex_TiledMode, 0)
	s_addVar(uid, 30406,TvarIndex_TiledMoneyReward, 1)
	self:ShowAccept(uid)
end

function RoleTaskInfo30406:AddTask(uid)
	if RoleTaskInfo30406_CheckTaskTime(uid)	~= VALUE_OK	then
		return VALUE_FAIL
	end
	AddRoleTask(uid,30406)
	--扣体力
	if s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 0 then
		if s_getVar(uid, 30406, TvarIndex_TiledTimes) == 1 then
			s_subValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_USABLE_TILED_POINT, 35)
		elseif s_getVar(uid, 30406, TvarIndex_TiledTimes) == 3 then
			s_subValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_USABLE_TILED_POINT, 105)
		end
		s_addVar(uid,116,64,s_getVar(uid,116,64)+1)
	elseif	s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 1 then
		s_addVar(uid,116,65,s_getVar(uid,116,65)+1)
	end
end

--检查是否显示完成菜单
function RoleTaskInfo30406:CheckFinish(uid)
	local process = s_getTaskValue(uid,30406,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_OK
	end
	return VALUE_FAIL
end
--显示完成菜单
function RoleTaskInfo30406:ShowFinish(uid)
	local process = s_getTaskValue(uid,30406,TaskValue_Process)
	if process == TaskProcess_Doing then
		local doing = s_getTaskValue(uid,30406,TaskValue_PromptText)
		doing = trim(doing)
		ShowNpcMenuBottomStyle(uid,doing,"离开(5)")
	elseif process == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid,30406,1)
		local str = "RoleTaskInfo30406:FinishTask($1)"
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",str,"取消(1)")
	end
end
--完成次数
function RoleTaskInfo30406:OnTaskDailyChanged(uid)
	if s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 0 then
		RefreshTaskDailyInfo(uid, 30089)
	end
end
--交付任务
function RoleTaskInfo30406:TaskReward(uid, taskid, subtaskid)
	--普通奖励
	CommonTaskReward(uid, 30406)
	if s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 0 then
		--经验日经验
		exp = self:GetTaskBaseExp(uid)
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday == 1 then
			local expetra = exp * 0.5
			s_refreshExp(uid,expetra,ExpType_OptionalTask,30406)
			s_sysInfo(uid,"生存训练日经验加成:" ..math.floor(expetra))
			s_addLuckyCard(uid,1)
		end
		--体力宝箱
		if s_getVar(uid, 30406, TvarIndex_TiledMode) == 2 then
			s_addItem(uid,29303,0,1,0,"1-1","RoleTaskInfo30406")
		end
		--发放获得经验的道具
		Dealtaskexpitem(uid)
		--活力点
		s_addVigorPoint(uid, 16)
		s_debugUser(uid,"完成国外救援，获得16点活力点")
	elseif s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 1 then
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		if  level >= 81 and level < 91 then
			s_addItem(uid,31703,3,1,0,"","80级救援卷轴")
		elseif  level >= 91 and level < 101 then
			s_addItem(uid,31704,3,1,0,"","90级救援卷轴")
		elseif  level >= 101 and level < 111 then
			s_addItem(uid,31705,3,1,0,"","100级救援卷轴")
		elseif  level >= 111 and level < 121 then
			s_addItem(uid,31706,3,1,0,"","110级救援卷轴")
		elseif  level >= 121 and level < 131 then
			s_addItem(uid,31707,3,1,0,"","120级救援卷轴")
		elseif  level >= 131 and level < 141 then
			s_addItem(uid,31708,3,1,0,"","130级救援卷轴")
		elseif  level >= 141 and level < 151 then
			s_addItem(uid,31709,3,1,0,"","140级救援卷轴")
		end
	end
end
---任务经验
function RoleTaskInfo30406:GetTaskBaseExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(250*(50+0.1 * level^2.2))
	return exp
end

function RoleTaskInfo30406:GetTaskExp(uid)
	local exp = self:GetTaskBaseExp(uid)
	if s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 0 then
		local tiledtimes = 1
		if s_getVar(uid, 30406, TvarIndex_TiledMode) == 1 then
			if s_getVar(uid, 30406, TvarIndex_TiledTimes) == 1 then tiledtimes = 1.5 end
			if s_getVar(uid, 30406, TvarIndex_TiledTimes) == 3 then tiledtimes = 2.5 end
		end
		exp = math.floor(exp * tiledtimes)
	elseif s_getVar(uid, 30406, TvarIndex_TiledMoneyReward) == 1 then
		exp = 0
	end
	return exp
end

AppendMenuToNpc(5089,"国外救援- 35体力（1.5倍经验）(2)","RoleTaskInfo30406:ShowAcceptTiled1_1($1)","RoleTaskInfo30406:CheckAcceptTiled1($1)")
AppendMenuToNpc(5089,"国外救援- 35体力（1倍经验+宝箱）(2)","RoleTaskInfo30406:ShowAcceptTiled1_2($1)","RoleTaskInfo30406:CheckAcceptTiled1($1)")
AppendMenuToNpc(5089,"国外救援- 105体力（2.5倍经验）(2)","RoleTaskInfo30406:ShowAcceptTiled3_1($1)","RoleTaskInfo30406:CheckAcceptTiled3($1)")
AppendMenuToNpc(5089,"国外救援- 赏金卷轴(2)","RoleTaskInfo30406:ShowAcceptTiled4_1($1)","RoleTaskInfo30406:CheckAcceptTiled4($1)")
