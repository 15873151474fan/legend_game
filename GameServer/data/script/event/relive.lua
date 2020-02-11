function OnPlayerReliveEvent(userid,rtype)
	s_debug("》》》》》》》》》》》》》群雄夺宝复活 rtype = "..rtype)
	if rtype == 0 then	--安全复活
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		ReturnUserHome(userid,"安全复活")
	elseif rtype == 1 then	--原地复活
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
	elseif rtype == 2 then --自然复活
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		local stype = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SCENE_TYPE)
		if stype >= 8 and stype <= 14 and stype ~= 9 and stype ~= 10 then
			s_goto(SCENE_ENTRY_PLAYER,userid,123,196)
		end
	elseif rtype == 3 then	--副本复活
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		local stype = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SCENE_TYPE)
		if stype >= CopySceneType_Manor1 and stype <= CopySceneType_Manor6 then
			local copy = rawget(_G, "CopySceneInfo_1206")
			if copy ~= nil and copy.OnPlayerRelive~= nil then
				copy.OnPlayerRelive(copy,userid, rtype)
			end
		else
			local copy = rawget(_G, "CopySceneInfo_" .. stype)
			if copy ~= nil and copy.OnPlayerRelive~= nil then
				copy.OnPlayerRelive(copy,userid, rtype)
			end
		end
	elseif rtype == 4 then	--固定点复活(暂时只用在攻城战)
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
        s_gomap(userid,country,4,46,37,0,1)
	elseif rtype == 5 then
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
		if country ~= 0 then
			s_gomap(userid,country,7,314,228,0,1)
		end
	elseif rtype == 6 then
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
        s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
		local homeland = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HOMELAND)
		if country == homeland or s_isFriendCountry(country,homeland) == VALUE_OK then
			s_addbuff(SCENE_ENTRY_PLAYER,userid,123,1,3)
			s_gomap(userid,country,5,141,619,0,1)
		else
			if country ~= s_getCountryVar(country,1,91) and s_isFriendCountry(country, s_getCountryVar(country,1,91)) == VALUE_FAIL then
				s_gomap(userid,country,5,620,619,0,1)
			else
				s_addbuff(SCENE_ENTRY_PLAYER,userid,123,1,3)
				s_gomap(userid,country,5,580,282,0,1)
			end
		end
	elseif rtype == 8 then	--虚弱复活
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		s_addbuff(SCENE_ENTRY_PLAYER,userid,127,1,5*60)
	elseif rtype == 9 then
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		s_gomap(userid,13,8,297,691,0,1)
	elseif rtype == 12 or rtype == 11 then
		s_setup(SCENE_ENTRY_PLAYER,userid,1)
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
	elseif rtype == 15 or rtype == 16 then
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		local stype = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SCENE_TYPE)
		if stype == 75 then
			local copy = rawget(_G, "CopySceneInfo_" .. stype)
			if copy ~= nil and copy.OnPlayerRelive~= nil then
				copy.OnPlayerRelive(copy,userid, rtype)
			end
		end
	elseif rtype == 17 then
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
		s_gomap(userid,13,195,144,200,0,1)
	elseif rtype == 18 then	--固定点复活(暂时只用在攻城战)
		s_debug("》》》》》》》》》》》》》群雄夺宝复活")
		local maxhp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp  = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
        	local maxinc = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXINTERVALUE)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
        	s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_INTERVALUE,maxinc)
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
        	s_gomap(userid,country,16,73,31,0,1)
	else	--系统复活
		local maxhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
		local maxsp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXSP)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HP,maxhp)
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_SP,maxsp)
	end
end


function OnPlayerReliveSummonEvent(userid,rtype)
	if rtype == 0 then	--召唤战友
		if s_checkCompanion(SCENE_ENTRY_PLAYER,userid) ~= VALUE_OK then
			s_sysInfo(userid,"<p><n color=\"GXColorBlueSky\">拥有战友后，您将获得来自战友的援手！</n><book bookid='70020' text='[详细]'/></p>",ChatPos_Sys);
	else
		local call = "OnAckReliveSummonCompanion($1,$2," .. userid .. ")"
		local buttons = "接受|3|Enter|忽略|4|Esc|稍后|5|Esc"
		local uname = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_NAME)
		local msg1 = "您的战友[" .. uname .. "]在不远处发来求救信号，他迫切地需要你的救助！"
		local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)

		local list = s_getCompanionEntry(userid)
		for i = 1,table.getn(list), 1 do
			local map1 = s_getValue(SCENE_ENTRY_PLAYER,list[i],VALUE_TYPE_CURRENT_MAP)
			if map1 == map then
				s_registerMsgBox(list[i],call,buttons,msg1,60)
			end
		end
	end
	elseif rtype == 1 then	--召唤国民
		local call = "OnAckReliveSummonCountry($1,$2," .. userid .. ")"
		local buttons = "接受|3|Enter|忽略|4|Esc|稍后|5|Esc"
		local uname = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_NAME)
		local msg1 = "您的同胞[" .. uname .. "]在不远处发来求救信号，他迫切地需要你的救助！"
		local homeland = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HOMELAND)
		local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)

		local list = s_getCountryEntry(homeland)
		for i = 1,table.getn(list), 1 do
			if list[i] ~= userid then
				local map1 = s_getValue(SCENE_ENTRY_PLAYER,list[i],VALUE_TYPE_CURRENT_MAP)
				if map1 == map then
					s_registerMsgBox(list[i],call,buttons,msg1,60)
				end
			end
		end
	elseif rtype == 2 then --召唤团员
		local corps = s_getCorpsId(userid)
		if corps == 0 then
			s_sysInfo(userid,"<p><n color=\"GXColorBlueSky\">加入团吧！您将体会到团的温暖！</n><book bookid='70110' text='[详细]'/></p>",ChatPos_Sys);
		else
			local call = "OnAckReliveSummonCorps($1,$2," .. userid .. ")"
			local buttons = "接受|3|Enter|忽略|4|Esc|稍后|5|Esc"
			local uname = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_NAME)
			local msg1 = "您的同胞[" .. uname .. "]在不远处发来求救信号，他迫切地需要你的救助！"

			local list = s_getCorpsEntry(SCENE_ENTRY_PLAYER,userid,0,0)
			for i = 1,table.getn(list), 2 do
				if list[i+1] ~= userid then
					s_registerMsgBox(list[i+1],call,buttons,msg1,60)
				end
			end
		end
	end
end


--召唤战友回调
function OnAckReliveSummonCompanion(uid,result,userid)
	if result == Button_Yes then
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
		if country == nil then return end
		local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)
		local posx= s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSY)
		s_debug("使用召唤战友传送:%u,%u,%u,%u",country,map,posx,posy)
		s_gomap(uid,country,map,posx,posy)
	end
end


--召唤国民回调
function OnAckReliveSummonCountry(uid,result,userid)
	if result == Button_Yes then
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
		if country == nil then return end
		local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)
		local posx= s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSY)
		s_debug("使用召唤国民传送:%u,%u,%u,%u",country,map,posx,posy)
		s_gomap(uid,country,map,posx,posy)
	end
end


--召唤团员回调
function OnAckReliveSummonCorps(uid,result,userid)
	if result == Button_Yes then
		local country = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_COUNTRY)
		if country == nil then return end
		local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)
		local posx= s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSY)
		s_debug("使用召唤团员传送:%u,%u,%u,%u",country,map,posx,posy)
		s_gomap(uid,country,map,posx,posy)
	end
end

