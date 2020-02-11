--防御特戒
function OnRemoveBuffEvent_44002(level,etype,eid,time,value)
	s_debug("OnRemoveBuffEvent_44002")
	if time == 0 then
	
        s_subValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,4000)
        s_subValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,4000)
	end
end

function OnHoldBuff_44002(level,etype,eid,time,value)
	 s_debugUser(eid,"OnHoldBuff_44002 增加防御..time=%d",time)
	 --物防
	 s_addValue(etype,eid,VALUE_TYPE_PDEF,s_getValue(etype,eid,VALUE_TYPE_PDEF) * 0.40)
	 s_addValue(etype,eid,VALUE_TYPE_PMAXDEF,s_getValue(etype,eid,VALUE_TYPE_PMAXDEF) * 0.40)
	 --魔防
	 s_addValue(etype,eid,VALUE_TYPE_MDEF,s_getValue(etype,eid,VALUE_TYPE_MDEF) * 0.40)
	 s_addValue(etype,eid,VALUE_TYPE_MMAXDEF,s_getValue(etype,eid,VALUE_TYPE_MMAXDEF) * 0.40)
end
