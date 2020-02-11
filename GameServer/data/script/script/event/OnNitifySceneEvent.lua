--场景全局事件回调
function OnNotifySceneEvent(eventid,value1,value2,value3)
	--通知更新全局活动状态
	--s_updateEventState(eventid, value3)
	s_debug("全局活动事件回调 "..eventid.." value1 "..value1.." value2 "..value2.." value3 "..value3)


	--夺旗战
	if eventid == EventCaptureFlag1 or eventid == EventCaptureFlag2 or eventid == EventCaptureFlag3 then
		s_debug("夺旗战活动:"..eventid);
		EventCaptureFlag(eventid, value1, value2, value3)
	end

	--怪物攻城
	if eventid == EventMonsterAtkCity1 or eventid == EventMonsterAtkCity2 or eventid == EventMonsterAtkCity3 then
		s_debug("怪物攻城活动:"..eventid);
		EventMonsterAtkCity(eventid, value1, value2, value3)
	end

	--巨兽围城
	if eventid == EventMonsterCity1 or eventid == EventMonsterCity2 or eventid == EventMonsterCity3 then
		s_debug("巨兽围城活动:"..eventid);
		EventMonsterCity(eventid, value1, value2, value3)
	end

	--双倍经验活动
	if eventid == EventDoubleExp1 or eventid == EventDoubleExp2 or eventid == EventDoubleExp3 then
		s_debug("双倍经验活动:"..eventid);
	end

	--瞻仰城主
	if eventid == EventVisitMaster1 or eventid == EventVisitMaster2 or eventid == EventVisitMaster3 then
		s_debug("瞻仰城主活动:"..eventid);
		if value3 == 1 then
			s_debug("瞻仰城主活动id="..eventid)
			s_setVisitMasterEventID(eventid)
		else
			s_setVisitMasterEventID(0)
		end
	end

    --周内特殊活动
    if eventid == EventMine then
        s_trace("晶源矿脉"..eventid)
        EventKuangMai(uid,eventid,value1,value2,value3)
    end

    if eventid == EventAttackCity then
		s_debug("攻城战活动 "..eventid)
		AttackCityEvent(eventid, value1, value2, value3)
	end

	if eventid == EventClanWar then
		s_debug("宗门势力战 "..eventid)
	end

	--太妙宝莲
--	if eventid == EventPreal  then
--		s_trace("太妙宝莲活动 "..eventid)
--		PickPrealEvent(eventid, value1, value2, value3)
--	end
	--太妙宝莲
	--if eventid == EventGinSeng then
		--s_trace("阴阳妖参活动id="..eventid)
		--EventYinYangGinSeng(eventid, value1, value2, value3)
	--end

	if eventid == EventWorldBoss then
		s_trace("世界BOSS活动出生")
		WorldBossEvent(eventid, value1, value2, value3)
	end

--[[
	if eventid == 1 then		--团战
		CopySceneInfo_3:CorpsBattleEventCall(value1,value2,value3)
	elseif eventid == 2 then	--团挑战
		CopySceneInfo_3:CorpsBattleEventCall(value1,value2,value3)
	elseif eventid == 4 then	--军战
		CopySceneInfo_7:ArmyBattleEventCall(value1,value2,value3)
	elseif eventid == 5 then	--团副本
		CorpsCopyStartEvent(value1)
	elseif eventid == 6 then	--国王挑战
		CopySceneInfo_7:ArmyBattleEventCall(value1,value2,value3)
	elseif eventid == 8 then
		CopySceneInfo_7:ArmyBattleEventCall(value1,value2,value3)
	elseif eventid == 9 then
		CopySceneInfo_7:ArmyBattleEventCall(value1,value2,value3)
	elseif eventid == 10007 or eventid == 10009 then	--极速狂飙
		if s_isCountryInServer(13) == VALUE_OK then
			local list = pack(s_getCountryList())
			for i = 1,table.getn(list) do
				s_registerGomapMsgBox(list[i],list[i],3,361,414,31,"本国今日活动极速狂飙已经发布，是否立即前往光明要塞飚车党胡哥处报名?",eAreaType_Right)
			end
	end
	elseif eventid == 10024 or eventid == 10025 then
		if s_isCountryInServer(13) == VALUE_OK then
			local list = pack(s_getCountryList())
			for i = 1,table.getn(list) do
				s_registerGomapMsgBox(list[i],list[i],189,218,200,81,"跨区今日活动极速狂飙已经发布，是否立即前往魔境仙踪奥兹国王处报名？",eAreaType_Right)
			end
		end
	elseif eventid == 10020 or eventid == 10021 or eventid == 10022 then
		if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
			if s_getWorldLevel() > 1 then
				s_worldInfo("<p><n color=\"GXColorBlueSky\">王者试炼已经开启，胜利者有机会获得</n><n color=\"GXColorYellow\">“王者之翼”</n><n color=\"GXColorBlueSky\">！报名处</n><goto id=\"154\" mapid=\"118\" cid=\"13\" flagpoint=\"1\" /></p>",10)
		end
		end
	elseif eventid >= 20013 and eventid <= 20018 then
		if s_isCountryInServer(13) == VALUE_OK then
			s_worldInfo("<p><n color=\"GXColorBlueSky\">核子魔窟已开启！击败BOSS有机会获得</n><n color=\"GXColorYellow\">“神兵魔武”</n><n color=\"GXColorBlueSky\">！报名处</n><goto id=\"163\" mapid=\"118\" cid=\"13\" flagpoint=\"1\" /><book bookid='70018' text='[详细]'/></p>",10)
		end
	elseif eventid == 20042 then
		local cid = value1
		if s_isCountryInServer(cid) == VALUE_OK then
			s_registerGomapMsgBox(cid,cid,3,383,382,21,"国家舞会已开始，是否前往参加",eAreaType_Right)
		end
	elseif eventid == 1007 then
		local corps = value1
		if corps > 0 then
			local countryid = s_getCorpsField(corps, CorpVar_Country)
			if s_isCountryInServer(countryid) == VALUE_OK then
				JunXunTaskBegin(corps)
			end
		end
	elseif eventid == 1009 then
		local corps = value1
		if corps > 0 then
			local countryid = s_getCorpsField(corps, CorpVar_Country)
			if s_isCountryInServer(countryid) == VALUE_OK then
				OnJunXunBombEndEvent(corps)
			end
		end
	end
]]--
end

