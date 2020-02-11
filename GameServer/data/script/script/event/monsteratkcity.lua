--注意修改怪物信息中怪物攻城的开服时间时,需要修改相应开服时间
--相关数据保存在中立区
--[[
13_180	 怪物攻城怪物索引1~3
13_181	 30秒定时器ID
13_182	 30分钟定时器ID
13_183	 怪物攻城npcID
13_184	 怪物攻城活动ID
]]

function GetMonsterAtkCityInfo(days, minfoTable)
	if days == nil or days < 0 then
		s_error("还没开服,怎么会有怪物攻城")
		return
	end

	--s_debug("开服第"..days.."天")
	s_trace("moster atk city: 1,3,5,7,9, days="..days)

	local flag = 0
	if days >= 1 and  days < 3 then
		flag = 1
	elseif days >= 3 and days < 5 then
		flag = 3
	elseif days >= 5 and days < 7 then
		flag = 5
	elseif days	>= 7 and days < 9 then
		flag = 7
	elseif days >= 9 then
		flag = 9
	end

	if flag ~= 0 then
		for k , v in pairs(MonsterAtkCityNpcDataBase) do
			if type(v) == "table" and v.startdays == flag then
				table.insert(minfoTable, v)
			end
		end
	end
    table.sort(minfoTable,function(a,b)return a.baseid < b.baseid end)

	for k,v in pairs(minfoTable) do
         s_trace("monster atk ciy baseid="..v.baseid)
    end
end

function CreateAtkCityBoss(minfoTable,curindex)
	if minfoTable == nil or table.getn(minfoTable) == 0 then
		s_error("怪物攻城怪物信息配置错误")
        return
	end
	if curindex > 3 then
		s_error("怪物攻城创建Boss索引错误:"..curindex)
		return
	end

	local baseid = minfoTable[curindex].baseid
    --s_debug("monster baseid = %u ",baseid)
	local sceneid = HashSceneID(3,14)
	local posx = minfoTable[curindex].posx
	local posy = minfoTable[curindex].posy
	if baseid == nil or sceneid == nil or posx == nil or posy == nil then
		s_error("怪物攻城数据错误(%u,%u,%u,%u)",baseid, sceneid, posx, posy)
		return
	end

	local npcid = s_sysSummon(baseid, sceneid, posx, posy, 103, 1)
	s_trace("怪物攻城数据(%u,%u,%u,%u,%u)",baseid, sceneid, posx, posy,curindex)
	if npcid == nil or npcid == 0 then
		s_error("怪物攻城产生怪物错误")
		return
	end
	s_trace("怪物攻城元宝龙npcid %u",npcid)
	s_addWorldVar(13, 183, npcid)
	s_addWorldVar(13, 180, curindex)
	local npcname = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_NAME)
	npcname = npcname or ""
	if npcname ~= "" then
		local msg = "[#5]【"..npcname.."】[-]开始进攻王城!可前往王城("..posx..","..posy..")进行击杀"
		s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
	else
		s_error("怪物攻城产生无名怪物, baseid="..baseid)
	end
end

function EventMonsterAtkCity(eventid, value1, value2, value3)
	if s_isExistScene(HashSceneID(3,14)) == 0 then
		return
	end
	--怪物攻城活动开始
	if value3 == 1 then
		s_debug("怪物攻城活动开始")
		for i = 180, 184 do
			s_addWorldVar(13, i, 0)
		end
		s_addWorldVar(13, 184, eventid)
		local days = s_openServiceDay()
		local minfoTable = {}
		GetMonsterAtkCityInfo(days, minfoTable)
		CreateAtkCityBoss(minfoTable, s_getWorldVar(13,180) + 1)
	end

	--怪物攻城活动结束
	if value3 == 2 then
		s_debug("怪物攻城结束")
		local npchp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 183), VALUE_TYPE_HP)
		local npcmaxhp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 183), VALUE_TYPE_MAXHP)
		if npchp == npcmaxhp then
			s_clearNpc(s_getWorldVar(13, 183))

			s_debug("怪物攻城结束,回收元宝龙")
			for i = 180, 184 do
				s_addWorldVar(13, i, 0)
			end
			return
		end

		if npchp ~= nil and npcmaxhp ~= nil and npchp < npcmaxhp then
			local npcname = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 183), VALUE_TYPE_NAME)
			npcname = npcname or ""
			local msg = "[#5]【"..npcname.."】[-]想要逃跑,诸位勇士请在30分钟内将其击杀"
			s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)

			s_debug("怪物攻城结束,押后回收元宝龙")
			local callback_30min_ID = RegisterTimeTriggerCallBack(30 * 60 * 1000, "MonsterAtkCity_30Min_CallBack")
			s_addWorldVar(13, 182, callback_30min_ID)
		end
	end
