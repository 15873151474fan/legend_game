--领导召集下级
function OnLeaderToCallUp(uid,rtype,sid,x,y)
	local baseid = 0
	local retype = 0
	local reid = 0
	local rename = ""
	if rtype == Relation_Country then
		local fun = s_getFunction(uid,Relation_Army)
		if fun ~= FunctionType_ALeader then
			return
		end
		local army = s_getArmyID(uid)
		if army > 0 then
			retype = Relation_Army
			reid = army
			baseid = 29035
			rename = "军长"
		end
	elseif rtype == Relation_Army then
		local fun = s_getFunction(uid,Relation_Corps)
		if fun ~= FunctionType_CLeader then
			return
		end
		local corps = s_getCorpsId(uid)
		if corps > 0 then
			retype = Relation_Corps
			reid = corps
			baseid = 29034
			rename = "团长"
		end
	else
		return
	end
	if baseid == 0 then
		return
	end
	if s_deleteItemByBaseID(uid,baseid,1,"召集") == VALUE_OK then
		local map = math.floor(sid / 256)
		local country = math.floor(sid % 256)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local msg = "" .. rename .. name .. "在【" .. s_getCountryName(country) .. GetMapName(map) .. "】使用召集令召集您前往，是否接受召集？"
		s_sysCallUp(retype, reid, sid,x,y,msg,2,uid)
	else
		s_sysInfo(uid,"没有" .. rename .. "召集令",ChatPos_Sys + ChatPos_Important)
	end
end

--指挥官召集
function OnCountryCommanderCallUp(uid)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	local map = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local msg = ""
	msg = msg.."指挥官" .. name .. "在【" ..s_getCountryName(country) .. "】召集所有将士集结，是否接受召集？"
	s_registerGomapMsgBox(homeland,country,map,posx,posy,61,msg)
end
