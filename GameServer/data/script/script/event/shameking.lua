function OnShameKingEvent(uid, stype, npcid)
	-- 判断是否有此NPC
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local npclist = s_getNpcByBaseID(cid, 5088)
	if #npclist == 0 then
		return
	end
	local ret = 0
	for i=1,#npclist do
		if npclist[i] == npcid then
			ret = 1
		end
	end
	if ret == 0 then
		return
	end
	--进度条
	local callback = "ShameKing($1,"..stype..","..npcid..")"
	s_showbar(uid,5000,callback,0,1)
end
function ShameKing(uid, stype, npcid)
	if stype == 1 then
		if s_removeMoney(uid,MoneyType_MoneyTicket,35,"扔菜羞辱对方国王") ~= VALUE_OK then
			s_sysInfo(uid,"您的金额不足，请及时充值。")
			return
		end
	end
	local today = s_getCurTime(TIME_ALLDAYS)
	if s_getVar(uid,1,30) ~= today then
		s_addVar(uid,1,30,today)
		s_addVar(uid,1,31,0)
	end
	local lastpoint = s_getVar(uid,1,31)
	--根据类型判断羞辱值
	if stype == 1 then
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SHAME,4)
		s_addVar(uid,1,31,lastpoint+5)
		ShowAttack(50014,SCENE_ENTRY_PLAYER,uid,SCENE_ENTRY_NPC,npcid)
	elseif stype == 2 then
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SHAME,1)
		s_addVar(uid,1,31,lastpoint+1)
		ShowAttack(50013,SCENE_ENTRY_PLAYER,uid,SCENE_ENTRY_NPC,npcid)
	end
	local rate = 0
	local rand = math.random(1,100)
	if rand <= 15 then
		rate = 30
	elseif rand <= 50 then
		rate = 20
	else
		rate = 10
	end
	--x*(50+0.1*人物等级^2.2)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = rate*(50+0.1*level^2.2)
	local nowpoint = s_getVar(uid,1,31)
	if lastpoint < 20 and nowpoint >= 20 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
	elseif lastpoint < 40 and nowpoint >= 40 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
	elseif lastpoint < 60 and nowpoint >= 60 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
	elseif lastpoint < 80 and nowpoint >= 80 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
	elseif lastpoint < 100 and nowpoint >= 100 then
		s_refreshExp(uid,exp,ExpType_GuardCopy,60)
	end
	--发送玩家羞辱值
	s_sendshamepoint(uid, nowpoint)
	local shamevalue = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SHAME)
	if shamevalue ~= nil and shamevalue >= 100 then
		--XX国的国王被XX国的国民连续羞辱好几次，在那儿哭天喊娘呢。
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SHAME,0)
		--本国
		local country1 = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_CURRENT_COUNTRY)
		--对方国家
		local country2 = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_NPC_COUNTRY)
		s_worldInfo(""..s_getCountryName(country2).."的国王被"..s_getCountryName(country1).."的国民连续羞辱好几天，在那儿哭爹喊娘呢。",ChatPos_Sys + ChatPos_Honor)
	end
end
