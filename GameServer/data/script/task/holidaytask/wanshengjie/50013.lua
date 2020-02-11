function s_actionGetCountryVar50013_1_15(uid, taskid, subtaskid, paramlist)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local countryid = GetQBTaskTargetCountry(homeland)
	s_addTaskVar(uid,taskid,11,countryid)
end

RoleTaskInfo50013 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{s_actionGetCountryVar50013_1_15,{}},
			{s_actionAddItem,{55026, 3, 1, 0, "1-1", "杰克灯"}},
		},
		task = {s_taskCustom, {337,337,1 , 0}},
	},
}

function RoleTaskInfo50013:GetSubTaskDescText(uid,taskid,subtaskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local text =(
		[[
			<p>
			<newline/>
			<n font="3" color="GXColorYellow">[节日]杰克灯的回忆</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务进程：</n>
			<newline/>
			<n>    去xx的</n><n color='GXColorGreen'>遗忘沙漠小镇</n><n>，在</n><goto pos="120,399" mapid="7" flagpoint="1" taskid="50013"/><n>小镇附近使用</n><n color='GXColorGreen'>杰克灯</n><n>。</n>
			<newline/>
			<n>    出国可以在</n><goto id="126" mapid="7" flagpoint="1" taskid="50013"/><n>处进行跳转。</n>
			<newline/>
			<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/>
			<newline/>
			<n font="3" color="GXColorYellow">任务描述：</n>
			<newline/>
			<n>    国外危险，推荐使用团魔甲出国可保证相对安全。</n>
			</p>]]
		)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local countryid = GetQBTaskTargetCountry(homeland)
	if countryid ~= nil and countryid ~= 0 then
		local name = s_getCountryName(countryid)
		text = string.gsub(text,"xx",name)
	end
	return text
end

--任务追踪
function RoleTaskInfo50013:GetTaskTraceText(uid)
	local taskProcess = s_getTaskValue(uid,50013, TaskValue_Process)
	local msg = [[<p>
		<n></n>
		</p>
		]]	
	if taskProcess ~= TaskProcess_CanDone then
		msg = [[<p>
		<n>  目标国家：$1</n>
		<newline/>
		<n> 在</n>
		<n> </n><goto pos="120,399" mapid="7" flagpoint="1" taskid="50013"/>
		<n> 附近使用杰克灯</n>
		</p>
		]]	
	else
		msg = [[<p>
		<n> 返回本国回复</n>
		<n> </n><goto id="337" mapid="3" flagpoint="1" />	
		</p>
		]]	
	end
	local countryid = s_getTaskVar(uid,50013,11)
	local name = s_getCountryName(countryid)
	if name == nil then name = "" end
	msg = FormatString(msg,name)
	return msg
end

function RoleTaskInfo50013:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
