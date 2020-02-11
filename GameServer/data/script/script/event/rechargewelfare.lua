------------------------------------------
-- 充值福利登陆时显示
------------------------------------------
-- 未充值
-- 1、首充豪礼
-- 2、VIP
-- 3、抢红包
-- 4、首充豪礼，再充
------------------------------------------
-- 已充值
-- 1、首充豪礼
-- 2、今日回馈
-- 3、首充豪礼，再充
-- 4、尊贵特权
-- 5、投资返利
-- 6、超值礼包
-- 7、九折许愿
-- 8、天降神装
-- 9、超高返利
-- 10、圣兽遗宝
-- 11、限时黑市
-- 14、30元首充
-- 1000、最高返利百分比
------------------------------------------

-- 发送充值福利信息
function SendRechargeWelfareInfo(uid)
	local level = s_getUserLevel(uid)
	if level < 25 then
		return
	end

	local totalBuyGold = s_getVar(uid, 1, 4)
	if totalBuyGold == 0 and s_getVar(uid,1,300) == 0 then
		s_sendRechargeWelfareInfo(uid, false, 0, {})
		s_setVar(uid,1,300,1)
		-- SendRechargeWelfareInfoFirst(uid)
	else
--		return
		if totalBuyGold > 0 and s_getVar(uid,1,300) == 0 then
		s_sendRechargeWelfareInfo(uid, true, 0, {})
		-- SendRechargeWelfareInfoMore(uid, totalBuyGold)
		s_setVar(uid,1,300,1)
		end
	end
end

-- 未充值的显示
function SendRechargeWelfareInfoFirst(uid)
	-- 再充??元，获得价值??返利
	-- "{4,??,??}"
	local data = GetNextTodayRewardData(60)
	local needRmb = data.cond1 / 10 - 6
	local str = "{4," .. needRmb .. "," .. (tonumber(data.show) / 10) .. "}"
	local list = {[1] = str}
	s_sendRechargeWelfareInfo(uid, false, 1, list)
end

