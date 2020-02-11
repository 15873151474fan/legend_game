--老兵回归奖励
function OnRequestOldSoldierPresent(uid,point,itemid)
	--[[local helperid = s_getField(uid,UserVar_OtherHelpMe)
	if point == 0 then
		s_addItem(uid,32215,3,1,1,"1-1","老兵回归50活力点达成奖励")
		if helperid ~= 0 then
			s_sysMail(helperid,"老兵" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "活力点达到50点赠予您的礼物",0,10,2,"1-1",1)
		end
		s_openSoldierDiary(uid,0,itemid)
	elseif point == 1 then
		s_addItem(uid,27110,3,1,1,"1-1,2-5","老兵回归150活力点达成奖励")
		if helperid ~= 0 then
			s_sysMail(helperid,"老兵" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "活力点达到150点赠予您的礼物",0,10,3,"1-1",1)
		end
		s_openSoldierDiary(uid,0,itemid)
	elseif point == 2 then
		s_addItem(uid,55048,3,1,1,"1-1,7-3","老兵回归300活力点达成奖励")
		if helperid ~= 0 then
			s_sysMail(helperid,"老兵" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "活力点达到300点赠予您的礼物",0,10,5,"1-1",1)
		end
		s_openSoldierDiary(uid,0,itemid)
	elseif point == 3 then
		s_addItem(uid,55107,3,1,1,"1-1","老兵回归500活力点达成奖励")
		if helperid ~= 0 then
			s_sysMail(helperid,"老兵" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "活力点达到500点赠予您的礼物",0,55108,1,"1-1",1)
		end
		s_openSoldierDiary(uid,0,itemid)
	end]]
end
