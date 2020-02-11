--冰冻(移动速度降低50%, 持续3秒)
function OnHoldBuff_2004(level,etype,eid)
	s_addValue(etype,eid,VALUE_TYPE_SPEED_SUB_PER,5000)
end
