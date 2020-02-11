--减速特戒(移动速度降低30%, 持续6秒)
function OnHoldBuff_44004(level,etype,eid)
	s_addValue(etype,eid,VALUE_TYPE_SPEED_SUB_PER,3000)
	s_trace("特戒触发，降低对方速度")
end
