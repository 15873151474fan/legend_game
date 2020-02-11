function RoleTaskInfo10124_check(uid, taskid, subtaskid, paramlist)
	local Task10124_EquipIDSet  = {14100, 14101, 14102, 14103, 14104, 14105, 14200, 14201, 14202, 14203, 14204, 14205}
	if s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10124_EquipIDSet) ~= VALUE_FAIL then
		return VALUE_OK
	end
	s_sysInfo(uid,"您当前身上没有装备符合要求的护甲！",ChatPos_Sys + ChatPos_Important)
	return VALUE_FAIL
end

function RoleTaskInfo10124_finish(uid, taskid, subtaskid, paramlist)
	local Task10124_EquipIDSet  = {14100, 14101, 14102, 14103, 14104, 14105, 14200, 14201, 14202, 14203, 14204, 14205}
	local equipthisid = s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10124_EquipIDSet)
	if equipthisid == 0 then
		return VALUE_FAIL
	end
	local equipid = s_getitembaseid(uid,equipthisid)
	if equipid == 0 then
		return VALUE_FAIL
	end
	local armytype = s_getEquipType(equipid)
	if armytype == 1 then
		if s_equipUpToNewBaseID(uid,equipthisid,14105) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	elseif armytype == 2 then
		if s_equipUpToNewBaseID(uid,equipthisid,14205) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	end
end

RoleTaskInfo10124 =
{
	subtasknum = 1,
	subtask1 =
	{
		onfinishcheck1 =
		{
			{ RoleTaskInfo10124_check, {} }
		},
		onfinish =
		{
			{ RoleTaskInfo10124_finish, {} }
		},
	},
}
