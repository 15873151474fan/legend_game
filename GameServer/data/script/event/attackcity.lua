--攻城战活动
--修改攻城战.xls时注意需要修改开服时间

function GetAtkCityNpcHp()
	local hp = 0
	local days = s_openServiceDay()
	if days < 2 then
		s_trace("未到开服时间,城主雕像血量为0, days="..days)
		return
	end

	s_trace("attack city days="..days)

	if days >= 2 and days < 30 then
		hp = AtkCityNpcConfigDataBase[days].hp
	else
		hp = AtkCityNpcConfigDataBase[30].hp
	end

	return hp
end

function AttackCityEvent(eventid, value1, value2, value3)
	if s_isExistScene(HashSceneID(3,14)) == 0 then
		return
	end

	if value3 == 1 then
		s_debug("攻城战开始 .."..eventid)
		local curDaySec = s_getCurTime(TIME_DAYSEC) + 10
		local begintime = s_getEventTime(Relation_World, 0, EventAttackCity, EVENT_TIME_BEG)
		s_debug("curDaySec "..curDaySec)
		s_debug("begintime "..begintime)
		--if curDaySec >= begintime and curDaySec < begintime + 1800 then
			local sceneid = HashSceneID(3,14)
			local npcid = s_sysSummon(15001, sceneid, 67, 41, 100, 1)
			if npcid == nil or npcid == 0 then
				s_error("攻城战创建怪物失败");
                return
			end

            s_debug("攻城战创建怪物:npcid="..tostring(npcid))
			local hp = GetAtkCityNpcHp()
			s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, hp)
			s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, hp)
			--s_addWorldVar(1,164,1)
		--end
	end

	if value3 == 2 then
		s_debug("攻城战结束 .."..eventid)
	end
end

function AtkCityFinish()
    if s_openServiceDay() < 2 then
        --s_trace("攻城战开服时间未到")
        return
    end

	if s_isExistScene(HashSceneID(3,13)) == 0 then
		return
	end

	s_trace("攻城战结束")
	--s_setDestroyMaster(0)
	local clanlist = s_getSceneClanCount(HashSceneID(3, 13))
	local clantable = {}
	if clanlist ~= nil and table.getn(clanlist) ~= 0 and table.getn(clanlist) % 2 == 0 then
		for i=1,table.getn(clanlist), 2 do
			local tmp = {}
			tmp.clanid = clanlist[i]
			tmp.count = clanlist[i+1]
			table.insert(clantable, tmp)
		end
	end

	if #clantable ~= 0 then
		table.sort(clantable, function(t1, t2) return t1.count > t2.count end)
		local max = clantable[1].count
		local clanidlist = {}
		for k, v in pairs(clantable) do
			if v.count == max then
				table.insert(clanidlist, v.clanid)
			end
			if v.count ~= max then
				break
			end
		end

		local index = math.random(1, #clanidlist)
		s_setRoyalCityClanID(clanidlist[index])
		s_trace("attackcity==setRoyalCityClanID=1")
	else
		s_setRoyalCityClanID(s_getRoyalCityClanID())
		s_trace("attackcity==setRoyalCityClanID=2")
	end
end

function AtkCityNpcClear()
    if s_openServiceDay() < 2 then
        --s_trace("攻城战清理NPC时,开服时间未到")
        return
    end

	local sceneid = HashSceneID(3,14)
	if s_isExistScene(sceneid) == 0 then
		return
	end

	local npclist = s_getNpcByBaseID(sceneid, 15001)
	if npclist == nil or #npclist == 0 then
		return
	end

	local curDaySec = s_getCurTime(TIME_DAYSEC)
	local begtime = s_getEventTime(Relation_World, 0, EventAttackCity, EVENT_TIME_BEG)
	if begtime ~= 0 and (curDaySec >= begtime + 1800 or curDaySec < begtime) then
		s_clearNpc(npclist[1])
		--		s_setRoyalCityClanID(s_getRoyalCityClanID())
		s_debug("攻城战,城主雕像攻击时间结束,雕像未被摧毁,npcid="..tostring(npclist[1]))
		if s_getDestroyMaster() == 0 then
			s_worldInfo("攻城战结束:城主雕像未被摧毁,王城帮会获得胜利,将继续占领王城", ChatPos_Sys + ChatPos_Important)
			s_setDestroyMaster(0)
			--s_addWorldVar(1,164,0)
		end
	end
end

function AtkCityNpcDead(uid, npcid)
	s_worldInfo("城主雕像被摧毁,皇宫已开启!接下来将进行皇宫争夺战,持续30分钟", ChatPos_Sys + ChatPos_Important)
	s_setDestroyMaster(1)
	s_addWorldVar(41,1,21*3600 + 1800 - (1800 + s_getCurTime(13)))
    s_debug("攻城战,城主雕像被摧毁,npcid="..tostring(npcid))
	--local ctime = s_getCurTime(9) 
	--s_addWorldVar(1,164,1)
	--s_addWorldVar(1,165,ctime)
end

RegisterNpcDeadEvent(15001, "AtkCityNpcDead($1,$2)")
