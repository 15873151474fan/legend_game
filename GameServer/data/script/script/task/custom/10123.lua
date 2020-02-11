local Task10123_EquipIDSet = {14100, 14101, 14102, 14103, 14104, 14200, 14201, 14202, 14203, 14204}
function RoleTaskInfo10123_check(uid, taskid, subtaskid, paramlist)
	if s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10123_EquipIDSet) ~= VALUE_FAIL then
		return VALUE_OK
	end
	s_sysInfo(uid,"您当前身上没有装备符合要求的护甲！",ChatPos_Sys + ChatPos_Important)
	return VALUE_FAIL
end

function RoleTaskInfo10123_finish(uid, taskid, subtaskid, paramlist)
	local equipthisid = s_getPackItemIDInSet(uid,PACKAGETYPE_EQUIP,0,EQUIP_BODY,Task10123_EquipIDSet)
	if equipthisid == 0 then
		return VALUE_FAIL
	end
	local equipid = s_getitembaseid(uid,equipthisid)
	if equipid == 0 then
		return VALUE_FAIL
	end
	local armytype = s_getEquipType(equipid)
	if armytype == 1 then
		if s_equipUpToNewBaseID(uid,equipthisid,14104) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	elseif armytype == 2 then
		if s_equipUpToNewBaseID(uid,equipthisid,14204) then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,5038,1,6,10)
		end
	end
end

RoleTaskInfo10123 =
{
	subtasknum = 1,
	subtask1 =
	{
		onfinishcheck1 =
		{
			{ RoleTaskInfo10123_check, {} }
		},
		onfinish =
		{
			{ RoleTaskInfo10123_finish, {} }
		},
	},
}
