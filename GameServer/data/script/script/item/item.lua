--物品使用总接口
function OnUseItemEvent(itemtype,itemid,uid,thisid,targetid,number)
	if itemtype == ItemType_Horse then
		return OnUseHorseItem(itemid,uid,thisid)
	end

	if itemtype == ItemType_GiftReward or itemtype == ItemType_LimitTimeGift then
        if targetid == 1023 then
            if s_getAutoPackSpace(uid) < 1 then
                s_sysInfo(uid,"您的背包已滿,請清理背包!",ChatPos_Tips)
                return false
            end
        end

		return OnUseGiftReward(uid, thisid, targetid, number)
	end

	--执行注册事件
	if UseItemEvent ~= nil and UseItemEvent[itemid] ~= nil then
		for i = 1, table.getn(UseItemEvent[itemid]) do
			local call = UseItemEvent[itemid][i]
			if type(call) == "function" then
				call(uid, thisid, targetid, number)
			elseif type(call) == "string" then
				local func = StringToFunction(call)
				if func ~= nil then
					func(uid, thisid, targetid, number)
				end
			end
		end
	end
        --s_debug( "itemid=%d,测试11111111111111111111111111111111", itemid)
	--执行事件
	local fun = rawget(_G,"OnUseItemEvent_" .. itemid)
        -- s_debug( "itemid,测试")
	if fun ~= nil and itemid ~= 23037 and itemid ~= 23038
		and itemid ~= 23039 and itemid ~= 23040 and itemid ~= 23041
		and itemid ~= 23042 and itemid ~= 23043 and itemid ~= 23044 then
		--战术隐蔽使用道具清除
		s_removebuff(SCENE_ENTRY_PLAYER,uid,10211)
		return fun(uid,thisid,targetid,number)
	elseif fun ~= nil then
                 --s_debug( "itemid233333333333333")
		return fun(uid,thisid,targetid,number)
	end
	return VALUE_OK
end


--使用马匹道具
function OnUseHorseItem(itemid,uid,thisid)
	s_useHorseItem(uid,thisid)
	return VALUE_OK
end


MultiExpBuff =
{
	[2012] = 2,
	[2024] = 3,
	[2025] = 4,
	[43311] = 0.05,
	[43312] = 0.07,
	[43313] = 0.10,
	[43314] = 0.12,
	[43315] = 0.15,
}

function getMultiExpBuffInfo(uid, buffid)
	local newmulti = MultiExpBuff[buffid]
	if newmulti == nil then
		s_error("getMultiExpBuffInfo(uid, buffid):" .. uid .. "," .. buffid)
		return nil
	end
	local level = 0
	local curmulti = 0
	for buff,multi in pairs(MultiExpBuff) do
		level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,buff)
		if level ~= 0 then
			curmulti = multi
			break
		end
	end
	return newmulti,curmulti
end

