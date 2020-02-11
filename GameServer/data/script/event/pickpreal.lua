--相关数据保存在中立区
--[[
13_316	 初级宝莲npcID
13_317	 高级宝莲npcID
]]--

function GetPrealInfo(minfoTable)
--	local getmapid = {6,7,8,9,10,11}
	local i = math.random(1,#lotuspointDataBase)
	if i ~= 0 then
		for k , v in pairs(lotuspointDataBase) do
			if type(v) == "table" and v.id == i then
				table.insert(minfoTable, v)
			end
		end
	end


end

function CreatePreal(minfoTable)
	if minfoTable == nil or table.getn(minfoTable) == 0 then
        return
	end

--	local i = math.random(1,3)
	local posx = 0
	local posy = 0
	local getmapid = 0
	for _,vars in pairs(minfoTable) do
		s_addWorldVar(13, 200, vars.posX)
		s_addWorldVar(13, 201, vars.posY)
		s_addWorldVar(13, 202, vars.mapid)
--		 posx = vars.posX
--		 posy = vars.posY
--		 getmapid = vars.mapid
	end
	s_debug("posmapid = "..s_getWorldVar(13,202))
	s_debug("posx = "..s_getWorldVar(13,200))
	s_debug("posy = "..s_getWorldVar(13,201))

	local sceneid = HashSceneID(3,s_getWorldVar(13,202))
	if sceneid == nil  then
		s_error("地图配置数据错误(%u,%u,%u)",s_getWorldVar(13,202), s_getWorldVar(13,200),s_getWorldVar(13,201))
		return
	end

	local npcid = s_sysSummon(316, sceneid,s_getWorldVar(13,200),s_getWorldVar(13,201), 103, 1)
	if npcid == nil or npcid == 0 then
		s_error("错误")
		return
	end
	s_addWorldVar(13, 193, npcid)
--	s_addWorldVar(13, 190, i)
	local npcname = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_NAME)
	local mapname = s_getValue(SCENE_ENTRY_MAP, s_getWorldVar(13,202), VALUE_TYPE_NAME)
	npcname = npcname or ""
	if npcname ~= "" then
		local msg = "天地灵物[#5]【"..npcname.."】[-]于[#5]"..mapname.."[-]地图("..s_getWorldVar(13,200)..","..s_getWorldVar(13,201)..")点降临，大家赶紧前往采集"
		s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
	else
		s_error("产生无名的宝莲")
	end
	s_sendLotusPos(s_getWorldVar(13,200),s_getWorldVar(13,201),1)
end

function PickPrealEvent(eventid, value1, value2, value3)
	--太妙宝莲活动开始
	if value3 == 1 then
		s_trace("太妙宝莲活动开始")
		s_addWorldVar(13, 194, eventid)
		s_addWorldVar(13,195,0)
		local minfoTable = {}
		GetPrealInfo(minfoTable)
		CreatePreal(minfoTable)
	end

	--太妙宝莲活动结束
	if value3 == 2 then
		s_debug("太妙宝莲结束")
		if s_getWorldVar(13,193) ~= 0 then
			local npchp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 193), VALUE_TYPE_HP)
			local npcmaxhp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 193), VALUE_TYPE_MAXHP)
			if npchp == npcmaxhp then
				s_clearNpc(s_getWorldVar(13, 193))
				for i = 193,202 do
					s_addWorldVar(13,i,0)
				end
				s_sendLotusPos(s_getWorldVar(13,200),s_getWorldVar(13,201),0)
				return
			end
		else
			return
		end
	end
end

--点击小宝莲
function OnClickNpc_316(uid,npcid)
	local checkPick = s_checkPick(uid);
	s_trace("checkPick = "..checkPick)
	if checkPick == 0 or checkPick == nil then
		s_sysInfo(uid,"太妙宝莲尚处于保护期，无法采集",ChatPos_Tips)
		return
	end
	if s_getWorldVar(13,195) == 1 then
		s_sysInfo(uid,"已经有人在采集太妙宝莲了",ChatPos_Tips)
		return
	end
	s_showbar(uid,10000,"DealGetCopy316($1,"..npcid..")",UninterruptActionType_LOTUS,VALUE_OK)
