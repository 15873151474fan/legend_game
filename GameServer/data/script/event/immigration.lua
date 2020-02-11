function OnImmigrationRemoveMoney(uid,moneytype,countrystate,cid,cname)
	if s_getCountryVar(cid,1,97) > 100 then
		s_messageBox(uid,"今日目标国家移民人数已达到上限")
		return VALUE_OK
	end
	local money = 0
	if s_getCountryVar(13,13,138) == 0 then
		if countrystate == CountryStateStrong then
			s_messageBox(uid,"您不能移民到强国去,请选择其他国家！")
			return VALUE_OK
		elseif countrystate == CountryStateNormal then
			money = 5000
		elseif countrystate == CountryStateWeak then
			if s_getCountryVar(cid,1,97) < 100 then
				money = 0
			else
				money = 5000
			end
		end
	end
	local msg = "您确定要移民去"..cname.."吗？需支付费用："..money.."金币"
	local call = "ImmigrationRemoveMoneyEvent($1,$2,"..moneytype..","..money..","..cid..")"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,call,buttons,msg,300)
end

function ImmigrationRemoveMoneyEvent(uid, result, moneytype, money, cid)
	if result ~= Button_Yes then
		return VALUE_FAIL
	end
	if s_getCorpsId(uid) ~= 0 then
		s_sysInfo(uid,"请先退出团再移民")
		return VALUE_FAIL
	end
	if money > 0 and s_removeMoney(uid,moneytype,money,"移民扣除") ~= VALUE_OK then
		s_sysInfo(uid,"金币不足，移民失败！")
		return VALUE_FAIL
	end
	s_addCountryVar(cid,1,97,s_getCountryVar(cid,1,97)+1)
	s_immigration(uid,cid)
	return VALUE_OK
end

function OnLoverImmigrationRemoveMoney(uid,moneytype,countrystate,cid,cname)
	if s_getCountryVar(cid,1,97) > 98 then
		s_messageBox(uid,"今日目标国家移民人数已达到上限")
		return VALUE_OK
	end
	local money = 0
	if s_getCountryVar(13,13,138) == 0 then
		if countrystate == CountryStateStrong then
			s_messageBox(uid,"您不能移民到强国去,请选择其他国家！")
			return VALUE_OK
		elseif countrystate == CountryStateNormal then
			money = 5000*2
		elseif countrystate == CountryStateWeak then
			money = 0
		end
	end
	local msg = "您确定要和您的爱人移民去"..cname.."吗？需支付费用："..money.."金币"
	local call = "TeamImmigrationRemoveMoneyEvent($1,$2,"..moneytype..","..money..","..cid..")"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,call,buttons,msg,300)
end

function TeamImmigrationRemoveMoneyEvent(uid, result, moneytype, money, cid)
	if result ~= Button_Yes then
		return VALUE_FAIL
	end
	local teamsize = s_getTeamSize(SCENE_ENTRY_PLAYER, uid)
	if teamsize ~= 2 then
		s_sysInfo(uid,"需男女2人组队前来办理")
		return VALUE_FAIL
	end
	local toid = 0
	local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,15)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= SCENE_ENTRY_NPC and list[i+1] ~= uid then
			toid = list[i+1]
		end
	end
	if toid == 0 then
		s_sysInfo(uid,"您的恋人不在你身边，请一起前来登记移民哦！")
		return VALUE_FAIL
	end
	local mylover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
	local myspouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
	if toid ~= mylover and toid ~= myspouse then
		s_sysInfo(uid,"您的恋人不在您的队伍里，请一起前来登记移民哦！")
		return VALUE_FAIL
	end
	for i = 1,table.getn(list), 2 do
		if s_getCorpsId(list[i+1]) ~= 0 then
			s_sysInfo(uid,"队伍里有人未退团，请退出团再进行操作")
			return VALUE_FAIL
		end
	end
	if money > 0 and s_removeMoney(uid,moneytype,money,"移民扣除") ~= VALUE_OK then
		return VALUE_FAIL
	end
	for i = 1,table.getn(list), 2 do
		s_immigration(list[i+1],cid)
		s_addCountryVar(cid,1,97,s_getCountryVar(cid,1,97)+1)
	end
	return VALUE_OK
end
