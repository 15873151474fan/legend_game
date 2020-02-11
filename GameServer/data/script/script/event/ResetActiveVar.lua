function ResetActiveVar(uid)
	--清除合区充值记录
	local last = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LAST_OFFLINE)
	if last < 1353667835 then
		s_setVar(uid,1,19,0)
	end
end