end

function MonsterAtkCity_BossDead(uid, npcid)
	if s_getWorldVar(13, 183) ~= npcid then
		s_debug("怪物攻城怪物id不符("..s_getWorldVar(13, 183)..","..npcid..")")
		return
	end

	--这里有可能是活动结束后30分钟内杀死的，需要把定时器去掉
	if s_getWorldVar(13, 182) ~= 0 then
		DeleteTimeTriggerCallBack(s_getWorldVar(13, 182))
		s_addWorldVar(13, 182, 0)
	end

	local npcname = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 183), VALUE_TYPE_NAME)
	npcname = npcname or ""
    local owner = s_getLastAttackUser(npcid);
	local username = s_getValue(SCENE_ENTRY_PALYER, owner, VALUE_TYPE_NAME)
	username = username or ""
	local msg = "进攻王城的[#5]【"..npcname.."】[-]已被勇士[#3]"..username.."[-]击杀!"
	s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)

	if s_getWorldVar(13, 180) == 3 then
		s_trace("怪物攻城已经刷出3只怪,没有怪了")
		for i=180, 184 do
			s_addWorldVar(13, i, 0)
		end
		return
	end

	if s_getWorldVar(13, 184) == 0 then
		s_debug("怪物攻城活动,活动id未知");
		return
	end

	local remaintime = s_getEventTime(Relation_World, 0, s_getWorldVar(13, 184), EVENT_TIME_REM)
	if remaintime > 30 then
		local days = s_openServiceDay()
		local minfoTable = {}
		GetMonsterAtkCityInfo(days, minfoTable)
		if table.getn(minfoTable) == 0 then
			for i=180, 184 do
				s_addWorldVar(13, i, 0)
			end
			return
		end

		local preindex = s_getWorldVar(13,180)
		local nextnpcname = s_getNpcBase(minfoTable[preindex+1].baseid, 1)
		msg = "[#5]【"..nextnpcname.."】[-]30秒后将在王城("..minfoTable[preindex+1].posx..","..minfoTable[preindex+1].posy..")处复活,请勇士们做好准备"
		s_trace(">>>>>>>>>>>>> 元宝龙击杀公告发送")
		s_worldInfo(msg, ChatPos_Sys + ChatPos_Important)
		local callback_30sec_ID = RegisterTimeTriggerCallBack(30 * 1000, "MonsterAtkCity_30Sec_CallBack")
		s_addWorldVar(13, 181, callback_30sec_ID)
	else
		for i=180, 184 do
			s_addWorldVar(13, i, 0)
		end
	end
end

function MonsterAtkCity_30Sec_CallBack(uuid,tid)
	DeleteTimeTriggerCallBack(tid)
	--s_debug("怪物攻城BOSS死亡后,30秒刷新 .."..s_getWorldVar(13, 181))
	if s_getWorldVar(13, 181) == 0 then
		--s_trace("怪物攻城活动boss30秒死亡后, evendid="..s_getWorldVar(13,184))
		return
	end
	if s_getWorldVar(13, 181) ~= 0 then
		--DeleteTimeTriggerCallBack(s_getWorldVar(13, 181))
		s_addWorldVar(13, 181, 0)
	end

	if s_getWorldVar(13, 180) == 3 then
		return
	end

	local days = s_openServiceDay()
	local minfoTable = {}
	GetMonsterAtkCityInfo(days, minfoTable)
	CreateAtkCityBoss(minfoTable, s_getWorldVar(13,180) + 1)
end

function MonsterAtkCity_30Min_CallBack(uuid,tid)
	DeleteTimeTriggerCallBack(tid)
	s_debug("怪物攻城活动到时,BOSS掉血后30分钟计时 "..s_getWorldVar(13, 182))
	if s_getWorldVar(13, 182) == 0 then
		s_trace("怪物攻城活动boss30分钟死亡,eventid="..s_getWorldVar(13,184))
		return
	end
	if s_getWorldVar(13, 182) ~= 0 then
		--DeleteTimeTriggerCallBack(s_getWorldVar(13, 182))
		s_addWorldVar(13, 182, 0)
	end
	local npchp = s_getValue(SCENE_ENTRY_NPC, s_getWorldVar(13, 183), VALUE_TYPE_HP)
	s_debug("元宝龙hp "..npchp)
	if npchp > 0 then
		s_clearNpc(s_getWorldVar(13, 183))
	end
	for i=180, 184 do
		s_addWorldVar(13, i, 0)
	end
end

--注册怪物攻城NPC死亡回调函数
for i=1,#MonsterAtkCityNpcDataBase do
	RegisterMyNpcDeadEvent(MonsterAtkCityNpcDataBase[i].baseid, "MonsterAtkCity_BossDead($1,$2)")
end
