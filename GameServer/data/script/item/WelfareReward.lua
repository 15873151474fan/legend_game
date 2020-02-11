--通用的格式奖励，添加道具之前会判断背包空间，空间不足会添加失败
function GetCommonFormatReward(uid, awarditem, reason, rate, action, cond)
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end
	if rate ~= nil and rate ~= 0 then
		rate = rate - 1
    else
        rate = 0
	end

    if cond == nil then
        cond = 0
    end

	local emptygrid = s_getEmptyBagGridCount(uid)
	local needgrid = 0
	local temp = 0
    local times = 1
	for i, item in ipairs(itemlist) do
        times = getItemRate(uid, item, rate, action, cond)
		temp = s_getNeedBagGridCount(uid, item[1], item[3] * times,true)
		if temp == nil then  -- 职业不符
			item[3] = 0
		else
			needgrid = needgrid + temp
			if needgrid > emptygrid then  -- 空间不足
				s_debugUser(uid, "判断背包空间:"..item[1]..",needgrid="..needgrid..",emptygrid="..emptygrid)
				return 0
			end
		end
	end

	-- 添加物品
	for i, item in ipairs(itemlist) do
		local maxnum = s_getItemMaxnum(item[1]) or 1
        times = getItemRate(uid, item, rate, action, cond)
		if item[3] > 0 and item[3] * times > maxnum and item[1] ~= 5101 then
			s_debugUser(uid, "添加物品时,超过物品最大数 itemid="..item[1]..",num="..(item[3]*times)..",maxnum="..maxnum)
			return 0
		end

		if item[1] >= 10101 and item[1] <= 10107 then
			local curlevel = s_getVar(uid,178,8)
			local newlevel = item[1]-10100
			if curlevel < newlevel then
				s_setViplevel(uid,newlevel)
				VLEpushing(uid,item[1]-10100)
				AddVipExclusiveBuff(uid,curlevel,newlevel)
				FreshVipFreeReliveCount(uid)
				return 1
			else
				s_sysInfo(uid,"您本身VIP等级大于领取的",ChatPos_Tips)
				return 1
			end
		end
	end

	for i, item in ipairs(itemlist) do
		local maxnum = s_getItemMaxnum(item[1]) or 1
        times = getItemRate(uid, item, rate, action, cond)
		if item[3] > 0 then
			s_addItem(uid, item[1], item[2], item[3]*times, item[4], item[5], reason, 0, action)
	        s_debugUser(uid, ""..(reason or "未知原因")..",item="..item[1]..",bnum="..item[3]..",times="..times)
		end
	end
	return 1
end

--获得道具的倍率
--rate为获得倍率
--cond为激活条件
function getItemRate(uid, item, rate, action, cond)
    local times = 1
    if s_isEquip(item[1]) == 0 then
--        if action == AddItemAction_Welfare and item[4] > 0 and s_getVIPLevel(uid) >= cond then
        if action == AddItemAction_Welfare  then
            times = times + item[4] + rate
        else
            times = times + rate
        end
	else
		times = times + rate
    end
    return times
end

