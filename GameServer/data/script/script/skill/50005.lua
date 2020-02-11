--跳舞
function OnUseSkill_50005(level,etype1,eid1,etype2,eid2)
	local traffic = s_getTrafficType(eid1)
	if traffic == TrafficType_Horse then
		s_resetTrafficType(eid1)
	end
	traffic = s_getTrafficType(eid1)
	if traffic == TrafficType_None then
		--[[检查是否在跳舞区内
		if s_checkZoneType(etype1,eid1,ZONE_DANCE) ~= VALUE_OK then
		s_sysInfo(eid1,"非跳舞区内不允许跳舞")
		return USE_SKILL_ERROR
		end
		]]
		if s_getbufflevel(etype1,eid1,49) == 0 then
			s_addbuff(etype1,eid1,49,1,1200)
		end
		--如果两人异形组队,对方也在跳舞,即拉到3格以内
		local check,otype,oid = CheckCoupleTeam(etype1,eid1)
		local otraffictype,otrafficid = s_getTrafficType(oid)
		if check == VALUE_OK and (otraffictype == TrafficType_Dance or otraffictype == TrafficType_DanceDouble) then
			local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
			local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
			local x2 = s_getValue(otype,oid,VALUE_TYPE_POSX)
			local y2 = s_getValue(otype,oid,VALUE_TYPE_POSY)
			if math.abs(x1-x2) > 1 or math.abs(y1-y2) > 1 then
				local direct = GetDirect(x2,y2,x1,y1)
				local x,y = GetPosByDirect(x2,y2,direct,1)
				s_goto(etype1,eid1,x,y,1)
			end
			s_resetTrafficType(oid)
			s_setTrafficType(oid,TrafficType_DanceDouble,eid1)
			s_setTrafficType(eid1,TrafficType_DanceDouble,oid)
		else
			s_setTrafficType(eid1,TrafficType_Dance,level)
		end

	elseif traffic == TrafficType_Dance or traffic == TrafficType_DanceDouble then
		s_resetTrafficType(eid1)
		s_removebuff(etype1,eid1,49)
	else
		s_sysInfo(eid1,"当前状态不能跳舞")
	end
end

--检查是否是两人异形组队
function CheckCoupleTeam(etype,eid)
	local teamnum = s_getTeamSize(etype,eid)
	if teamnum ~= 2 then
		return VALUE_FAIL
	end
	local teamlist = s_getTeamEntry(etype,eid,20)
	if table.getn(teamlist) ~= 4 then
		return VALUE_FAIL
	end
	local sex1 = s_getValue(teamlist[1],teamlist[2],VALUE_TYPE_SEX)
	local sex2 = s_getValue(teamlist[3],teamlist[4],VALUE_TYPE_SEX)
	if sex1 == sex2 then
		return VALUE_FAIL
	end
	local rettype,retid = teamlist[1],teamlist[2]
	if etype == rettype and eid == retid then
		rettype = teamlist[3]
		retid = teamlist[4]
	end
	return VALUE_OK,rettype,retid
end
