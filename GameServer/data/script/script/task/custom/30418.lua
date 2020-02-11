-- 仲夏夜之梦副本内仲夏夜之梦任务
RoleTaskInfo30418 =
{
	subtasknum = 1,
	subtask1 =
	{
	},
}

function RoleTaskInfo30418:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	local color = s_getCorpsVar(corps,1,36)
	local exp = 50*(50+0.1*level^2.2)*color
	if exp == 0 or exp == nil then
		return 1
	end
	return math.floor(exp)
end
