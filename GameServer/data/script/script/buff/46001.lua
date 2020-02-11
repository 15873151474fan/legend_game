function OnHoldBuff_46001(level,etype,eid)
	local remainvalue = 0
    if s_isDead(eid) == VALUE_OK then
        return remainvalue;
    end
	local curhp = s_getValue(etype,eid,VALUE_TYPE_HP)
	--local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP)
	local maxhp = s_getValue(etype,eid,VALUE_TYPE_PK_ALLDAMAGR)
	local ssss = s_getValue(etype,eid,VALUE_TYPE_PK_ALLDAMAGR)
	 s_trace(">>>>>>>>>>>触发圣物3，增加血量"..ssss)
	s_trace("oooooooooooooo"..maxhp..curhp..eid)
	s_setValue(etype,eid,VALUE_TYPE_PK_ALLDAMAGR,0)
    if maxhp == nil then
                return remainvalue;
    end
    local addvalue = 0.1 * maxhp;
    if addvalue > 0 then
--		s_addValue(SCENE_ENTRY_PLAYER,eid,VALUE_TYPE_SP,addvalue)
		s_addValue(SCENE_ENTRY_PLAYER,eid,VALUE_TYPE_HP,addvalue)  
--		s_addValue(etype,eid,VALUE_TYPE_HP,addvalue)
              s_trace("触发圣物3，增加血量"..addvalue)
    end
                return remainvalue;
end
