--神降技能
function OnUseSkill_7234(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_GOD_VALUE) ~= MAX_GOD_EVIL_VALUE then
		return USE_SKILL_ERROR
	end
	s_setValue(etype1,eid1,VALUE_TYPE_GOD_VALUE,0)
	if s_getbufflevel(etype1,eid1,20521) ~= 0 then
		s_updateBuffTime(etype1,eid1,20521,30)
		return USE_SKILL_SUCESS
	end
	--缓存最大血值,状态取消的时候有用
	local curhp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local sub = maxhp - curhp
	s_addbuff(etype1,eid1,20521,level,30,maxhp)

	s_setup(etype1,eid1,1) --立即刷新属性，否则血值加不上
	maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	s_setValue(etype1,eid1,VALUE_TYPE_HP,maxhp - sub)
	ShowAttack(7234,etype1,eid1,etype2,eid2)
end
