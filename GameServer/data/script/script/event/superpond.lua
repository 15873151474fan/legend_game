-- 获得超级奖池元宝
function GetSuperPondReward(uid, gold)
	s_trace("GetSuperPondReward(uid" .. uid .. ", gold " .. gold .. " )")
	if gold == nil or gold == 0 then
		return
	end
	local subject = "超级奖池"
	local text = "恭喜恭喜！真是天大的喜讯！您在超级奖池中了大奖，获得" .. gold .. "元宝！！，幸福就是来的这么突然，所有资金供您支配，请努力提升自身实力吧！希望您游戏愉快！"
	local mailitems = {{19004,3,gold,0,"1-1"}}
	s_sendMail(uid, subject, text, mailitems, subject)
end