-- 添加道具到主背包，空间不足将会发邮件
function GetRewardWithMail(uid, awarditem, reason, rate, checkjob, actiontype)
	s_debugUser(uid, "GetRewardWithMail "..(reason or "未知原因").." 开始:倍数、检查职业:" .. rate .. "," .. tostring(checkjob))
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end

	local times = 1
	if rate ~= nil and rate ~= 0 then
		times = rate
	end
	local action = actiontype or 0

	-- 添加物品
	for i, item in ipairs(itemlist) do
		if checkjob and not s_fitProfession(uid,item[1]) then
			item[3] = 0
		else
			local maxnum = s_getItemMaxnum(item[1])
            --s_debug("s_addItem king itemid,maxnum:" .. item[1] .." , ".. maxnum)
			if maxnum == nil or maxnum < 1 then
				s_error("s_addItem error uid,itemid:" .. uid .. "," .. item[1])
				return
			end
			local total = item[3] * times
            if maxnum == 1 then
                --s_debug("s_addItem king total - " .. total)
                total =  math.ceil(total)
                --s_debug("s_addItem king total - " .. total)
            end
            --s_debug("s_addItem king itemid,num,times:" .. item[1] .." , ".. item[3] .. " , "..times)
            local surplus = 0
			while total > 0 do
				if total <= maxnum then
					surplus = s_addItemToBag(uid, PACKAGETYPE_MAIN, item[1], total, item[4], item[5], reason, action)
					if surplus ~= nil then
						total = surplus
					else
						s_trace("GetRewardWithMail 4444 出错")
					end
					break
				else
					surplus = s_addItemToBag(uid, PACKAGETYPE_MAIN, item[1], maxnum, item[4], item[5], reason, action)
					if surplus == nil then
						s_errorm("GetRewardWithMail 5555 出错")
						break
					elseif surplus > 0 then
						total = total + surplus - maxnum
						break
					else
						total = total - maxnum
					end
				end
			end
			item[3] = total
		end
	end

	local mailitems = {}
	for i, item in ipairs(itemlist) do
		if item[3] ~= 0 then
			table.insert(mailitems,item)
		end
	end

	if #mailitems ~= 0 then
		local subject = reason
		local text = "背包空间不足，部分道具发送到邮箱"
		s_sendMail(uid, subject, text, mailitems, reason)
		s_sysInfo(uid,"背包空间不足，道具已发送至邮箱，请注意查收",ChatPos_Tips)
	end
	s_debugUser(uid, "GetRewardWithMail "..(reason or "未知原因").." 成功")
	return 1
end

-- 通过邮件发送奖励物品
function GetRewardByMail(uid, awarditem, subject, text, rate, checkjob, actiontype)
	s_debug("toID="..uid..",GetRewardByMail item: " .. awarditem .. ", subject:" .. subject .. ", rate:" .. rate)
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end

	if subject == "宗门领地奖励" or subject == "宗门领地宗主奖励" then
		checkjob = false
	end

	local mailitems = {}
	local maxnum = 0
	local num = 0
	for i, item in ipairs(itemlist) do
		if not checkjob or s_fitProfession(uid,item[1]) then
			maxnum = s_getItemMaxnum(item[1]) or 1
			num = item[3] * rate
			if num <= maxnum then
				item[3] = num
				table.insert(mailitems,item)
			else
				item[3] = maxnum
				num =  num - maxnum
				table.insert(mailitems,item)

				while num > 0 do
					local temp = {}
					for i,v in ipairs(item) do
						temp[i] = v
					end
					if num > maxnum then
						temp[3] = maxnum
						num = num - maxnum
					else
						temp[3] = num
						num = 0
					end
					table.insert(mailitems,temp)
				end
			end
		end
	end

	if #mailitems ~= 0 then
		s_sendMail(uid, subject, text, mailitems, subject)
	end
	s_debug("toID="..uid..",GetRewardByMail subject: " .. subject .. " 成功")
	return 1
end

--增加是否判断职业
function CommonRewardConvert(uid, awarditem, index, pos, isprofession)
	if awarditem == nil or uid == 0 then
		return 0
	end

	local itemlist = loadstring("return " .. awarditem)()
	--s_debug("%s ", awarditem)
	if itemlist == nil or table.getn(itemlist) == 0 then
		return 0
	end

	if index == 0 or index > table.getn(itemlist) then
		--s_debug("总数 %d ", table.getn(itemlist))
		return table.getn(itemlist)		--接口返回奖励数目的
	end

    for i = 1,table.getn(itemlist) do
	    local item = itemlist[i]
		if isprofession ~= nil and isprofession == 1 then
			local flag = s_canAddProfessionEquip(uid, item[1])
			if flag ~= nil and flag == 1 then
				if i == index then
					if pos == 1 or pos == 3 or pos == 4 then
						--s_debug("ind = %d pos = %d value= %d", index, pos, item[pos])
						return item[pos];	 --1物品id  3数量 4强化等级
					end

					if pos == 5 then
						local bindstr = string.sub(item[pos], 1, 3)
						if bindstr == "1-1" then
							return 1
						else
							return 0
						end
					end
				end
			end
		else
			if i == index then
				if pos == 1 or pos == 3 or pos == 4 then
					return item[pos];
				end

				if pos == 5 then
					local bindstr = string.sub(item[pos], 1, 3)
					if bindstr == "1-1" then
						return 1
					else
						return 0
					end
				end
			end
		end
    end
	return 0
end

