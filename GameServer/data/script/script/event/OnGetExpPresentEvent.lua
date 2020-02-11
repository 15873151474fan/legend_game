--每日一个经验丹
function OnGetExpPresentEvent(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 11 then
		return
	end
	local today = s_getCurTime(TIME_ALLDAYS)
	local day = s_getVar(uid,112,1)
	--领过的
	if day >= today then
		s_sysInfo(uid, "您今天已经领取过了")
		return
	end
	s_addItem(uid,23055,0,1,0,"1-1","每日经验丹")
	s_addVar(uid,112,1,today)
end
