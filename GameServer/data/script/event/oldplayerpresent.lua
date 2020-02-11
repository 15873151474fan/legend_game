--0点清除变量集
function OnOldPlayerPresent(uid,level)
	if s_getVar(uid,10001,32) ~= 0 then
		s_messageBox(uid,"您已经领取过老玩家回归奖励")
		return VALUE_FAIL
	else
		s_addItem(uid,32185,0,1,0,"1-1","老人进新区奖励",0)
		s_addVar(uid,10001,32,1)
	end
	s_sysRight(uid, 2, "老人进新区奖励")
	return VALUE_OK
end
