function OnHoldBuff_1602(level,etype,eid,value)
    --骑乘状态不加
    if s_getVar(eid,1,99) ~= 0 or s_getVar(eid,293,5) ~= 0 then
        s_debug("身上有坐骑，buff:1602不生效")
        return;
    end
	s_addValue(etype,eid,VALUE_TYPE_SPEED_ADD_PER,value)
    s_debug("获得加速buff加速,速度:"..value)
end
