--跨地图无敌
function OnHoldBuff_10002(level,etype,eid)
	s_setValue(etype,eid,VALUE_TYPE_UNABLE_SKILL,1)
	s_setValue(etype,eid,VALUE_TYPE_UNABLE_ATTACKED,1)
end
