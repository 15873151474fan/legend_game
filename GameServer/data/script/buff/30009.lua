--法术攻击药水(增加物理攻击50-100)
function OnHoldBuff_30009(level,etype,eid,time,value)
	s_addValue(etype,eid,VALUE_TYPE_MDAM_ADD_BASE,50)
	s_addValue(etype,eid,VALUE_TYPE_MMAXDAM_ADD_BASE,100)

end

