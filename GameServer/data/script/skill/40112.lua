--骑乘
function OnUseSkill_40112(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,22) ~= 0 then
		s_sysInfo(eid1,"当前状态无法骑乘")
		return USE_SKILL_ERROR
	end
	ShowAttack(40112,etype1,eid1,etype2,eid2)
	local ttype,tid = s_getTrafficType(eid1)
	if ttype == TrafficType_Horse then
		s_resetTrafficType(eid1);
	elseif ttype == TrafficType_SuperWeapon then
		s_sysInfo(eid1,"变身状态，不可骑乘")
		return USE_SKILL_ERROR
	elseif ttype == TrafficType_None then
		s_showbar(eid1,0,"Ride_Callback_40112("..eid1..")",UninterruptActionType_None,1)
	end
end

function Ride_Callback_40112(uid)
	s_setTrafficType(uid,TrafficType_Horse)
end
