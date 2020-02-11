-- 获得寻宝排行奖励
function GetMineLotteryRankReward(uid, rank)
	s_trace("GetMineLottoryRankReward 11111111 uid: " .. uid .. ", rank: " .. rank)
	local data = MineLotteryRankDataBase.query(rank)
	if data == nil then
		return 0
	end

	local itemlist = loadstring("return " .. data.reward)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end

	local mailitems = {}
	local maxnum = 0
	local num = 0
	for i, item in ipairs(itemlist) do
		maxnum = s_getItemMaxnum(item[1]) or 1
		num = item[3]
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

	local subject = "寻宝榜奖励"
	local text = nil
	if rank > 100 then
		text = "寻宝榜奖励"
	else
		text = "寻宝榜第" .. rank .. "名奖励"
	end
	if #mailitems ~= 0 then
		s_sendMail(uid, subject, text, mailitems, subject)
		s_trace("GetMineLottoryRankReward 发送寻宝榜邮件")
	end
	return 1
end

--获得是否是高级寻宝
function GetIsSeniorMine(uid)
	local str = "2017-01-19 00:00:00"
	local day = math.floor(s_getUnixTime(str) / 86400)
	local openfirstday = s_getFirstDay()
	local viplevel = s_getVIPLevel(uid)
	s_debugUser(uid, "寻宝时,高级寻宝时间点:"..day..",str="..str..",openday="..openfirstday..",viplevel="..viplevel..",累积次数:"..s_getVar(uid, 170,12))

	if openfirstday < day then
		if viplevel < 15 then
			return 0
		end
	else
    --s_getVar(uid, 170, 12) < 5000
		if viplevel < 15  then
			return 0
		end
	end

	return 1
end


--获得双倍寻宝积分倍率
function GetDoubleMineRate(uid)
	local rate = s_getPayRate(enumPaySubType_DoubleMine, 0)
	if rate == nil or rate == 0 then
		return 1
	end

	return rate
end