--通用的格式奖励，不进行职业性别，礼包的判断
function GetSysReward(uid, awarditem, reason, strengthen, rate, isbind, oldthisid)
	s_debugUser(uid, "GetSysReward "..(reason or "未知原因")..",strengthe="..(strengthen or 0)..",rate="..(rate or 1).."..awarditem "..(awarditem or " 未知道具").."..oldthisid "..(oldthisid or 0))
	if awarditem == nil then
		return 0
	end

	--s_debug("%s ", awarditem)
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or table.getn(itemlist) == 0 then
		return 0
	end

	local newthisid=0
	local equipsrcid=0
	local newtype=0
	local rolethisid=0
	if oldthisid ~= nil and oldthisid > 0 then
		rolethisid = oldthisid
	end
	local  sraddhp ,sraddsp ,srminpdam ,srmaxpdam ,srminmdam ,
	srmaxmdam ,srmintdam ,srmaxtdam ,srminpdef ,srmaxpdef ,
	srminmdef ,srmaxmdef ,srluckyvalue ,srluckyper ,srluckydefvalue ,
	srluckydef ,srpdefper ,srmdefper ,srintervaldef ,srintervalvalue ,
	srintervaldam ,srintervalrecover ,srintervalvalueaddper ,srhpaddper ,srspaddper ,
	srminmonsteratt ,srmaxmonsteratt ,srmaxmonsterdef ,srminmonsterdef ,srhurtper,srspeed,srtotalscore
	if rolethisid > 0 then
		equipsrcid = rolethisid
		sraddhp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addhp)
		sraddsp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addsp)
		srminpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdam)
		srmaxpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdam)
		srminmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdam)
		srmaxmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdam)
		srmintdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mintdam)
		srmaxtdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxtdam)
		srminpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdef)
		srmaxpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdef)
		srminmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdef)
		srmaxmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdef)
		srluckyvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyvalue)
		srluckyper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyper)
		srluckydefvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydefvalue)
		srluckydef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydef)
		srpdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_pdefper)
		srmdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mdefper)
		srintervaldef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldef)
		srintervalvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalue)
		srintervaldam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldam)
		srintervalrecover = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalrecover)
		srintervalvalueaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalueaddper)
		srhpaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hpaddper)
		srspaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_spaddper)
		srminmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsteratt)
		srmaxmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsteratt)
		srmaxmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsterdef)
		srminmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsterdef)
		srhurtper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hurtper)
		srspeed = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_Horse_Speed)
		srtotalscore = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_TotalScore)
	end

	--s_debug("%s",reason )
	local times = 1
	if rate ~= nil and rate ~= 0 then
		times = rate
	end
	local equbaseid = 0
    for k, item in ipairs(itemlist) do
		local sthen = item[4]
		if strengthen > 0 then
			sthen = strengthen
		end

		local iv = item[5]
		if isbind ~= nil and isbind == 0 then
			iv = "1-0,4-1"
		end

		local maxnum = s_getItemMaxnum(item[1]) or 1
		if item[3] > 0 and item[3] * times > maxnum then
			s_debugUser(uid, "添加物品时,超过物品最大数")
			return 0
		end

		if item[3] > 0 then
		equbaseid = item[1]
		newthisid = s_addItem(uid,item[1],item[2],item[3] * times, sthen , iv,reason)
		end
	end

	if oldthisid ~= nil and oldthisid > 0 then
		local newwashinfo = EquipWashDataBase.query(equbaseid)
		local powerinfo = EquipWashScoreDataBase
		if newwashinfo == nil or powerinfo == nil then
			s_debugUser(uid, "装备合成未找到配置表")
			return 0
		end
		local maxpower = newwashinfo.maxPower
		local totalpower = 0
		local ftotalscore = 0
		for i=1001,1030,1 do
			local tmprate = 0
			if i >= 1003 and i <= 1012 or i >= 1026 and i <=1029 then
				tmprate = s_getItemValue(uid,equipsrcid,i)  * powerinfo[i].ratio * 0.5
			else
				tmprate = s_getItemValue(uid,equipsrcid,i)* powerinfo[i].ratio
			end
			totalpower = totalpower + tmprate
		end
			totalpower = totalpower + s_getItemValue(uid,equipsrcid,1061)
		if maxpower > 0 then
			ftotalscore= math.ceil((totalpower / maxpower) * 10000)
		end
		if ftotalscore > 10000 then
			ftotalscore = 10000
		end
	end
	if newthisid > 0 and rolethisid ~= nil and rolethisid > 0 then
		--[[
		newtype = s_getItemValue(uid,newthisid,-1)
		if newtype == 1 or newtype == 2 or newtype == 3 then
			rolethisid = s_getItemThisID(uid,PACKAGETYPE_EQUIP,0,2)
		elseif newtype == 14 then
			rolethisid = s_getItemThisID(uid,PACKAGETYPE_EQUIP,0,1)
		end]]
		local newequipthisid = newthisid
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_addhp,sraddhp)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_addsp,sraddsp)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minpdam,srminpdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxpdam,srmaxpdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmdam,srminmdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmdam,srmaxmdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_mintdam,srmintdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxtdam,srmaxtdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minpdef,srminpdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxpdef,srmaxpdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmdef,srminmdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmdef,srmaxmdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckyvalue,srluckyvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckyper,srluckyper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckydefvalue,srluckydefvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckydef,srluckydef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_pdefper,srpdefper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_mdefper,srmdefper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervaldef,srintervaldef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalvalue,srintervalvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervaldam,srintervaldam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalrecover,srintervalrecover)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalvalueaddper,srintervalvalueaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_hpaddper,srhpaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_spaddper,srspaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmonsteratt,srminmonsteratt)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmonsteratt,srmaxmonsteratt)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmonsterdef,srmaxmonsterdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmonsterdef,srminmonsterdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_hurtper,srhurtper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_Horse_Speed,srspeed)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_TotalScore,srtotalscore)
		--删除原来物品
		local flag=0
	    local	ret = s_deleteItemByThisID(uid, rolethisid, 1, "装备合成删除")
			if ret == nil or ret == 0 then
				flag = 1
		end
		s_debugUser(uid, "GetSysReward newthisid "..(newthisid or "no thisid").." newtype "..(newtype or " no type ").." rolethisid "..(rolethisid or 0).." del flag "..(flag or 0).." score "..(ftotalscore or 0))
	end

	s_debugUser(uid, "GetSysReward "..(reason or "未知原因").." 成功")
	return 1
