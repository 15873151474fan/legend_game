--术神分身
function OnUseSkill_10516(level,etype1,eid1,etype2,eid2)
	--[[
	if s_getbufflevel(etype1,eid1,10304) ~= 0 then
	s_sysInfo(eid1,"瞄准标记状态下不允许使用战神附体",ChatPos_Sys + ChatPos_Important)
	return USE_SKILL_ERROR
	end
	]]
	if s_getTrafficType(eid1) == TrafficType_Horse then
		s_resetTrafficType(eid1)
	end
	--缓存最大血值,状态取消的时候有用
	local curhp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local sub = maxhp - curhp
	s_addbuff(etype1,eid1,10513,level,30,maxhp)
	s_addbuff(etype1,eid1,1016,1,30)
	local slevel = s_getskilllevel(etype1,eid1,10518)
	local speed = {10,20,30,40,50,60}
	if slevel ~= 0 then
		s_addbuff(etype1,eid1,10205,speed[slevel],30)
	else
		s_addbuff(etype1,eid1,10506,1,30)
	end

	s_setup(etype1,eid1,1) --立即刷新属性，否则血值加不上
	maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	s_setValue(etype1,eid1,VALUE_TYPE_HP,maxhp - sub)
	ShowAttack(10516,etype1,eid1,etype2,eid2)
end
