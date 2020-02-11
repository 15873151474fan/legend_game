--  充值活动图标top2

--[[
---------------------------------------------------------
pri name        start   finish 				refresh
---------------------------------------------------------
1	圣诞210		true	领取1次首充奖励
2	转盘209		true	领取1次首充奖励
3	首冲豪礼	true	领取1次充值奖励		无
4	投资返利	true	任意投资1次			无
5	特惠礼包	true	购买任意1种礼包		无
6	钻石特权	true	购买任意1种特权		特权结束刷新
7	全民狂欢	--
8	充值返利	true	领取1次首充奖励		1天
--]]

ActivityIcon =
{
	vars =
	{
		--[3] = { p = 3, x = 149, y = 31 },
		[5] = { p = 5, x = 149, y = 32 },
		[6] = { p = 6, x = 149, y = 33 },
--		[9] = { p = 9, x = 149, y = 37 },
	},

	-- (key,value) = (优先级，主类型)
	main_types =
	{
		[1] = 10, -- 圣诞
		[2] = 9,  -- 转盘
		[3] = 2,  -- 首冲豪礼
		[4] = 3,  -- 假日福利
		[5] = 8,  -- 投资返利
		[6] = 5,  -- 特惠礼包
		--[7] = 7,  -- 钻石特权
--		[7] = 3,  -- 全民狂欢
--		[8] = 4,  -- 今日回馈
--		[9] = 1,  -- 充值返利
--		保存
	--	[1] = 9,  -- 转盘
	--	[2] = 2,  -- 首冲豪礼
	--	[3] = 3,  -- 假日福利
	--	[4] = 10, -- 圣诞
	--	[5] = 8,  -- 投资返利
	--	[6] = 5,  -- 特惠礼包
	--	[7] = 7,  -- 钻石特权

	},

--	revelry_priority = 7,
	revelry_priority = 4,
	--month_card_priority = 7,
	week_days = {},
	days = {},
	rechargedays = {},
	onediscount ={},
}

function ActivityIcon:init()
	self.week_days = {}
	self.days = {}
	self.rechargedays= {}
	self.onediscount = {}

	local temp_weeks = {}
	local temp_dates = {}
	local temp_redays = {}--充值积分
	local temp_discount = {}--一折优惠

	-- 全民狂欢数据
	for _, data in pairs(PayDataBase) do
		if type(data) == "table" and data.maintype == 3 then
			if data.wday ~= 0 then
				temp_weeks[data.wday] = true
			end
			if string.len(data.date) > 8 then
					table.insert(temp_dates, data.date)
			end
		end
		if type(data) == "table" and data.maintype == 101 then
			if string.len(data.date) > 8 then
				table.insert(temp_redays, data.date)
			end
		end
		if type(data) == "table" and data.maintype == 102 then
			if string.len(data.date) > 8 then
				table.insert(temp_discount, data.date)
			end
		end
	end

	-- 星期解析
	for week_day, _ in pairs(temp_weeks) do
		local index = 0
		local remainder = 0
		while week_day > 0 do
	        week_day, remainder = math.modf(week_day / 2)
	        if remainder > 0.1 then
	            self.week_days[index] = true
	        end
	        index = index + 1
	    end
	end

	-- 测试代码
	-- for k,v in pairs(self.week_days) do
	-- 	s_debug("全民狂欢星期0-6:" .. tostring(k) .. "," .. tostring(v))
	-- end

	-- 日期解析
	local date_strs = {}
	for _, strs in pairs(temp_dates) do
		for str in string.gmatch(strs, "%d+-%d+-%d+") do
			table.insert(date_strs, str)
		end
	end
	table.sort(date_strs)
	local pre_str = nil
	for i,date_str in ipairs(date_strs) do
		if date_str ~= pre_str then
			pre_str = date_str
			local year,month,day = string.match(date_str, "(%d+)-(%d+)-(%d+)")
			year,month,day = tonumber(year),tonumber(month),tonumber(day)
			local seconds = os.time({year=year, month=month, day=day, hour=0, min=0, sec=1})
		    local day, _ = math.modf(seconds/86400)
		    self.days[day] = true
		end
	end
	local date_reestrs = {}
	for _, strs in pairs(temp_redays) do
		for str in string.gmatch(strs, "%d+-%d+-%d+") do
			table.insert(date_reestrs, str)
		end
	end
	table.sort(date_reestrs)
	local pre_str = nil
	for i,date_str in ipairs(date_reestrs) do
		if date_str ~= pre_str then
			pre_str = date_str
			local year,month,day = string.match(date_str, "(%d+)-(%d+)-(%d+)")
			year,month,day = tonumber(year),tonumber(month),tonumber(day)
			local seconds = os.time({year=year, month=month, day=day, hour=0, min=0, sec=1})
		    local day, _ = math.modf((seconds+86400)/86400)
		    self.rechargedays[day] = true
		end
	end

	local date_newyearstr = {}
	for _, strs in pairs(temp_discount) do
		for str in string.gmatch(strs, "%d+-%d+-%d+") do
			table.insert(date_newyearstr, str)
		end
	end
	table.sort(date_newyearstr)
	local pre_str = nil
	for i,date_str in ipairs(date_newyearstr) do
		if date_str ~= pre_str then
			pre_str = date_str
			local year,month,day = string.match(date_str, "(%d+)-(%d+)-(%d+)")
			year,month,day = tonumber(year),tonumber(month),tonumber(day)
			local seconds = os.time({year=year, month=month, day=day, hour=0, min=0, sec=1})
		    local day, _ = math.modf((seconds+86400)/86400)
		    self.onediscount[day] = true
		end
	end
	-- 测试代码
	-- for k,v in pairs(self.days) do
	-- 	s_debug("全民狂欢日期天:" .. tostring(k) .. "," .. tostring(v))
	-- end
