RoleTaskInfo30283 =
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
			{s_actionAddItem,{23051,3,20,0,"1-1", "经验药剂（小）"}},
			{s_actionAddItem,{31478,3,1,0,"1-1", "解封石"}},
		},
	},
}

function RoleTaskInfo30283:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 30 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