--寻宝扣除寻宝劵和元宝
function ReduceItemByMine(uid, minenum, mcost, points)
	local ret = 0
	local mineTable = {}
	GetMineTable(uid, mineTable)
	if mineTable == nil then
		return 0
		--[[s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE1, 0)
		s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE2, 0)
		ret = s_removeMoney(uid, MoneyType_Gold, mcost, "寻宝扣除元宝", AddItemAction_MineLottery)
		if ret ~= nil and ret ~= 0 then
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, points)
			s_setVar(uid, 170, 12, s_getVar(uid, 170, 12) + minenum)
			s_debugUser(uid, "寻宝时,寻宝卷19102的删除个数:0,寻宝卷19105的删除个数:0,寻宝积分="..points..",消耗元宝="..mcost..",寻宝次数="..minenum)
		else
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, 0)
		end
		return ret or 0]]
	end
	local delmine = {}
	local lastAllCnt = 0
	local flag = 0
	for k, t in pairs(mineTable) do
		if t ~= nil and table.getn(t) > 0 then
			for i, m in ipairs(t) do
				if m.num + lastAllCnt >= minenum then
					if minenum > lastAllCnt then
						m.num = minenum - lastAllCnt
						table.insert(delmine, m)
						flag = 1
						break
					end
				else
					table.insert(delmine, m)
					lastAllCnt = lastAllCnt + m.num
				end
			end
			if flag == 1 then
				break
			end
		end
	end
	if table.getn(delmine) == 0 then
		--[[s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE1, 0)
		s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE2, 0)
		ret = s_removeMoney(uid, MoneyType_Gold, mcost, "寻宝扣除元宝", AddItemAction_MineLottery)
		if ret ~= nil and ret ~= 0 then
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, points)
			s_setVar(uid, 170,12, s_getVar(uid, 170, 12) + minenum)
			s_debugUser(uid, "寻宝时,寻宝卷19102的删除个数:0,寻宝卷19105的删除个数:0,寻宝积分="..points..",消耗元宝="..mcost..",寻宝次数="..minenum)
		else
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, 0)
		end
		return ret or 0]]
		return 0
	end

	local additem = {}
	local total = 0
	local cnt1 = 0
	local cnt2 = 0
	local cnt3 = 0
	for i, m in ipairs(delmine) do
		local msg = "将要扣除寻宝劵:qwthisid="..m.qwthisid..",baseid="..m.baseid..",num="..m.num..",strengthen="..m.strengthen..",bind="..m.bind
		s_debugUser(uid, msg)
		ret = s_deleteItemByThisID(uid, m.qwthisid, m.num, "寻宝删除道具")
		if ret == nil or ret == 0 then
			flag = 1
			break
		end

		total = total + m.num
		if m.baseid == 19102 then
			cnt1 = cnt1 + m.num
		end

		if m.baseid == 19105 then
			cnt2 = cnt2 + m.num
		end

		if m.baseid == 19106 then
			cnt3 = cnt3 + m.num
		end

		msg = "删除寻宝劵:qwthisid="..m.qwthisid..",baseid="..m.baseid..",num="..m.num..",strengthen="..m.strengthen..",bind="..m.bind
		s_debugUser(uid, msg)
		table.insert(additem, m)
	end

	if flat == 1 or total < minenum then
		ReduceItemByMineFail(uid, addmine)
		s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE1, 0)
		s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE2, 0)
		s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, 0)
		s_debugUser(uid, "寻宝失败,扣除寻宝卷失败");
		return 0
	end

	--[[local point = 0
	local gold = 0
	if total < minenum then
		ret = s_removeMoney(uid, MoneyType_Gold, (minenum - total) * MINE_COST, "寻宝扣除元宝", AddItemAction_MineLottery)
		if ret == nil or ret == 0 then
			ReduceItemByMineFail(uid, addmine)
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE1, 0)
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE2, 0)
			s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, 0)
			s_debugUser(uid, "寻宝失败,扣除元宝失败");
			return 0
		end

		point = (minenum - total) * MINE_POINTS
		gold = (minenum - total) * MINE_COST
		s_setVar(uid, 170, 12, s_getVar(uid, 170, 12) + (minenum - total))
	end
]]
	s_debugUser(uid, "寻宝时,寻宝卷19102的删除个数:"..cnt1..",寻宝卷19105的删除个数:"..cnt2..",寻宝积分="..(cnt3*MINE_POINTS)..",超级寻宝卷删除个数:"..cnt3)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE1, cnt1)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINE2, cnt2)
	s_setVar(uid, 170,12, s_getVar(uid, 170, 12) + cnt3)
	s_setValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_MINEPOINTS, cnt3*MINE_POINTS)

	return 1
end

function ReduceItemByMineFail(uid, addmine)
	for i, m in ipairs(addmine) do
		local msg = "寻宝失败,返还道具:baseid="..m.baseid..",num="..m.num..",strengthen="..m.strengthen..",bind="..m.bind
		s_debugUser(uid, msg)
		if m.bind == 1 then
			s_addItem(uid, m.baseid, 3, m.num, m.strengthen, "1-1", "寻宝失败返还道具", 0, AddItemAction_MineLottery)
		else
			s_addItem(uid, m.baseid, 3, m.num, m.strengthen, "1-0", "寻宝失败返还道具", 0, AddItemAction_MineLottery)
		end
	end
end

--寻宝检查寻宝卷和元宝
function CheckItemByMine(uid, minenum, mcost)
	--s_debugUser(uid, "寻宝检测是否满足条件")
	local mineTable = {}
	GetMineTable(uid, mineTable)
	if mineTable == nil then
		--return s_checkMoneyByType(uid, MoneyType_Gold, mcost)
		return 0
	end

	local total = 0
	for k, v in pairs(mineTable) do
		if v ~= nil and table.getn(v) > 0 then
			for i, m in ipairs(v) do
				--local msg = "背包中寻宝卷:qwthisid="..m.qwthisid..",baseid="..m.baseid..",num="..m.num..",strengthen="..m.strengthen..",bind="..m.bind
				--s_debugUser(uid,msg)
				total = total + m.num
			end
		end
	end

	--if total == 0 then
	--	return s_checkMoneyByType(uid, MoneyType_Gold, mcost)
	--end

	if total < minenum then
		--return s_checkMoneyByType(uid, MoneyType_Gold, (minenum - total) * MINE_COST)
		return 0
	end

	return 1
end

