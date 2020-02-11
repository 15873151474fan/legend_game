function OnFieldChangeEvent(uid, ftype, value)
	if ftype == UserVar_PowerOrder then
		if value >= 1 and value <=10 then
			if s_isTitle(SCENE_ENTRY_PLAYER, uid, 48) == 0 then
				s_addTitle(SCENE_ENTRY_PLAYER, uid, 48)
			end
		else
			s_delTitle(SCENE_ENTRY_PLAYER, uid, 48)
		end
	end
	if ftype == UserVar_WorldExamReward then
		s_trace("OnFieldChangeEvent clanexamreward value : "..value)
		if value == 1  then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 50)
		elseif value == 2 then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 51)
		elseif value == 3 then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 52)
		else
		end
		s_setField(uid,UserVar_WorldExamReward,0)
	end
	if ftype == UserVar_ClanExamReward then
		s_trace("OnFieldChangeEvent clanexamreward value : "..value)
		--[[ if value == 1  then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 50)
		elseif value == 2 then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 51)
		elseif value == 3 then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, 52)
		else
		end
		]]
	end
	if ftype == UserVar_NowJoinClear then
		s_trace("UserVar_NowJoinClear value : "..value)
		if value == 1 then
			s_setVar(uid,169,42,0)
			s_setField(uid,UserVar_NowJoinClear,0)
		end
		if value == 99 then
			if s_getVar(uid,169,42) > 0 then
				FinishRoleTask(uid,s_getVar(uid,169,42))
				s_setTaskValue(uid,s_getVar(uid,169,42),TaskValue_Process,0)
				s_delTask(uid,s_getVar(uid,169,42))
				s_setVar(uid,169,42,0)
			end
			s_setField(uid,UserVar_NowJoinClear,0)
		end
	end
	if ftype == UserVar_AvgRebirthLevel	then
		--s_trace("UserVar_avgrebirthlevel value : "..value)
		s_sendAvgRebirthLevelMsg(uid,value)
	end
	if ftype == UserVar_RedPacketSync then
		s_trace("UserVar_RedPacketSync value : "..value)
		s_setField(uid,UserVar_RedPacketSync,value)
		s_setVar(uid,149,38,value)
	end
end
