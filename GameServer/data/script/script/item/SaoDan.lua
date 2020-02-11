function ChuanGuangSaoDan(uid, time)

	local data = ChallengeDataBase.query(s_getVar(uid,481,1))
	local i=math.random(1,10000);
	if time == 1 then
		if s_removeMoney(uid, MoneyType_Money,data.cost,"扫荡扣除") ~= VALUE_OK then
			s_debug("heiheihei")
			 s_sysInfo(uid,"绑定元宝不足，无法一键扫荡",ChatPos_Tips)
			 return 0 
		 end
		GetRewardWithMail(uid,data.award1,"一键扫荡",1,true,AddItemAction_ChuanGuang)	
		s_addDailyTargetTime(uid, enumDailySubTargetType_CopySceneTower, 1)
	elseif time == 3 then
		if s_removeMoney(uid, MoneyType_Gold,data.threecost,"扫荡扣除") ~= VALUE_OK then
			 s_sysInfo(uid,"元宝不足，无法一键扫荡",ChatPos_Tips)
			 return 0 
	 	end
		GetRewardWithMail(uid,data.award1,"一键扫荡",3,true,AddItemAction_ChuanGuang)
		s_addDailyTargetTime(uid, enumDailySubTargetType_CopySceneTower, 1)
	end
	if i < data.rate then
		local awarditem2 = data.award3
		GetRewardWithMail(uid, awarditem2, "闯关副本随机奖励", 1, false, 1012)
		return 2
	end
	return 1
end
