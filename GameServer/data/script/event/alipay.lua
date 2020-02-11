--排行榜奖励发放
function OnAlipayViptEvent(uid,viptype)
	if s_getVar(uid,10003,1) ~= 0 then
		s_sysInfo(uid,"已经领取支付宝金账户奖励！",ChatPos_Sys + ChatPos_Important)
		return
	end
	if viptype >= 1 then
		s_addVar(uid,10003,1,1)
		s_addItem(uid,32024,0,1,0,"1-1","支付宝金账户")
	end
end
