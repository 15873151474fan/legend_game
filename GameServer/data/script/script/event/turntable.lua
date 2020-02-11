-- 幸运转盘

-- 抽取奖励道具
function GetTurntableReward(userid)
	InitTurntable(userid)

	local rewardType = GetTurntableRewardType(userid) or 0
	if rewardType == 0 then
		s_error("GetTurntableReward(userid: " .. tostring(userid) .. ")")
		return 0
	end

	local data = GetTurntableRewardByType(rewardType)
	if data ~= nil then
		return data.index
	end
	return 0
end

-- 设置初始值
function InitTurntable(userid)
	if s_getVar(userid, 148, 0) == 1 then
		return
	end
	s_setVar(userid, 148, 0, 1)

	local data = nil
	for i = 1, 8 do
		data = TurntableShowDataBase.query(i)
		if data ~= nil then
			s_setVar(userid, 148, i, data.nodedefault)
		end
	end
end

-- 抽取类型
function GetTurntableRewardType(userid)
	-- 寻找必中奖
	local data = nil
	local index = nil
	local tempnode = nil
	local indexs = {}
	for i = 1, 8 do
		data = TurntableShowDataBase.query(i)
		if data ~= nil and data.node > 0 then
			if s_getVar(userid, 148, i) >= data.node then
				if index == nil or tempnode < data.node then
					index = i
					tempnode = data.node
				end
				indexs[i] = true
			end
		end
	end

	-- 找到必中奖
	if index ~= nil then
		for i = 1, 8 do
			if indexs[i] == true then
				-- 符合条件的必中清0
				s_setVar(userid, 148, i, 0)
			else
				-- 不符的次数+1
				s_setVar(userid, 148, i, s_getVar(userid, 148, i) + 1)
			end
		end
		return index
	end

	-- 参与随机的数据
	local datas = {}
	local totalRate = 0
	for i = 1, 8 do
		data = TurntableShowDataBase.query(i)
		if data ~= nil and s_getVar(userid, 148, i) >= data.nodetwo then
			table.insert(datas, data)
			totalRate = totalRate + data.rate
		end
	end

	if totalRate == 0 then
		return 0
	end

	-- 随机类型
	local rate = math.random(1, totalRate)
	for _,v in ipairs(datas) do
		if rate <= v.rate then
			for i = 1, 8 do
				if i == v.index then
					s_setVar(userid, 148, i, 0)
				else
					s_setVar(userid, 148, i, s_getVar(userid, 148, i) + 1)
				end
			end
			return v.index
		else
			rate = rate - v.rate
		end
	end
	return 0
end

-- 根据类型来抽取道具
function GetTurntableRewardByType(index)
	local database = TurntableDataBase
	local datas = {}
	for _, data in pairs(database) do
		if type(data) == "table" and data.type == index then
			table.insert(datas, data)
		end
	end

	if #datas == 0 then
		s_error("GetTurntableRewardByType(index: " .. tostring(index) .. ")")
		return nil
	end

	local rate = math.random(1, 1000000)
	for _, v in ipairs(datas) do
		if rate <= v.rate then
			return v
		end
	end
end

function TurntableRechargeSuccess(userid, gold)
	if s_turntableOpend(userid) ~= 1 then
		return
	end
	local accgold = s_getVar(userid, 148, 51) + gold

	if accgold >= 1000 then
		local intp, fp = math.modf(accgold / 1000)
		-- 幸运卷数量
		s_setVar(userid, 148, 50, intp + s_getVar(userid, 148, 50))
		-- 转盘累积充值剩余
		accgold = accgold - 1000 * intp
		s_turntableLuckyChanged(userid);
	end

	s_setVar(userid, 148, 51, accgold)
end

function MailTurntableItem(userid, item, num, name)
	local mailitems = {{item,3,num,0,""}}
	local subject = "幸运大转盘"
	local text = "恭喜您在幸运大转盘获得" .. name .. "，请领取吧"
	s_sendMail(userid, subject, text, mailitems, subject)
end

function MailPayBackItem(userid, item, num, name)
	local mailitems = {{item,3,num,0,""}}
	local subject = "封测回馈"
	local text = "感谢您在封测对于我们的支持，现在返还"..num.."元宝"..",请领取吧"
	s_sendMail(userid, subject, text, mailitems, subject)
end

