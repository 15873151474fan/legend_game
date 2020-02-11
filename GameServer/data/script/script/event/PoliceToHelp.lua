--救援
function OnPoliceToHelp(uid,country,map,posx,posy)
	local curmap = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if curmap == MAP_JAIL then
		s_sysInfo(uid,"监狱中不可使用护国徽章")
		return
	end
	if s_deleteItemByBaseID(uid,29025,1,"使用护国徽章传送") == VALUE_OK then
		s_debug("使用护国徽章传送:%u,%u,%u,%u",country,map,posx,posy)
		s_gomap(uid,country,map,posx,posy)

		local nowDay = s_getCurTime(TIME_ALLDAYS)
		local lastDay = s_getVar(uid,116,35)
		if lastDay == 0 or lastDay ~= nowDay then
			s_setVar(uid,116,35,nowDay)
			s_setVar(uid,116,36,0)
		end
		s_setVar(uid,116,36,s_getVar(uid,116,36)+1)
		local times = s_getVar(uid,116,36)
		if times == 10 then
			s_countryInfo(country,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "今天已经使用了10次护国徽章，真是国家的榜样",ChatPos_Honor)
		elseif times == 20 then
			s_countryInfo(country,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "今天已经使用了20次护国徽章，这是何等崇高的行为",ChatPos_Honor)
		elseif times == 50 then
			s_countryInfo(country,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "今天已经使用了50次护国徽章，牺牲自我成全大我已经到了忘我的境界",ChatPos_Honor)
		end
	else
		s_sysInfo(uid,"没有找到护国徽章")
	end
end

