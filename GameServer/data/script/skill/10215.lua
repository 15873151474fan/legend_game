--残像闪烁
function OnUseSkill_10215(level,etype1,eid1,etype2,eid2,posx,posy)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)

	if math.abs(posx - x1) >=15 or math.abs(posy - y1) >= 15 then
		return USE_SKILL_ERROR
	end
	s_goto(etype1,eid1,posx,posy,0)
	s_addbuff(etype1,eid1,10205,30,4)
	if s_getRuneDur(eid1,10215) > 0 then
		s_addbuff(etype1,eid1,20241,1000,4)
		s_reduceRuneDur(eid1,10215)
	end
	ShowAttack(10215,etype1,eid1,etype1,eid1)
end
