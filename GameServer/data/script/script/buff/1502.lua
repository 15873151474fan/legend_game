--隐身(隐身只对怪物有效，移动或攻击失效)
function OnRemoveBuffEvent_1502(level,etype,eid,time,value)
    s_subState(etype,eid,SceneEntry_Hide);
end


function OnHoldBuff_1502(level,etype,eid)
    s_addState(etype,eid,SceneEntry_Hide);
    s_setSelfHide(etype,eid,1)
end

--REMOVE_BUFF_ON_MOVE_1502 = 1
