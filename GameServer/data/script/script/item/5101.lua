--经验石
function OnUseItemEvent_5101(uid,thisid,targetid, number)
    	s_debugUser(uid,">>>>出售矿石thisid = "..thisid)
	s_debugUser(uid,">>>>出售矿石targetid = "..targetid)	
		
	local userlevel = s_getUserLevel(uid)
	s_debugUser(uid,">>>>出售矿石userlevel = "..userlevel)
	if userlevel < 60 then
		s_sysInfo(uid, "等级不够，请到60级再来使用", ChatPos_Tips)
		return
	end
	local snum = number
	 s_debugUser(uid,">>>>出售矿石 snum = "..snum)
	if snum == 0 then
		s_sysInfo(uid, "客户端发送数据有误", ChatPos_Tips)
		return
	end
	local basexp = 5000000
	local allexp = s_getItemValue(uid,thisid,Item_Attribute_expstone)
	if allexp < basexp then
		s_sysInfo(uid, "请储存满经验再来使用", ChatPos_Tips)
		return
	end

	local usenum = 0
	local usenum1 = s_getVar(uid,140,86)
	local usenum2 = s_getVar(uid,140,88)
	local usenum3 = s_getVar(uid,140,89)
	local usenum4 = s_getVar(uid,140,90)
	if (usenum1 + usenum2 + usenum3 + usenum4) > 20 then
		s_sysInfo(uid, "今日使用次数已达上限", ChatPos_Tips)
		return
	end
	s_debugUser(uid,">>>>当天使用经验石次数 usenum3 = "..usenum3)
	if snum == 1 then
		usenum = usenum1
	elseif snum == 2 then
		usenum = usenum2
	elseif snum == 8 then
		usenum = usenum3
	elseif snum == 16 then
		usenum = usenum4
	end
	

	local stemp = 0
	if usenum == 0 then
		stemp = 1
	elseif usenum == 1 then
		stemp = 2
	elseif usenum == 2 then
		stemp = 3
	else
		stemp = 4
	end
	local ntype = 0
	local viplevel = s_getVIPLevel(uid)
	s_debugUser(uid,">>>>出售矿石viplevel = "..viplevel)
	if snum == 1 then
		ntype = 1
	elseif snum == 2 then
		if stemp == 1 then
			if viplevel >= 1 then
			else
				s_sysInfo(uid, "VIP1以上才可领取", ChatPos_Tips)
				return
			end
		elseif stemp == 2 then
			if viplevel >= 2 then
                        else
                                s_sysInfo(uid, "VIP2以上才可领取", ChatPos_Tips)
                                return
                        end
		elseif stemp == 3 then
			if viplevel >= 4 then
                        else
                                s_sysInfo(uid, "VIP4以上才可领取", ChatPos_Tips)
                                return
                        end
		elseif stemp == 4 then
                		if s_removeMoney(uid,MoneyType_Gold,10,"购买十字镐") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
                		return
        		end
		end
		ntype = 2
	elseif snum == 8 then
		s_debugUser(uid,">>>>>>>>>>>>八倍VIP611111111")
		s_debugUser(uid,">>>>>>>>>>>>八倍VIP611111111 stemp = "..stemp)
		if stemp == 1 then
			s_debugUser(uid,">>>>>>>>>>>>第一次八倍VIP211111111")
			if s_removeMoney(uid,MoneyType_Gold,50,"经验石扣除") ~= VALUE_OK then
				s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
				return
			end
		elseif stemp == 2 then
			if viplevel >= 2 then
				if s_removeMoney(uid,MoneyType_Gold,50,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP2以上才可领取", ChatPos_Tips)
				return
			end
		elseif stemp == 3 then
			s_debugUser(uid,">>>>>>>>>>>>八倍VIP6")
			if viplevel >= 2 then
				if s_removeMoney(uid,MoneyType_Gold,50,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP2以上才可领取", ChatPos_Tips)
				return
			end
		else
			s_debugUser(uid,">>>>>>>>>>>>八倍VIP6999999999999999999999")
			if viplevel >= 2 then
				if s_removeMoney(uid,MoneyType_Gold,50,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP2以上才可领取", ChatPos_Tips)
				return
			end
		end
		ntype = 8
	elseif snum == 16 then
		if stemp == 1 then
			if s_removeMoney(uid,MoneyType_Gold,98,"经验石扣除") ~= VALUE_OK then
				s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
				return
			end
		elseif stemp == 2 then
			if viplevel >= 3 then
				if s_removeMoney(uid,MoneyType_Gold,98,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP3以上才可领取", ChatPos_Tips)
				return
			end
		elseif stemp == 3 then
			if viplevel >= 4 then
				if s_removeMoney(uid,MoneyType_Gold,98,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP4以上才可领取", ChatPos_Tips)
				return
			end
		else
			if viplevel >= 4 then
				if s_removeMoney(uid,MoneyType_Gold,98,"经验石扣除") ~= VALUE_OK then
					s_sysInfo(uid,"元宝不足，不能使用",ChatPos_Tips)
					return
				end
			else
				s_sysInfo(uid, "VIP4以上才可领取", ChatPos_Tips)
				return
			end
		end
		ntype = 16
	end
	local exp = ntype * basexp;
	if snum == 1 then
		s_setVar(uid,140,86,s_getVar(uid,140,86) + 1)
	elseif snum == 2 then
		s_setVar(uid,140,88,s_getVar(uid,140,88) + 1)
	elseif snum == 8 then
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进入存储了")
		s_setVar(uid,140,89,s_getVar(uid,140,89) + 1)
	elseif snum == 16 then
		s_setVar(uid,140,90,s_getVar(uid,140,90) + 1)
	end

	--[[local snnum = 0

	local itemlist1 = {}
        itemlist1 = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
        if itemlist1 ~= nil and table.getn(itemlist1) > 0 then
                for i, m in ipairs(itemlist1) do
                        local expnum = s_getItemValue(uid,m,Item_Attribute_expstone)
                        if expnum >= 5000 then
				snnum = snnum + 1
				s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>是最后一个 snnum111111111 = "..snnum)
                        end
                end
        end
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>是最后一个 snnum = "..snnum)
	if snnum == 1 then
		s_setVar(uid,140,91,1)
	else
		s_setVar(uid,140,91,0)
	end]]--
		
	local sthisnum = 0
	sthisnum = s_getVar(uid,140,91)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>是最后一个 sthisnum = "..sthisnum)
	if sthisnum == 1 then
		s_debugUser(uid,">>>>>>>>>是最后一个")
		sendexptype(uid)
	end
	if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_5101") ~= VALUE_OK then
		s_sysInfo(uid, "删除道具失败", ChatPos_Tips)
		return VALUE_FAIL
	end

	sendexptype(uid)
	--[[local itemlist = {}
	itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		for i, m in ipairs(itemlist) do
			local expnum = s_getItemValue(uid,m,Item_Attribute_expstone)
			if expnum >= 5000 then
				sendexptype(uid)
			end
		end
	end]]--
	s_refreshExp(uid,exp,ExpType_Stone,0)
	--[[if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_5101") ~= VALUE_OK then
        	s_sysInfo(uid, "删除道具失败", ChatPos_Tips)
		return VALUE_FAIL
    	end]]--
	--s_setVar(uid,140,85,s_getVar(uid,140,85) - 5000000)	
    	return VALUE_OK
end
