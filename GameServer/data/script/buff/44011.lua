--瞬间恢复生命,持续5秒
local buf_44011 = {{1,20,30},{2,25,32},{3,30,33},{4,35,34},{5,40,36},{6,45,37},{7,50,39},{8,55,40},{9,60,42},{10,65,43},{11,70,45},{12,80,50}}

function OnLoopBuffEvent_1Sec_44011(level,etype,eid,time,value)
	if level >12 or level <1 then
		return
	end
	local addhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP) * buf_44011[level][3]/100
	s_debug("OnLoopBuffEvent_1Sec_44011 恢复hp,level="..level.." per="..buf_44011[level][3].." addhp="..addhp)
	s_addValue(etype,eid, VALUE_TYPE_HP,addhp)
--      if time == 0 then
--        s_subValue(etype,eid,VALUE_TYPE_PDAMDEF_SUB_PER,4000)
--        s_subValue(etype,eid,VALUE_TYPE_MDAMDEF_SUB_PER,4000)
--      end
end

function OnHoldBuff_44011(level,etype,eid,time,value)
	if level >12 or level <1 then
		return 
	end
	local addhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP) * buf_44011[level][2]/100
        s_addValue(etype,eid,VALUE_TYPE_HP,addhp)
	s_debug("OnHoldBuff_44011, 瞬间恢复hp, level="..level.." per="..buf_44011[level][2].." addhp="..addhp)
        --s_getValue(etype,eid,VALUE_TYPE_MMAXDEF)
end

--抵消本次伤害
function OnAddBuffEvent__44011(level,etype,eid,time,value)
	if level >12 or level <1 then
		return
	end
	local addhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP) * buf_44011[level][2]/100
	s_addValue(etype,eid,VALUE_TYPE_HP, addhp)
	s_debug("OnAddBuffEvent_44011 , 瞬间恢复hp, level="..level.." per="..buf_44011[level][2].." addhp="..addhp)
end

