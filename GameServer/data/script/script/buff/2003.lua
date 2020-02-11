--麻痹(无法移动、攻击，持续4秒)
function OnRemoveBuffEvent_2003(level,etype,eid,time,value)
    s_subState(etype,eid,SceneEntry_Benumb);
end


function OnHoldBuff_2003(level,etype,eid)
    s_addState(etype,eid,SceneEntry_Benumb);
end