--获得背包中寻宝劵
function GetMineTable(uid, mineTable)
	--背包中珍贵寻宝卷
	mineTable[19102] = mineTable[19102] or {}
	local itemlist = s_getItemListByBaseID(uid, 19102, PACKAGETYPE_MAIN)
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		for i, m in ipairs(itemlist) do
			local temp = {}
			temp.qwthisid = m
			temp.baseid = 19102
			temp.num = s_getItemValue(uid, m, -8)
			temp.strengthen = s_getItemValue(uid, m, Item_Attribute_StrengthenLv)
			temp.bind = s_getItemValue(uid, m, Item_Attribute_Bind)
			table.insert(mineTable[19102], temp)
		end
	end

	--背包中特级寻宝卷
	mineTable[19105] = mineTable[19105] or {}
	itemlist = {}
	itemlist = s_getItemListByBaseID(uid, 19105, PACKAGETYPE_MAIN)
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		for i, m in ipairs(itemlist) do
			local temp = {}
			temp.qwthisid = m
			temp.baseid = 19105
			temp.num = s_getItemValue(uid, m, -8)
			temp.strengthen = s_getItemValue(uid, m, Item_Attribute_StrengthenLv)
			temp.bind = s_getItemValue(uid, m, Item_Attribute_Bind)
			table.insert(mineTable[19105], temp)
		end
	end

	--背包超级寻宝卷
	mineTable[19106] = mineTable[19106] or {}
	itemlist = {}
	itemlist = s_getItemListByBaseID(uid, 19106, PACKAGETYPE_MAIN)
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		for i, m in ipairs(itemlist) do
			local temp = {}
			temp.qwthisid = m
			temp.baseid = 19106
			temp.num = s_getItemValue(uid, m, -8)
			temp.strengthen = s_getItemValue(uid, m, Item_Attribute_StrengthenLv)
			temp.bind = s_getItemValue(uid, m, Item_Attribute_Bind)
			table.insert(mineTable[19106], temp)
		end
	end

end

local MineBuffTable =
{
	[6401] = 1,
	[6402] = 4,
}

-- 寻宝各档倍率参数
function GetMineRateBase()
	return 1
end

-- 寻宝基本档位
function GetMineBaseStr()
	return "pos7"
end

--寻宝第末档
function GetMinePosEndStr()
	return "pos10"
end

-- 获得档位数
function GetNumBase()
	return table.getn(MineNumConfigDataBase)
end

-- 寻宝获得概率区间
function GetMineRatio(uid, wdays)
	local minecfg = MineConfigDataBase.query(wdays)
	if minecfg == nil then
		s_debugUser(uid, "寻宝时找不到对应的周期配置项,wdays="..wdays)
		return 0
	end

	local numbase = GetNumBase()
	s_debugUser(uid, "寻宝时,区间个数:"..numbase..",周几:"..wdays)

	--倍率参数
	local ratebase = GetMineRateBase()
	local otherbase = 0
	-- 尊贵特权值
	s_debugUser(uid, "寻宝时,尊贵特权值:"..s_getVar(uid, 149,15))
	if s_getVar(uid, 149,15) == 1 then
		otherbase = otherbase + 2
	elseif s_getVar(uid,149,15) == 2 then
		otherbase = otherbase + 0.5
	end

	-- 开服,合服,节假日值
	local subtypes = GetHolidayState()
	if type(subtypes) == "table" and subtypes[6] ~= nil and subtypes[6] then
		s_debugUser(uid, "寻宝时,开服,合服,节假日")
		otherbase = otherbase + 2
		-- minecfg读第七档
		minecfg = MineConfigDataBase.query(7)
	else
		s_debugUser(uid, "寻宝时,其他时间段")
	end

	-- buff值
	for k, v in pairs(MineBuffTable) do
		local bufftime = s_getbufftime(SCENE_ENTRY_PLAYER, uid, k)
		if bufftime > 0 then
			s_debugUser(uid, "buffid="..k..",time="..bufftime)
			otherbase = otherbase + v
		end
	end

	local totalbase = ratebase + otherbase

	local str = "pos"
	local curcfg = {}
	for i = 1, numbase do
		curcfg[str..i] = minecfg[str..i]
	end

	--基本值
	local posstr = GetMineBaseStr()
	local curval = curcfg[posstr]
	local posendstr = GetMinePosEndStr()
	local posendval = curcfg[posendstr]

	s_debugUser(uid, "寻宝基本值:"..posstr..",val="..curval..",末档:"..posendstr..",posendval="..posendval)
	if curval == nil or posendval == nil then
		s_debugUser(uid, "寻宝基本值不合法或末档值设置不合法")
		return 0
	end
	--某档的值
	curcfg[posstr] = curcfg[posstr] * totalbase
	--末档的值
	curcfg[posendstr] = curcfg[posendstr] * totalbase

	--第一档的值
	curcfg.pos1 = curcfg.pos1 - curval * (totalbase - 1) - posendval * (totalbase - 1)
	if curcfg.pos1 < 0 then
		curcfg.pos1 = 0
	end

	local total = 0
	for i = 1, numbase do
		total = total + curcfg[str..i]
	end

	for i = 1, numbase do
		curcfg[str..i] = math.ceil((curcfg[str..i] / total) * 1000000)
	end

	total = 0
	for i = 1, numbase do
		total = total + curcfg[str..i]
		if total < 1000000 then
			curcfg[str..i] = total
		else
			curcfg[str..i] = 1000000
		end
	end

	local msg = ""
	local ratio = {}
	for i = 1, numbase do
		msg = msg..curcfg[str..i]..","
		table.insert(ratio,curcfg[str..i])
	end
	s_debugUser(uid, "寻宝获得概率区间:"..msg)
	s_setMineRatio(uid, numbase, ratio)
	return 1
