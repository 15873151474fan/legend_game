--核子魔窟
CopySceneInfo_30 = {}
--副本创建初始化
function CopySceneInfo_30:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,5)
	s_setSceneVar(cid,0,1,s_getCurTime(TIME_ALLSECONDS))
end

function CopySceneInfo_30:OnPlayerIntoCopyScene(cid,uid)
	s_addVar(uid,102,5,s_getCurTime(TIME_ALLDAYS))
	RefreshTaskDailyInfo(uid, 30036)
	--[[
	s_removeMoney(uid,MoneyType_Money,30,"核子魔窟")
	s_deleteItemByBaseID(uid,29037,1,"核子魔窟扣除")
	]]
	local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	s_sendCopyInfo(cid,180,30*60 - last,"杀死电锯改进型")
	s_sysInfo(uid,"最终目标是击败威力强大的核子魔兽，每击败一次就可获得超量宝物奖励！在规定时间内可多次击败。",ChatPos_Sys + ChatPos_Important)
end

function CopySceneInfo_30:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,125,198)
	end
end

function OnLoopCopyScene_1Sec_30(ctype,cid)
	local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	local door = s_getSceneVar(cid,0,10)
	if door == 0 then	--第一道门没有打开
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			if y <= 185 then
				s_sysInfo(list[i+1],"门内传来一声怒吼，你被一股巨大的力量弹开",ChatPos_Sys + ChatPos_Important)
				s_goto(list[i],list[i+1],x,190)
			end
		end
	elseif door == 1 then	--第二道门没有打开
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			if y <= 130 then
				s_sysInfo(list[i+1],"门内传来一声怒吼，你被一股巨大的力量弹开",ChatPos_Sys + ChatPos_Important)
				s_goto(list[i],list[i+1],x,135)
			end
		end
	end
	local begin = s_getSceneVar(cid,0,0)
	if begin > 0 then
		s_setSceneVar(cid,0,0,begin- 1)
		if begin == 1 then
			s_setSceneVar(cid,0,10,1)	--开第一道门
			local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
			for i = 1,table.getn(list), 2 do
				if s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID) == 152 then
					s_clearNpc(list[i+1])
				end
			end
			CopySceneInfo_30:createMonster(cid)
			local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
			s_sendCopyInfo(cid,180,30*60 - last,"杀死电锯改进型")
			return
		end
	end
	local endcopy = s_getSceneVar(cid,0,2)
	if endcopy > 0 then
		s_copyInfo(cid,"倒计时:" .. endcopy)
		s_setSceneVar(cid,0,2,endcopy- 1)
		if endcopy == 1 then
			s_clearCopy(cid)
		end
		return
	end
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
	if pass >= 30*60 then
		s_setSceneVar(cid,0,2,10)
		s_copyInfo(cid,"副本时间结束,10秒钟后回收副本",ChatPos_Sys + ChatPos_Important);
	end
end
function CopySceneInfo_30:createMonster(cid)
	local monster = {
		{22455,124,150,2,15,1},		{22452,148,96,10,10,1},
		{22453,148,96,10,10,5},		{22452,144,79,10,10,1},		{22453,144,79,10,10,5},
		{22452,103,79,10,10,1},		{22453,103,79,10,10,5},		{22452,97,97,10,10,1},
		{22453,97,97,10,10,5},		{22452,123,97,10,10,1},		{22453,123,97,10,10,5},
		{22452,122,55,5,10,2},		{22453,122,55,5,10,2}, }

	for i = 1,table.getn(monster) do
		for j = 1,monster[i][6] do
			local baseid = monster[i][1]
			local posx = monster[i][2]
			local posy = monster[i][3]
			posx = posx + math.random(-monster[i][4],monster[i][4])
			posy = posy + math.random(-monster[i][5],monster[i][5])
			local npcid = s_sysSummon(baseid,cid,posx,posy)
		end
	end
	s_setSceneVar(cid,0,1,s_getCurTime(TIME_ALLSECONDS))
end
function CopySceneInfo_30:dead22455(uid)--看门boss
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype >= 30 and ctype <= 39 then
		local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		if s_getSceneVar(cid,0,10) == 2 then
			return
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
		for i = 1,table.getn(list), 2 do --开第二道门
			if s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID) == 151 then
				s_clearNpc(list[i+1])
		end
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local plv = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
			local num = 60 * plv ^ 1.5
			s_refreshExp(list[i+1],num,ExpType_Nuclear,40)
		end
		s_setSceneVar(cid,0,10,2)
		if s_getSceneVar(cid,0,3) ==0 then
			local npcid = s_sysSummon(22454,cid,122,53)
			s_addbuff(SCENE_ENTRY_NPC,npcid,20523,1,10)
		end
		s_copyInfo(cid,"进入实验室的障碍已经排除，击败实验室中的核子魔兽可获得高额奖励",ChatPos_Sys + ChatPos_Important)
		local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
		s_sendCopyInfo(cid,1,30*60 - last,"击败核子魔兽")
	end
end
function CopySceneInfo_30:dead22454(uid) --最终boss
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if uid ~= nil and uid ~= 0 then
		local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
		if ctype >= 30 and ctype <= 39 then
			local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,1)
			s_sendCopyInfo(cid,1,30*60 - last,"目标已达成")
			local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
			local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELADN_NAME)
			if country ~= nil and name ~= nil then
				s_worldInfo(country .."的".. name .. "在核子魔窟中异常勇猛，击败了核子魔兽！",ChatPos_Sys + ChatPos_Honor)
			end
		end
	end
	local murdercountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if s_getCountryVar(murdercountry,12,15) < COUNTRY_ACTIVITY_33814 then
		s_addCountryVar(murdercountry,12,15,s_getCountryVar(murdercountry,12,15)+1)
	end
	if s_getVar(uid,130,27) == 0 then
		s_addVar(uid,130,27,1)
		s_addVar(uid,130,200,s_getVar(uid,130,200)+1)
		s_debugUser(uid,"国家活力点，核子魔窟，参与度：1")
	end
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1, table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			if s_getVar(list[i+1],130,27) == 0 then
				s_addbuff(list[i],list[i+1],5027,1,5)
				s_addItem(list[i+1],55312,3,1,0,"1-1","击败boss奖励")
				s_setVar(list[i+1],130,27,1)
				s_setVar(list[i+1],130,200,s_getVar(list[i+1],130,200)+1)
				s_debugUser(list[i+1],"国家活力点，核子魔窟，参与度：1")
			end
		end
	end
end
-- RegisterMyNpcDeadEvent(22454,"CopySceneInfo_30:dead22454($1)")
-- RegisterMyNpcDeadEvent(22455,"CopySceneInfo_30:dead22455($1)")
