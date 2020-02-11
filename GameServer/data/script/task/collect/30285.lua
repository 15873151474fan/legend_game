RoleTaskInfo30285 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31459, 0, 1},
		},
		task = {s_taskCollect, {229,229}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31459,1,"删除幸运瓶"}},
			{s_actionAddItem,{31480,3,1,0,"1-1", "占星卡"}},
		},
	},
}

function RoleTaskInfo30285:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 15 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
