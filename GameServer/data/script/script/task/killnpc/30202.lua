RoleTaskInfo30202 = {}

function RoleTaskInfo30202:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 100 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
