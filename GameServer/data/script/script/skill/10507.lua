--重力之咒
function OnUseSkill_10507(level,etype1,eid1,etype2,eid2)
	if CheckPowerBuff(etype2,eid2) == VALUE_OK then
		s_sysInfo(eid1,"对方处于免疫状态中",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	local time = { 5,8,10,12,14}
	local percent = { 20,20,25,30,35}

	s_clearbuff(etype2,eid2,BUFF_STATE_ZLZZ)
	if math.random(1,100) < s_getValue(etype2,eid2,VALUE_TYPE_SPEEDSUBDEF) then
		s_sysInfo(eid1,"对方减速免疫中")
		s_sysInfo(eid2,"免疫对方减速")
	else
		s_addbuff(etype2,eid2,10507,percent[level],time[level])
	end

	local hurt = { 90,100,105,110,115}
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	MAGIC_ATTACK_PERCENT_VALUE = hurt[level]*100
	if s_getRuneDur(eid1,10507) > 0 then
		s_addbuff(etype1,eid1,10205,10,5)
		s_reduceRuneDur(eid1,10507)
	end
	MagicAttack(10507,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end
