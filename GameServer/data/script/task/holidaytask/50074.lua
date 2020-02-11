--饮水不忘掘井人

RoleTaskInfo50074 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{367,368,6,0}},
	},

}



function RoleTaskInfo50074:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 100 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
