-- VIP充值

function queryRechargeByGold(gold)
	for i = 1, 9 do
		local data = RechargeDataBase[i]
		if data and data.gold == gold then
			return data
		end
	end
	return nil
end

function GetVipMultiExp(level)
	local data = VipDataBase[level]
	if data == nil then
		return 0
	end
	local str = data.multi_exp
	local index = string.find(str, ";")
	local multi = string.sub(str, 1, index - 1)
	local hour = string.sub(str, index + 1, #str)
	if tonumber(multi) == nil or tonumber(hour) == nil then
		return 0
	end
	return tonumber(multi) * 10000 + tonumber(hour)
end

-- 根据累积充值元宝得到vip等级
function GetVipLevelByGold(gold)
	s_debug("function GetVipLevelByGold(gold" .. tostring(gold) .. ")")
	local level = 0
	local nextLevel = 1
	local data = VipDataBase.query(nextLevel)

	while data ~= nil and gold >= data.gold do
		level = nextLevel
		nextLevel = nextLevel + 1
		data = VipDataBase.query(nextLevel)
	end
	return level
end

-- 添加VIP专属Buff
function AddVipExclusiveBuff(userid, orilevel, newlevel)
	s_debug("AddVipExclusiveBuff:" ..  userid .. "," .. orilevel .. "," .. newlevel)
	local oriData = VipDataBase.query(orilevel)
	local newData = VipDataBase.query(newlevel)
	if oriData ~= nil then
		s_debug("AddVipExclusiveBuff: remove:" .. "," .. oriData.power_buff)
		s_removebuff(SCENE_ENTRY_PLAYER, userid, oriData.power_buff)
	end
	if newData ~= nil then
		s_debug("AddVipExclusiveBuff: add:" .. "," ..  newData.power_buff)
		s_addbuff(SCENE_ENTRY_PLAYER, userid, newData.power_buff, 1, 1)
	end
	s_debug("AddVipExclusiveBuff: end")
end

-- VIP免费原地复活地数
function FreshVipFreeReliveCount(userid)
	local vipLevel = s_getVar(userid, 178, 8)
	local data = VipDataBase.query(vipLevel)
	if data ~= nil then
		s_setVar(userid, 149, 12, data.free_revive)
		s_debug("CheckVipFreeRelive:userid:" ..  userid .. ",viplevel:" .. vipLevel .. ",count:" .. data.free_revive)
	end
end

-- 检查VIP等级变化
function CheckVipLevel(userid)
	-- 累计购买元宝
	local gold = s_getVar(userid, 1, 4) + s_getVar(userid,123,30)
--	local gold = s_getVar(userid, 123, 30)
	local curLevel = s_getVar(userid, 178, 8)
	local newLevel = GetVipLevelByGold(gold)
	if curLevel ~= newLevel then
		s_setVar(userid, 178, 8, newLevel)
		s_sysInfo(userid, "恭喜您升级到[#2][VIP会员" .. newLevel .. "][-]")
		s_setViplevel(userid, newLevel)
        VLEpushing(userid,newLevel)
		AddVipExclusiveBuff(userid, curLevel, newLevel)
		FreshVipFreeReliveCount(userid)
	end
end

-- 客户端请求充值信息
function OnRequestRechargeInfo(userid)
	local vlist = {}
	local rowcount = 9
	local platid = s_getPlatId(userid)
    local ioslist = {17,2017,1017,1999,5186,196,206,8206,4017,3203,203,12203,3206,11017,14017,16017,220,6220,15017,3196,50196,7196,3221,10221}
    for key,value in pairs(ioslist) do
        if value == platid then
            rowcount = 6
            s_trace("------------------- userid: " .. userid .. ", plat id: " .. platid)
            break;
        end
    end
	for i = 1, rowcount do
		local count = s_getVar(userid, 178, 11 + i)
		table.insert(vlist, i)
		table.insert(vlist, count)
	end
	s_sendRechargeList(userid,1,0,rowcount, vlist)
end

-- 客户端请求充值
function OnRequestRecharge(userid, index,reasonid)
	s_debug("OnRequestRecharge(userid " .. userid .. ", index " .. index .. ")")
	if index > 0 and index <10 then
		local data = RechargeDataBase.query(index)
		if data == nil then
			s_error("客户端发送一了个不存在的充值编号userid " .. tostring(userid) .. ", index " .. tostring(index))
			s_sysInfo(userid, "充值失败！", ChatPos_Tips)
			return 0
		end
		local reason = ""
		if reasonid == 1 then
			reason = "购买元宝"
		elseif reasonid == 2 then
			reason = "GM工具发放"
		elseif reasonid == 3 then
			reason = "GM指令发放"
		end
		local ret = s_dealGoldAction(userid, data.gold, reason)
		return ret
	end
	if index >10 and index <63 then
		local data =  ChanceLUADataBase.query(index)
		if data == nil then
			s_error("客户端发送一了个不存在的机缘编号userid " .. tostring(userid) .. ", index " .. tostring(index))
			s_sysInfo(userid, "充值失败！", ChatPos_Tips)
			return 0
		end
		--GetRewardWithMail(uid,data.item,reason,1,false,AddItemAction_Recharge)
		LuckyChanceRemove(userid,data.index,data.item)
	end
end

-- 成功充值后
function OnRechargeSuccess(userid, gold)
	local data = queryRechargeByGold(gold)
	if data == nil then
		s_error("未找到充值表，userid " .. tostring(userid) .. ",gold " .. tostring(gold) .. ")")
		return
	end

	--记录每笔充值元宝
	s_setVar(userid, 231, 1, data.gold)

	if s_getVar(userid, 230, 7) == 0 and data.gold == 6480 then
		s_setVar(userid, 230, 7, data.gold)
	elseif s_getVar(userid, 230, 5) == 0 and data.gold == 1980 then
		s_setVar(userid, 230, 5, data.gold)
	--百元首充没有充值过,第一次充值98元
	elseif s_getVar(userid, 230, 3) == 0 and data.gold == 980 then
		s_setVar(userid, 230, 3, data.gold)

	--百元首充没有充值过,第一次充值30元
	elseif s_getVar(userid, 230, 1) == 0 and data.gold >= 300 then
		s_setVar(userid, 230, 1, data.gold)
	end

	s_debugUser(userid, "(231,1)="..s_getVar(userid,231,1)..",(230,1)="..s_getVar(userid,230,1)..",(230,2)="..s_getVar(userid,230,2))
	s_debugUser(userid, "(230,3)="..s_getVar(userid,230,3)..",(230,4)="..s_getVar(userid,230,4))
	s_debugUser(userid, "(230,5)="..s_getVar(userid,230,5)..",(230,6)="..s_getVar(userid,230,6))
	s_debugUser(userid, "(230,7)="..s_getVar(userid,230,7)..",(230,8)="..s_getVar(userid,230,8))

	-- 累积充值RMB
	local rmb = data.price * (data.discount / 10000)
	local totalRMB = s_getVar(userid, 1, 103) + rmb
	s_setVar(userid, 1, 103, totalRMB)
	s_debug("累计充值￥" .. totalRMB)

	CheckVipLevel(userid)

	-- 此购买编号元宝的次数
	local indexCount = s_getVar(userid, 178, 11 + data.index)
	s_setVar(userid, 178, 11 + data.index, indexCount + 1)

	-- 赠送元宝
	local normalGold = 0
	local bindingGold = 0
	if indexCount == 0 then
		normalGold = data.first_gold_extra
		bindingGold = data.first_bindgold_extra
	else
		normalGold = data.after_gold_extra
		bindingGold = data.after_bindgold_extra
	end

	-- 充值类型39
	local action = 39
	-- 额外赠送元宝
	if normalGold > 0 then
		s_addMoney(userid, MoneyType_Gold, normalGold, "充值RMB:" .. rmb, action)
	end
	if ActivityIcon:checkrechargecodeEnabled() and gold > 0 then
		        local orgGold = s_getVar(userid,166,2)
			s_setVar(userid,166,2,orgGold + gold)
			s_debug(" RechargeSuccess uid %u  addGold %u orgGold %u",userid,gold,orgGold)
	end
	-- 额外赠送绑定元宝
	if bindingGold > 0 then
		s_addMoney(userid, MoneyType_Money, bindingGold, "充值RMB:" .. rmb, action)
	end

	-- 充值成功
	s_sendRechargeList(userid,2,data.index,0,{})
	-- 累计充值元宝
	s_sendRechargeList(userid,3,0,0,{})

	-- 幸运转盘
	TurntableRechargeSuccess(userid, gold)

	-- 欢乐充值
	HappyRechargeSuccess(userid, data.index, gold)
end

function getMoneybyId(id)
    local ret = RechargeDataBase[id]
    if ret == nil then
        return 0
    end
    return ret["price"] * 100.0
end

function GetRechargePoint(uid)
	if s_getVar(uid, 231, 1) < 60 then  -- x < 6
		return 2;
	elseif s_getVar(uid, 231, 1) >= 60 and s_getVar(uid, 231, 1) < 300 and s_getVar(uid, 230,1) < 300 then  --  6 <= x < 30
		return 103;
	elseif s_getVar(uid, 231, 1) >= 300 and s_getVar(uid, 231, 1) < 980 and s_getVar(uid, 230,3) < 980 then -- 30 <= x < 98
		return 104;
	elseif s_getVar(uid, 231, 1) >= 980 then  -- x >= 98
		--30已完成
		if s_getVar(uid, 230, 3) >= 980 then
			return 0
		end

		return 104
	end
	return 0;
end

function GMSetVIPLevel(userid, level)
	local curLevel = s_getVar(userid, 178, 8)
	if level <= curLevel then
		s_error("GMSetVIPLevel(userid:" .. userid .. ", level:"  .. level .. ")，当前vip等级为:" .. curLevel)
		return
	end

	local data = VipDataBase.query(level)
	if data == nil then
		s_error("GMSetVIPLevel(userid:" .. userid .. ", level:"  .. level .. ") 未找到这个等级的充值数据")
		return
	end

	if s_getVar(userid, 1, 4) < data.gold then
		-- 设置累计充值元宝
		s_setVar(userid, 1, 4, data.gold)
--		s_setVar(userid, 123, 30, data.gold)
	end

	-- 设置VIP等级
	s_setViplevel(userid, level)
end

--获得当前冲值档次的金额
function getIndexMoney(index)
    local money = 0;

	local data = RechargeDataBase.query(index)
	if data == nil then
		return money
	end
    money = data.price
    return money
end

function LuckyChanceRemove(uid,cid,awarditem)
	if 1 then return end
	s_debug("LuckyChanceRemove uid.."..uid.."..cid.."..cid)
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or #itemlist == 0 then
		s_debug("LuckyChanceRemove awarditem table err")
		return 0
	end
	local iteminfo = itemlist[1]
	if type(iteminfo) ~= "table" or iteminfo == nil then
		s_debug("LuckyChanceRemove iteminfo table err")
		return 0
	end
	s_setVar(uid,169,86,s_getVar(uid,169,86)+5)
	s_setVar(uid,169,88,s_getVar(uid,169,88)+1)
	s_addMoney(uid, MoneyType_Gold, iteminfo[3], "充值机缘:" .. cid, 39)
	s_debug("LuckyChanceRemove uid : " ..uid.." inc "..s_getVar(uid,169,86).." del "..s_getVar(uid,169,87).." weeknum "..s_getVar(uid,169,88))

	s_removeluckychance(uid,cid)

end

function GMAddGold(uid)
	s_debugUser("内部玩家充值:%u",uid)
	OnRequestRecharge(uid,1,1)
	OnRechargeSuccess(uid,60)
end