end

function DealGetCopy316(uid,npcid)
	if hp == 0 then
		s_sysInfo(uid,"已经被人采集了",ChatPos_Tips)
		return
	end
	local username = s_getUserName(uid);
	local msg = "太妙宝莲在幼年期被混世魔王[#8]"..username.."[-]采得，天地灵物折陨于此，真是暴殄天物！"
	s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
	s_addWorldVar(30, 1, uid)
	s_npcLostItem(npcid)
	for i = 193,202 do
		s_addWorldVar(13,i,0)
	end
	s_sendLotusState(0)
	s_sendLotusPos(s_getWorldVar(13,200),s_getWorldVar(13,201),0)
end

--采矿石
function OnClickNpc_272(uid,npcid)
	local userlevel = s_getUserLevel(uid)
        if userlevel < 80 then
                s_sysInfo(uid, "等级不够，请升级到80级再来", ChatPos_Tips)
        	return
	end
	s_showbar(uid,6000,"DealGetCopy272($1,"..npcid..")",UninterruptActionType_MINERAL,VALUE_OK)
end

function DealGetCopy272(uid,npcid)

end
--点击大宝莲
function OnClickNpc_317(uid,npcid)
--	local checkPick = s_checkPick(uid);
--	if checkPick == 0 then
--		s_sysInfo(uid,"太妙宝莲尚处于保护期，无法采集",ChatPos_Tips)
--		return
--	end
	if s_getWorldVar(13,195) == 1 then
		s_sysInfo(uid,"已经有人在采集太妙宝莲了",ChatPos_Tips)
		return
	end
	s_showbar(uid,10000,"DealGetCopy317($1,"..npcid..")",UninterruptActionType_LOTUS,VALUE_OK)
end

function DealGetCopy317(uid,npcid)
	if hp == 0 then
		s_sysInfo(uid,"已经被人采集了",ChatPos_Tips)
		return
	end
	local username = s_getUserName(uid);
	local msg = "成年天地灵物被幸运之子[#8]"..username.."[-]采得，真乃天命所归，可喜可贺！"
	s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
	s_addWorldVar(30, 1, uid)
	s_npcLostItem(npcid)
	for i = 193,202 do
		s_addWorldVar(13,200+i,0)
	end
	s_sendLotusState(0)
	s_sendLotusPos(s_getWorldVar(13,200),s_getWorldVar(13,201),0)
end

function GrowUpPreal()
	if s_getWorldVar(13,194) == 0 or s_getWorldVar(13,193) == 0 then
		s_debug("没有小太妙，不能进行长大操作")
		return
	end

	if s_getWorldVar(13,193) ~= 0 then
		local sceneid = HashSceneID(3,s_getWorldVar(13,202))
		s_clearNpc(s_getWorldVar(13, 193))
--		s_addWorldVar(13, 194, 0)

		local npcid = s_sysSummon(317, sceneid, s_getWorldVar(13,200), s_getWorldVar(13,201), 103, 1)
		s_addWorldVar(13,193,npcid)
--		s_addWorldVar(13, 194, 1801)
		local npcname = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_NAME)
		local mapname = s_getValue(SCENE_ENTRY_MAP, s_getWorldVar(13,202), VALUE_TYPE_NAME)
		npcname = npcname or ""
		if npcname ~= "" then
			local msg = "天地灵物[#5]【小太妙宝莲】已成长为[-]"..npcname.."于[#5]"..mapname.."[-]地图("..s_getWorldVar(13,200)..","..s_getWorldVar(13,201)..")点降临."
			s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
		else
			s_error("产生无名的宝莲")
		end
	else
		s_debug("在初级的时候已经被摘走")
		return
	end
	s_sendLotusPos(s_getWorldVar(13,200),s_getWorldVar(13,201),1)

end
