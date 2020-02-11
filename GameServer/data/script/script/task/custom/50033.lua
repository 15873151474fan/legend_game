RoleTaskInfo50033 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {56000,56000,5 , 0}},
		onacceptcheck1 = {
			{s_checkIntoCopy,{}},
		},
		onaccept =
		{
			{s_actionIntoCopyCustomSingle,{1016,161,119,132}},
		},
		onfinish =
		{
			{s_actionAddBuff,{20275, 1,60*60*12}},
		},
	},
}

function RoleTaskInfo50033:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87* (50 + 0.1*level^2.2)
	return math.floor(exp)
end