end

-- 全民狂今天是否开启
function ActivityIcon:revelryEnabled()
	local opend = s_getCurTime(14)
	--opend=20
	if opend <= 7  then
		return true
	end
--[[
	local week_day = s_getCurTime(5)
	if week_day == 6 or week_day == 0 then
		return true
	else
		return false
	end
]]
	local week_day = s_getCurTime(5)
	if self.week_days[week_day] then
		return true
	end

	local day = s_getCurTime(12)
	if self.days[day] then
		return true
	end

	return false
end
function ActivityIcon:checkrechargecodeEnabled()
	local day = s_getCurTime(12)
	local serverday = s_getCurTime(14)
     --serverday = 20
	if self.rechargedays[day] and serverday >7 then
		return true
	end
	return false
end
function ActivityIcon:checkNewYearEnabled()
	local day = s_getCurTime(12)
	if self.onediscount[day] then
		return true
	end
	return false
end
function ActivityIcon:christmasEnabled(userid)
	return s_christmasOpend(userid) == 1
end

function ActivityIcon:turntableEnabled(userid)
	local opend = s_getCurTime(14)
       --  opend = 20
	if opend <= 7  then
		return true
	else
		return s_turntableOpend(userid) == 1
	end
	return false
end

function ActivityIcon:zeroClear(userid)
	if s_getVar(uid,149,36) == 0 and s_getVar(uid,149,37) == 0 then
		return
	end
	s_setVar(uid,149,36,0)	-- 今日回馈，设置未完成
	s_setVar(uid,149,37,0)	-- 充值返利，设置未完成
	sendActivityIcons(userid)
end

