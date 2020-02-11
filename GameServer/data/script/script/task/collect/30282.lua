RoleTaskInfo30282 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31457, 0, 1},
		},
		task = {s_taskCollect, {229,229}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31457,1,"删除营养胶囊"}},
			{s_actionAddItem,{26113,3,4,0,"1-1", "经验药剂（中）"}},
			{s_actionAddItem,{31478,3,1,0,"1-1", "解封石"}},
		},
	},
}

function RoleTaskInfo30282:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 30 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