end

--寻宝概率区间次数修改
--[[function MineRatioVarChange(uid)
	if s_getVar(uid, 170, 13) == 1 then
		s_debugUser(uid, "寻宝概率区间次数已经修改了")
		return
	end

	for i = 1, 9 do
		s_setVar(uid, 170, 20 + i, s_getVar(uid, 170, i + 1))
		s_setVar(uid, 170, 40 + i, s_getVar(uid, 170, i + 6))
	end

	local minenumcfg = MineNumConfigDataBase.query(6)
	if minenumcfg == nil then
		s_debugUser(uid, "寻宝时找不到相应配置")
		return
	end

    local initval = 0
    if minenumcfg["nohitnum"] >= minenumcfg["initnum"] then
	    initval = minenumcfg["nohitnum"] - minenumcfg["initnum"]
	    s_setVar(uid, 170, 49, initval)
    else
        s_setVar(uid, 170, 49, 0)
    end

	s_debugUser(uid, "寻宝概率区间修改值:"..initval)
	s_setVar(uid, 170, 13, 1)
end]]

--寻宝增加第七档
--[[function MineRatioVar7(uid)
	if s_getVar(uid, 170, 14) == 1 then
		s_debugUser(uid, "寻宝第七档已经修改了")
		return
	end

	local minenumcfg = MineNumConfigDataBase.query(7)
	if minenumcfg == nil then
		s_debugUser(uid, "寻宝时找不到相应配置")
		return
	end

	local initval = 0
    if minenumcfg["nohitnum"] >= minenumcfg["initnum"] then
        initval = minenumcfg["nohitnum"] - minenumcfg["initnum"]
        s_setVar(uid, 170, 47, initval)
    else
        s_setVar(uid, 170, 47, 0)
    end

	s_debugUser(uid, "寻宝第七档修改值:"..initval)
	s_setVar(uid, 170, 14, 1)
end]]

function SendExamTaskReward(uid, rewardstr)
	s_trace("SendExamTaskReward  uid: " .. uid .. ", str : " ..rewardstr)
	if rewardstr  == "" then
		return 0
	end
	local itemlist = loadstring("return " .. rewardstr)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end
	local mailitems = {}
	local maxnum = 0
	local num = 0
	for i, item in ipairs(itemlist) do
		maxnum = s_getItemMaxnum(item[1]) or 1
		num = item[3]
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

	local subject = "答题奖励"
	local text = "答题奖励"
	if #mailitems ~= 0 then
		s_sendMail(uid, subject, text, mailitems, subject)
		s_trace("SendExamTaskReward 发送答题榜邮件")
	end
	return 1
end


