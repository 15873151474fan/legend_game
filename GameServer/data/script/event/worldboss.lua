--注意修改怪物信息中怪物攻城的开服时间时,需要修改相应开服时间
--相关数据保存在中立区
--[[
40_180	 怪物攻城怪物索引1~3
40_181	 30秒定时器ID
40_182	 30分钟定时器ID
40_183	 怪物攻城npcID
40_184	 怪物攻城活动ID
]]
function GetWorldBossInfo(minfoTable)
	for k , v in pairs(WorldBOSSLUADataBase) do
		if type(v) == "table" and v.index == 1 then
			table.insert(minfoTable, v)
		end
	end
--    table.sort(minfoTable,function(a,b)return a.baseid < b.baseid end)

	for k,v in pairs(minfoTable) do
         s_trace("世界BOSS当前的ID是="..v.monsterid)
    end
end

function CreateWorldBoss(minfoTable)
	if minfoTable == nil or table.getn(minfoTable) == 0 then
		s_error("世界BOSS怪物信息配置错误")
        return
	end

	local baseid = minfoTable[1].monsterid
    --s_debug("monster baseid = %u ",baseid)
	local sceneid = HashSceneID(3,14)
	local posx = minfoTable[1].minX
	local posy = minfoTable[1].minY
	if baseid == nil or sceneid == nil or posx == nil or posy == nil then
--		s_error("世界BOSS数据错误(%u,%u,%u,%u)",baseid, sceneid, posx, posy)
		return
	end

	local npcid = s_sysSummon(baseid, sceneid, posx, posy, 103, 1)
--	s_trace("世界BOSS数据(%u,%u,%u,%u,%u)",baseid, sceneid, posx, posy,curindex)
	if npcid == nil or npcid == 0 then
		s_error("世界BOSS产生错误")
		return
	end
	s_addWorldVar(40, 3, npcid)
	local npcname = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_NAME)
	local mapname = s_getValue(SCENE_ENTRY_MAP, minfoTable[1].mapid, VALUE_TYPE_NAME)
	npcname = npcname or ""
	if npcname ~= "" then
		--local msg = "世界BOSS[#5]【"..npcname.."】[-]在[#5]"..mapname.."[-]("..posx..","..posy..")出现！"
		--local msg = "挑战莫默活动"
		--s_worldInfo(msg, ChatPos_Important)
	else
		s_error("怪物攻城产生无名怪物, baseid="..baseid)
	end
end

function WorldBossEvent(eventid, value1, value2, value3)
	--世界BOSS活动开始
	if value3 == 1 then
		s_debug("世界BOSS开始")
--		for i = 1, 4 do
--			s_addWorldVar(40, i, 0)
--		end
		local minfoTable = {}
		s_addWorldVar(40, 2, eventid)
		s_addWorldVar(40,1,s_getWorldVar(40,1)+1)
		if s_getWorldVar(40,1) >= 30 then
			s_addWorldVar(40,1,30)
		end
--		s_addWorldVar(40,1,0)
		s_trace("boss day="..s_getWorldVar(40,1))
		GetWorldBossInfo(minfoTable)
		CreateWorldBoss(minfoTable)
	end

	--世界BOSS活动结束
	if value3 == 2 then
		s_debug("世界BOSS结束")
		local npchp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(40, 3), VALUE_TYPE_HP)
		local npcmaxhp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(40, 3), VALUE_TYPE_MAXHP)

		if s_getWorldVar(40,3) ~= 0 then
			s_clearNpc(s_getWorldVar(40, 3))


			local npcname = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(40, 3), VALUE_TYPE_NAME)
			npcname = npcname or ""
			local msg = "[#5]【"..npcname.."】[-]已逃跑,挑战BOSS奖励在稍后放到勇士邮箱中，请注意查收"
			s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
			s_addWorldVar(40,5,1)
			s_sendBossAward(uid,1)
			for i = 2, 4 do
				s_addWorldVar(40, i, 0)
			end
			--boss提示
			for i = 10, 13 do
				s_addWorldVar(40, i, 0)
			end
		end
	end
end

function World_BossDead(uid, npcid)
	if s_getWorldVar(40, 3) ~= npcid then
		s_debug("世界BOSS怪物id不符("..s_getWorldVar(40, 3)..","..npcid..")")
		return
	end

	local npcname = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(40, 3), VALUE_TYPE_NAME)
	npcname = npcname or ""
	local msg = "BOSS已被击杀，挑战BOSS奖励将在稍后发放到勇士邮箱中，请注意查收!"
	s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
	s_addWorldVar(40,5,2)

	for i=2, 4 do
		s_addWorldVar(40, i, 0)
	end
	for i = 10, 13 do
		s_addWorldVar(40, i, 0)
	end
	s_sendBossAward(uid,2)
end
--注册怪物攻城NPC死亡回调函数

for i=1,#WorldBOSSLUADataBase do
	RegisterNpcDeadEvent(WorldBOSSLUADataBase[i].monsterid, "World_BossDead($1,$2)")
end

