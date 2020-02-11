--16选择的化妆
--17队伍人数
RoleTaskInfo50016 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{s_actionSetTaskVar,{50016,16,0}},
			{s_actionSetTaskVar,{50016,17,0}},
		},
		onfinish =
		{
			{s_actionSetTaskVar,{50016,16,0}},
			{s_actionSetTaskVar,{50016,17,0}},
		},
		task = {s_taskCustom, {337,337,1,0}},
	},
}

function RoleTaskInfo50016:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 0
	if 	s_getTaskVar(uid,50016,16) == 1 then
		exp = 57 * (50 + 0.1*level^2.2) * (1 +  s_getTaskVar(uid,50016,17)/6)
	elseif s_getTaskVar(uid,50016,16) == 2 then
		exp = 114 * (50 + 0.1*level^2.2) * (1 +  s_getTaskVar(uid,50016,17)/6)
	end
	return math.floor(exp)
end

