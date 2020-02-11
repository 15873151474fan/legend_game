--祭典系列任务
function s_actionRoleTaskInfo50044_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(32-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50044 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10057, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50044_item,{}},

		},
	},
}


function s_actionRoleTaskInfo50045_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(33-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50045 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10058, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50045_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50046_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(34-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50046 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10059, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50046_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50047_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(35-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50047 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10060, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50047_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50048_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(36-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50048 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10061, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50048_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50049_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(37-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50049 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10062, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50049_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50050_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(38-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50050 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10063, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50050_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50051_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(39-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50051 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10064, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50051_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50052_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(40-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50052 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10065, 40},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50052_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50053_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(41-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50053 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10077, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50053_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50054_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(42-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50054 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10078, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50054_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50055_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(43-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50055 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10079, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50055_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50056_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(44-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50056 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10080, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50056_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50057_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(45-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50057 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10081, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50057_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50058_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(46-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50058 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10088, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50058_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50059_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(47-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50059 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10126, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50059_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50060_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(48-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50060 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10127, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50060_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50061_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(49-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50061 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10128, 80},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50061_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50062_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(50-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50062 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10089, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50062_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50063_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(51-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50063 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10090, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50063_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50064_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(52-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50064 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10091, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50064_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50065_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(53-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50065 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10092, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50065_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50066_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(54-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50066 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10093, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50066_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50067_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(55-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50067 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		-- task =
		-- {
			-- s_taskKillNpc, {135, 135, 10094, 150},
		-- },
		onfinish=
		{
			{s_actionRoleTaskInfo50067_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50068_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(56-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50068 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10095, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50068_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50069_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(57-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50069 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10096, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50069_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50070_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(58-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50070 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10097, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50070_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50071_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(59-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50071 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10099, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50071_item,{}},

		},
	},
}

function s_actionRoleTaskInfo50072_item(uid, taskid, subtaskid, paramlist)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local rand = math.random(1,100)
	if rand <= 25 then
		s_sysInfo(uid,"您获得了奖励")
		s_addItem(uid,31410,3,1,0,"1-1","装备礼盒")
	elseif rand <= 100 then
		s_sysInfo(uid,"您获得了奖励")
	end
	for i=1,(60-level) do
		s_levelup(uid)
	end
end

RoleTaskInfo50072 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck = {
			{s_checkCountryVar,{13,10000,9,1,1}},
		},
		task =
		{
			s_taskKillNpc, {135, 135, 10099, 150},
		},
		onfinish=
		{
			{s_actionRoleTaskInfo50072_item,{}},

		},
	},
}
