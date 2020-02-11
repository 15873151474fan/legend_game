RoleTaskInfo50075 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31541, 0, 1},
		},
		task = {s_taskCollect, {369,369}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31541,1,"删除缘分的祝福"}},
		},
	},
}

function RoleTaskInfo50075:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 100 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
