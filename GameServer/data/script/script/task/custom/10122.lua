local Task10122_EquipIDSet = {14100, 14101, 14102, 14103, 14200, 14201, 14202, 14203}
function RoleTaskInfo10122_check(uid, taskid, subtaskid, paramlist)
	if s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10122_EquipIDSet) ~= VALUE_FAIL then
		return VALUE_OK
	end
	s_sysInfo(uid,"您当前身上没有装备符合要求的护甲！",ChatPos_Sys + ChatPos_Important)
	return VALUE_FAIL
end

function RoleTaskInfo10122_finish(uid, taskid, subtaskid, paramlist)
	local equipthisid = s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10122_EquipIDSet)
	if equipthisid == 0 then
		return VALUE_FAIL
	end
	local equipid = s_getitembaseid(uid,equipthisid)
	if equipid == 0 then
		return VALUE_FAIL
	end
	local armytype = s_getEquipType(equipid)
	s_sysInfo(uid,"armytype = " .. armytype)
	if armytype == 1 then
		if s_equipUpToNewBaseID(uid,equipthisid,14103) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	elseif armytype == 2 then
		if s_equipUpToNewBaseID(uid,equipthisid,14203) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	end
end

RoleTaskInfo10122 =
{
	subtasknum = 1,
	subtask1 =
	{
		onfinishcheck1 =
		{
			{ RoleTaskInfo10122_check, {} }
		},
		onfinish =
		{
			{ RoleTaskInfo10122_finish, {} }
		},
	},
}