-- 发送充值活动top2
function sendActivityIcons(userid)
	s_debug("sendActivityIcons userid:" .. userid)
	local userlevel = s_getUserLevel(userid)
	--[[if userlevel < 20 then
		return
	end]]--

	local self = ActivityIcon
	local opens = {}
	for _, var in pairs(self.vars) do
		local open = s_getVar(userid, var.x, var.y)
		if open == 0 and var.y ~= 32 and var.y ~= 33 then
			table.insert(opens, var.p)
		end
		if open == 0 and var.y == 32 and userlevel >70 then
			table.insert(opens, var.p)
		end
		if open == 0 and var.y == 33 and userlevel >= 56 then
			table.insert(opens, var.p)
		end
	end
	if s_getVar(userid,149,15) == 0 then
		table.insert(opens, self.month_card_priority)
	end
	if self:revelryEnabled() and userlevel >=70 then
		table.insert(opens, self.revelry_priority)
	end
	if self:turntableEnabled(userid) or self:checkrechargecodeEnabled() or self:checkNewYearEnabled() then
		if userlevel >= 70 then
			table.insert(opens, 2)
		end
	end
	if self:christmasEnabled(userid) then
		table.insert(opens, 1)
	end
	table.sort(opens)
	local maintype1 = opens[1] or 0
	local maintype2 = opens[2] or 0
	s_trace("bbbbbbbbbfore开启top2充值活动, userid:" .. userid .. "," .. maintype1 .. "," .. maintype2)
	maintype1 = self.main_types[maintype1] or 0
	maintype2 = self.main_types[maintype2] or 0
	local maintype3 = 0
	if s_getVar(userid,149,31) == 0 then
		maintype3 = 2
	end
	s_trace("1111111111111111开启top2充值活动, userid = "..s_getVar(userid,149,31))	
	s_trace("开启top2充值活动, userid:" .. userid .. "," .. maintype1 .. "," .. maintype2 .. "," .. maintype3)
	s_sendActivityIcon(userid,maintype1,maintype2,maintype3)
end

-- 当充值活动状态改变时
function onActivityFinished(userid, maintype)
	s_debug("onActivityFinished userid:" .. tostring(userid) .. ", maintype:" .. tostring(maintype))
	if maintype == 2 then
			if s_getVar(userid,179,20123) > 0 then
				s_setVar(userid,149,31,1)
			end
		sendActivityIcons(userid)
		return
	end

	if maintype == 3 then
		sendActivetyIcons(userid)
		return
	end

	local self = ActivityIcon
	local priority = 0
	for k,v in pairs(self.main_types) do
		if v == maintype then
			priority = k
			break
		end
	end
	if priority == 0 then
		return
	end
	local var = nil
	if priority >=3 and priority <= 5 then
		var = self.vars[priority]
		if var == nil then
			s_debug("onActivityFinished error userid:" .. tostring(userid) .. ", maintype:" .. tostring(maintype))
			return
		end
		if s_getVar(userid, var.x, var.y) ~= 0 then
			return
		end
		s_setVar(userid, var.x, var.y, 1)
	end
	sendActivityIcons(userid)
end

ActivityIcon:init()


function GetPayEntryShow2(totalPay, viplevel,cond1)
	if viplevel >= 8 then
		return 1
	end
	local id3 = 10052
	local id5 = 10056
	local idend = 10076
	if totalPay < PayDataBase[id3].cond1 then
		if cond1 <= PayDataBase[id5].cond1 then
			return 1
		else
			return 0
		end
	else
		local i = id3
		for k = id3, idend, 2 do
			if totalPay < PayDataBase[k].cond1 then
				i = k - 2
				break
			end
		end
		i = i + 4
		if i > idend then
			i = idend
		end
		if cond1 <= PayDataBase[i].cond1 then
			return 1
		else
			return 0
		end
	end
end
--累积充值达到30w的显示条件
local psbaseid = 10064
local psendid = 10076
function GetPayEntryShow(totalPay, cond1)
	if cond1 <= PayDataBase[psbaseid].cond1 then
		return 1
	end

	local i = psbaseid
	if totalPay >= PayDataBase[psbaseid].cond1 then
		for k = psbaseid, psendid, 2 do
			if cond1 == PayDataBase[k].cond1 then
				i = k
				break
			end
		end

		if i == psbaseid then
			return 1
		end

		if totalPay >= PayDataBase[i-2].cond1 then
			return 1
		end
	end

	return 0
end