end

--获得货币奖励
function GetMoneyReward(uid, award, action, rate)
	if uid == nil or uid == 0 or award == nil or award == "" then
		return 0
	end

	s_debugUser(uid, "GetMoneyReward "..(action or "未知原因"))
	local itemlist = loadstring("return " .. award)()
	if itemlist == nil or table.getn(itemlist) == 0 then
		return 0
	end

	local times = 1
	if rate ~= nil and rate > 0 then
		times = rate
	end

	local moneytype = 0
	for k,item in ipairs(itemlist) do
		if table.getn(item) < 5 then
			s_debug("配置错误")
		end
		--金币
		if item[1] == 19000 then
			moneytype = MoneyType_MoneyTicket
		elseif item[1] == 19003 then
			moneytype = MoneyType_Money
		elseif item[1] == 19004 then
			moneytype = MoneyType_Gold
		end

		if moneytype == 0 then
			s_debug("货币类型不正确, type="..item[1])
			return 0
		end

		s_addMoney(uid, moneytype, item[3] * times, action or "增加货币")
	end
	s_debugUser(uid, "GetMoneyReward "..(action or "未知原因").." 成功")
	return 1
end
function RechargeCodeExchagneThings(uid,sindex)
	--if 1 then return end
	local coin_value = s_getVar(uid,166,2)
	if coin_value < 0 or coin_value > 1200000000 then
		s_trace("充值积分异常,uid,%u,coin,%d",uid,coin_value)
		return
	end
	s_debug("RechargeCodeExchagneThings uid %u sindex %u",uid,sindex)
	local exchangeinfo = PayDataBase.query(sindex)
	if exchangeinfo == nil then
		--s_sysInfo(uid,"积分兑换编号错误",ChatPos_Tips)
		s_debug("充值积分兑换编号错误 uid %u sindex %u",uid,sindex)
		return
	end
	if coin_value < exchangeinfo.cond1 or coin_value > 1200000000 then
		s_sysInfo(uid,"充值积分不足!!!",ChatPos_Tips)
		return
	end

	s_setVar(uid,166,2,coin_value-exchangeinfo.cond1)
	GetRewardWithMail(uid,exchangeinfo.reward,"充值积分兑换道具",1,false,AddItemAction_Task)
end