-- 已充值的显示
function SendRechargeWelfareInfoMore(uid, totalBuyGold)
	local list = {}
	local percent = 0

	-- 充值??元 获得价值??元返利
	-- "{1,??,??}"
	local todayBuyGold = s_getVar(uid, 1, 13)
	local todayData = GetNextTodayRewardData(todayBuyGold)
	if todayData ~= nil then
		local needRmb = (todayData.cond1 - todayBuyGold) / 10
		local str = "{1," .. needRmb .. "," .. (tonumber(todayData.show) / 10) .. "}"
		table.insert(list, str)
		percent = todayData.value * 100 / todayData.cond1 + percent
	end

	-- 今日回馈: 每充值??元，返??道具??个
	-- "{2,??,??,??}"
	local feedBackData = GetTodayFeedbackData()
	if feedBackData ~= nil then
		local needRmb = feedBackData.cond1 / 10
		local items = loadstring("return " .. feedBackData.reward)()
		local item = items[1]
		local str = "{2," .. needRmb .. "," .. item[1] .. "," .. item[3] .. "}"
		table.insert(list, str)
		percent = feedBackData.value * 100 / feedBackData.cond1 + percent
	end

	-- 再充??元，获得价值??返利
	-- "{3,??,??}"
	local totalData = GetNextAccumulateRewardData(totalBuyGold)
	if totalData ~= nil then
		local needRmb = (totalData.cond1 - totalBuyGold) / 10
		local str = "{3," .. needRmb .. "," .. (tonumber(totalData.show) / 10) .. "}"
		table.insert(list, str)
		percent = totalData.value * 100 / totalData.cond1 + percent
	end

	-- 尊贵特权
	-- {4}
	local cardIndex = s_getVar(uid, 149, 15)
	if cardIndex == 0 then
		table.insert(list, "{4}")
		-- 金卡800%，银卡390%
		percent = 800 + percent
	end

	-- 投资返利
	-- {5}
	local investment = { s_getVar(uid, 177, 1), s_getVar(uid, 177, 2), s_getVar(uid, 177, 3) }
	if investment[1] == 0 or investment[2] == 0 or investment[3] == 0 then
		table.insert(list, "{5}")
		-- 一档-180%、二挡-280%、三档-500%
		if investment[1] == 0 then
			percent = 180 + percent
		end
		if investment[2] == 0 then
			percent = 280 + percent
		end
		if investment[3] == 0 then
			percent = 500 + percent
		end
	end

	-- 超值礼包：初级礼包、高级礼包、特级礼包
	-- {6}
	local gift = { s_getVar(uid, 220, 0), s_getVar(uid, 221, 0), s_getVar(uid, 222, 0) }
	if gift[1] == 0 or gift[2] == 0 or gift[3] == 0 then
		table.insert(list, "{6}")
		-- 一档-150%、二挡-200%、三档-300%
		if gift[1] == 0 then
			percent = 150 + percent
		end
		if gift[2] == 0 then
			percent = 200 + percent
		end
		if gift[3] == 0 then
			percent = 300 + percent
		end
	end

	local holidayState = GetHolidayState()
	-- 7、九折许愿
	-- {7}
	if holidayState[5] then
		table.insert(list, "{7}")
	end

	-- 8、天降神装
	-- {8}
	if holidayState[6] then
		table.insert(list, "{8}")
	end

	-- 9、超高返利
	-- {9}
	if holidayState[7] then
		table.insert(list, "{9}")
	end

	-- 10、圣兽遗宝
	-- {10}
	if holidayState[9] then
		table.insert(list, "{10}")
	end

	-- 11、限时黑市
	-- {11}
	if holidayState[10] then
		table.insert(list, "{11}")
	end

	-- 14、30元首充
	-- {14}
	if s_getVar(uid, 230, 1) < 300 then
		table.insert(list, "{14}")
	end

	-- 最高返利百分比
	-- {1000,??}
	percent = math.ceil(percent)
	local str = "{1000," .. percent .. "}"
	table.insert(list, str)

	s_sendRechargeWelfareInfo(uid, true, #list, list)
end

function GetHolidayState()
	-- 九折许愿、天降神装、超高返利、圣兽遗宝、限时黑市
	local subtypes = {[5]=0, [6]=0, [7]=0, [9]=0, [10]=0}
	local activitys = {}
	for _, data in pairs(PayDataBase) do
		if type(data) == "table" and data.maintype == 3 and subtypes[data.subtype] == 0 then
			subtypes[data.subtype] = data.index
			table.insert(activitys, data.index)
		end
	end

	local stateTab = s_getHolidayWelfareState(#activitys, activitys)
	for i, v in ipairs(stateTab) do
		if v == 1 then
			for subtype, activityid in pairs(subtypes) do
				if activityid == activitys[i] then
					subtypes[subtype] = true
				end
			end
		end
	end

	for k,v in pairs(subtypes) do
		if v ~= true then
			subtypes[k] = false
		end
	end
	return subtypes
end

-- 充值返利下一级累积充值数据
function GetNextAccumulateRewardData(totalBuyGold)
	local tab = nil
	for _, data in pairs(PayDataBase) do
		if type(data) == "table" and data.maintype == 1 and data.subtype == 2 and data.cond1 > totalBuyGold then
			if tab == nil or data.cond1 < tab.cond1 then
				tab = data
			end
		end
	end
	return tab
end

-- 充值返利下一级今日充值数据
function GetNextTodayRewardData(todayBuyGold)
	local tab = nil
	for _, data in pairs(PayDataBase) do
		if type(data) == "table" and data.maintype == 1 and data.subtype == 1 and data.cond1 > todayBuyGold then
			if tab == nil or data.cond1 < tab.cond1 then
				tab = data
			end
		end
	end
	return tab
end

-- 今日回馈数据
function GetTodayFeedbackData()
	local week = s_getCurTime(5)
	for _, data in pairs(PayDataBase) do
		if type(data) == "table" and data.maintype == 6 and data.subtype == 24 and week == data.cond2 then
			return data
		end
	end
end

