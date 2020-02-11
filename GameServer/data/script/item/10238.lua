--稀有装备
function OnUseItemEvent_10238(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10238") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local rand = math.random(1,100)
    if rand <= 20 then
        s_addItem(uid,220101,0,1,0,"1-1","稀有装备获得")
    elseif rand <= 40 then
        s_addItem(uid,230101,0,1,0,"1-1","稀有装备获得")
    elseif rand <= 60 then
        s_addItem(uid,240101,0,1,0,"1-1","稀有装备获得")
    elseif rand <= 70 then
        s_addItem(uid,250101,0,1,0,"1-1","稀有装备获得")
    elseif rand <= 80 then
        s_addItem(uid,150003,0,1,0,"1-1","稀有装备获得")
    elseif rand <= 100 then
        local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)
        if sex == FEMALE then
            s_addItem(uid,160006,0,1,0,"1-1","稀有装备获得")
        else
            s_addItem(uid,160005,0,1,0,"1-1","稀有装备获得")
        end
    end
    return VALUE_OK
end
