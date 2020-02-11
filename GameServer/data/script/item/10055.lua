--回城石
function OnUseItemEvent_10055(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10055") ~= VALUE_OK then
        return VALUE_FAIL
    end

    if s_hasTask(uid,31104) == VALUE_OK  or s_hasTask(uid,31103) == VALUE_OK or s_hasTask(uid,31102) == VALUE_OK or  s_hasTask(uid,31102) == VALUE_OK then
        s_sysInfo(uid,"正在押镖中，不允许进行回城", ChatPos_Tips)
        return VALUE_FAIL;
    end

	local mapid = s_getUserMapId(uid)
	if mapid == 210 or mapid == 211 or mapid == 212  then
		s_debugUser(uid, "使用回城石时,正在副本队伍中,不允许进行回城")
		s_sysInfo(uid, "正在多人副本中,不允许进行回城", ChatPos_Tips)
		return VALUE_FAIL
	end
    local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_gomap(uid,country,2,88,53)
	
	
    return VALUE_OK
end
