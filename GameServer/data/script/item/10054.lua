--随机传送石
function OnUseItemEvent_10054(uid,thisid)
    if s_canGoto(uid) == VALUE_FAIL then
        s_sysInfo(uid,"当前地图不能使用随机",ChatPos_Tips)
        return;
    end
    if s_hasTask(uid,31104) == VALUE_OK  or s_hasTask(uid,31103) == VALUE_OK or s_hasTask(uid,31102) == VALUE_OK or  s_hasTask(uid,31102) == VALUE_OK then
        s_sysInfo(uid,"正在押镖中，不允许进行随机", ChatPos_Tips)
        return VALUE_FAIL;
    end

	local mapid = s_getUserMapId(uid)
	if mapid == 210 or mapid == 211 or mapid == 212 then
		s_debugUser(uid, "在多人副本中,无法使用随机传送石")
		s_sysInfo(uid, "在多人副本中,无法是使用随机传送石", ChatPos_Tips)
		return VALUE_FAIL
	end

    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10054") ~= VALUE_OK then
        return VALUE_FAIL;
    end
	s_goto(SCENE_ENTRY_PLAYER,uid,1,1,99)
    return VALUE_OK
end
