--回城
function ReturnUserHome(uid,reason)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)

	local country = 0;local map = 0;local posx = 0;local posy = 0;
	--if ctype ~= 0 and map ~= 220 and map ~= 221 then --副本内返回进入副本前的地方
		--country = s_getVar(uid,2,1)
        --map = s_getVar(2,2)
		--posx = s_getVar(uid,2,3)
		--posy = s_getVar(uid,2,4)
	--else	--非副本内回到设定的复活点
    country = s_getVar(uid,2,11)
    map = s_getVar(uid,2,12)
    posx = s_getVar(uid,2,13)
    posy = s_getVar(uid,2,14)
	--end
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	end
	local guard = s_getGuardID(uid)
	if guard ~= 0 then
		country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	end
	if map == 0 then map = 1 end
	if map == 5 and s_getCountryVar(country,1,39) == Country_War_State_Start then
		if s_getCountryVar(country,1,37) ~= 0 then
			posx = 141
			posy = 619
		end
	end
	--local tozone = s_getReliveZone(map)
	s_addVar(uid,114,6,0)
	s_relive(SCENE_ENTRY_PLAYER,uid)
	if s_getTrafficType(uid) ~= TrafficType_Horse then
		s_resetTrafficType(uid)
	end
	s_gomap(uid,country,map,posx,posy,0,1)
end
--设定回城点
function SetReturnPoint(uid,posx,posy)
	s_addVar(uid,2,11,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY))
	s_addVar(uid,2,12,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP))
	if posx == nil or posx == 0 then
		s_addVar(uid,2,13,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX))
	else
		s_addVar(uid,2,13,posx)
	end
	if posy == nil or posy == 0 then
		s_addVar(uid,2,14,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY))
	else
		s_addVar(uid,2,14,posy)
	end
	--s_sysInfo(uid,"设置回城点成功")
end
--设定默认回城点
function SetReturnPointDefault(uid,mapid,posx,posy)
    s_addVar(uid,2,11,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND))
    s_addVar(uid,2,12,mapid)
    if posx == nil or posx == 0 then
        s_addVar(uid,2,13,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX))
    else
        s_addVar(uid,2,13,posx)
    end
    if posy == nil or posy == 0 then
        s_addVar(uid,2,14,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY))
    else
        s_addVar(uid,2,14,posy)
    end
	--s_sysInfo(uid,"设置默认回城点成功")
end
--盟国回城
function ReturnUserAlly(uid,reason)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	s_debug("[" .. uid .. "," .. name .. "]盟国跳转:" .. reason)
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= 0 then
		return
	end
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local map = 0;local posx = 0;local posy = 0;
	local ally = s_getCountryField(homeland,CountryVar_Ally1)
	if ally == 0 then
		ally = s_getCountryField(homeland,CountryVar_Ally2)
	end
	if ally == 0 then
		return
	end
	map = s_getVar(uid,2,12)
	posx = s_getVar(uid,2,13)
	posy = s_getVar(uid,2,14)
	s_addVar(uid,114,6,0)
	s_relive(SCENE_ENTRY_PLAYER,uid)
	if s_getTrafficType(uid) ~= TrafficType_Horse then
		s_resetTrafficType(uid)
	end
	s_gomap(uid,ally,map,posx,posy,0,1)
end
