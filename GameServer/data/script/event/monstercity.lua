--巨兽围城活动
--修改怪物信息中巨兽围城的开服时间时,需要修改开服时间
--产生的npcid保存在中立区13_160~179字段

function ParseMonsterCityInfo(monsterinfo, minfoTable)
	if monsterinfo == nil or monsterinfo == "" then
		s_error("巨兽围城配置信息错误")
		return
	end

--	s_trace("巨兽围城 monsterinfo:"..monsterinfo)
	for str in string.gmatch(monsterinfo, "%d+,%d+") do
		local baseid,num = string.match(str, "(%d+),(%d+)")
		local tmp = {}
		tmp.baseid = baseid
		tmp.num = num
		table.insert(minfoTable, tmp)
	end

--	for k, v in ipairs(minfoTable) do
--		s_trace("k="..k.." ("..v.baseid..","..v.num..")")
--	end
end

function GetMonsterCityInfo(days, minfoTable)
	if days == nil or days < 0 then
		s_error("服务器都没开启,怎么会有巨兽围城呢")
		return
	end

	if days < 1 then
		s_error("巨兽围城活动还没开启 1")
	end

	s_trace("monster city:1,3,7,10,14,99999, days="..days)

	local flag = 0
	if days <= 1 then
		flag = 1
	elseif days > 1 and days <= 3  then
		flag = 3
	elseif days > 3 and days <= 7  then
		flag = 7
	elseif days > 7 and days <= 14 then
		flag = 14
	elseif days > 14 and days <=28 then
		flag = 28
	elseif days > 28 and days <=99999 then
		flag = 99999
	end

	s_trace("monstet city flag="..flag)
	if flag ~= 0 then
		for k, v in pairs(MonsterCityNpcDataBase) do
			if type(v) == "table" and v.startdays == flag then
				ParseMonsterCityInfo(v.monsterinfo, minfoTable)
				return
			end
		end
	end
end

function CreateMonsterCityNpc(minfoTable)
	if minfoTable == nil or table.getn(minfoTable) == 0 then
		s_error("巨兽围城活动NPC分配错误")
		return
	end

	local npcidlist = {}
	local sceneid = HashSceneID(3,2)
	for i=1, table.getn(minfoTable) do
		for j=1, minfoTable[i].num do
			local npcid = s_sysSummon(minfoTable[i].baseid, sceneid, math.random(43,68), math.random(30,47), 103, 1)
			if npcid ~= nil and npcid ~= 0 then
				table.insert(npcidlist, npcid)
			end
		end
	end

	for i, v in ipairs(npcidlist) do
		s_addWorldVar(13, 160 + (i - 1), v)
--        s_trace("巨兽围城怪物数量"..i.." "..v.." "..(160+i))
	end
end

function EventMonsterCity(eventid, value1, value2, value3)
	if s_isExistScene(HashSceneID(3,2)) == 0 then
		return
	end

	if value3 == 1 then
		s_debug("巨兽围城活动开始")
		for i = 160, 194 do
			s_addWorldVar(13, i, 0)
		end
		local days = s_openServiceDay()
		local minfoTable = {}
		GetMonsterCityInfo(days, minfoTable)
		CreateMonsterCityNpc(minfoTable)
	end

	if value3 == 2 then
		s_debug("巨兽围城活动结束");
		for i = 160, 194 do
			local npcid = s_getWorldVar(13, i)
			s_clearNpc(npcid)
			s_addWorldVar(13, i, 0)
		end
	end
end
