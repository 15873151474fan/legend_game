--礼包奖励
function GetGiftReward(uid, bagid)
	if uid == nil or uid == 0 or bagid == nil or bagid == 0 then
		return 0
	end

	local bagtype = GiftBagTypeDataBase[bagid].btype
	if bagtype == nil then
		return 0
	end

	local maxnum = GiftBagTypeDataBase[bagid].maxnum
	if maxnum == nil or maxnum == 0 then
		return 0
	end

	--s_debug("礼包奖励 type="..bagtype..",num="..maxnum)

	local itemlist = {}
	if bagtype == 1 then
		--独立
		for k, v in ipairs(GiftBagDataBase) do
			if type(v) == "table" then
				local random = math.random(1, 1000000)
				if v.bagid == bagid and random <= v.singleRatio then
					--s_trace("dwid="..v.dwID..",random="..random..",ratio="..v.mutexRatio)
					local temp = {}
					temp.itemid = v.baseid
					temp.num = v.num
					table.insert(itemlist, temp)
				end
			end

			if #itemlist == maxnum then
				break
			end
		end
	elseif bagtype == 2 then
		--互斥
        local random = math.random(1, 1000000)
        for k, v in pairs(GiftBagDataBase) do
            if type(v) == "table" then
                if v.bagid == bagid and random <= v.mutexRatio then
                    --s_trace("dwid="..v.dwID..",random="..random..",ratio="..v.mutexRatio)
                    local temp = {}
                    if bagid == 1023 then
                        local tempid = checkAwardTreasure(uid,v.baseid)
                        temp.itemid = tempid
                    else
                        temp.itemid = v.baseid
                    end

                    temp.num = v.num
                    table.insert(itemlist, temp)
                    if #itemlist >= maxnum then
                        break;
                    end
                end
            end

            if #itemlist == maxnum then
                break
            end
        end
	else
		s_debug("配置表中找不到对应的礼包 bagid="..bagid)
		return 0
	end

	if #itemlist == 0 then
		s_debug("礼包奖励没有礼包")
		return 0
	end

	local broadcastitems = {}
	local horseitems = {}
	local wingitems = {}
	for _, item in ipairs(itemlist) do
        local flag = s_canAddProfessionEquip(uid, item.itemid)
        s_trace("........................>>>>>>>."..item.itemid.."--"..flag)
        if flag ~= nil and flag == 1 then
            if item.itemid >= 2101 and item.itemid <= 2149 then
                addTreasure(uid,item.itemid)
		    elseif item.itemid >= 2201 and item.itemid <= 2249 then
                addAdvTreasure(uid)
			    local username = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
			    local msg = "[#3]"..username.."[-]开启藏宝图宝箱时，一道金光从天而降，意外获得[#6]高级藏宝图[-]"
			    s_worldInfo(msg,ChatPos_ImportantDown,1)
            else
		        s_addItem(uid, item.itemid, 3, item.num, 0, "1-1", "礼包奖励")
            end
		    -- 寻宝榜宝箱
		    if bagid >= 1004 and bagid <= 1012 then
		    	-- 三转及神装
		    	if s_getItemBaseValue(item.itemid, 6) > 2 or s_isGodEquip(item.itemid) then
		    		table.insert(broadcastitems, item.itemid)
		    	end
		    end
		    --坐骑
		    if s_getItemBaseValue(item.itemid, 1) == 57 then
	    		table.insert(horseitems, item.itemid)
	    	end
	    	--翅膀
	    	if bagid == 1001 and s_getItemBaseValue(item.itemid, 1) == 125 then
	    		table.insert(wingitems, item.itemid)
    		end
        end
	end

	-- 开启寻宝榜宝箱提示
	if #broadcastitems ~= 0 then
		local username = s_getUserName(uid)
		if username then
			local tab = {
				[1] = "玩家[#3]",
				[2] = username,
				[3] = "[-]开启寻宝榜[#",
				[4] = bagid,
				[5] = "]，获得了[#",
				[6] = "",
				[7] = "],可喜可贺！"
			}
			for _, baseid in ipairs(broadcastitems) do
				tab[6] = tostring(baseid)
				s_worldInfo(table.concat(tab), ChatPos_Important + ChatPos_Sys)
			end
		end
	end

	-- 坐骑宝箱提示
	if table.getn(horseitems) > 0 then
		local username = s_getUserName(uid)
		if username then
			local tab = {
				[1] = "玩家[#3]",
				[2] = username,
				[3] = "[-]开启[#",
				[4] = bagid,
				[5] = "]，获得了[#",
				[6] = "",
				[7] = "],可喜可贺！"
			}
			for _, baseid in ipairs(horseitems) do
				tab[6] = tostring(baseid)
				s_worldInfo(table.concat(tab), ChatPos_Important + ChatPos_Sys)
			end

		end
	end


	-- 翅膀提示
	if table.getn(wingitems) > 0 then
		local username = s_getUserName(uid)
		if username then
			local tab = {
				[1] = "玩家[#3]",
				[2] = username,
				[3] = "[-]开启[#",
				[4] = bagid,
				[5] = "]，获得了[#",
				[6] = "",
				[7] = "],可喜可贺！"
			}
			for _, baseid in ipairs(wingitems) do
				tab[6] = tostring(baseid)
				s_worldInfo(table.concat(tab), ChatPos_Important + ChatPos_Sys)
			end

		end
	end

	return 1
end

--使用礼包
--GiftTable = {1001,1003,19110,19111,19112,19113,19114}
function OnUseGiftReward(uid, thisid, targetid, number)
	if s_deleteItemByThisID(uid, thisid, number, "使用礼包") ~= VALUE_OK then
		return VALUE_FAIL
	end
	return GetGiftReward(uid, targetid)
end

--for k, v in ipairs(GiftTable) do
--	RegisterUseItemEvent(v, "OnUseGiftReward($1,$2,$3,$4)")
--end
