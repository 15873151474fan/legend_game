--判断当前玉佩是否能升级
function GetJadeFramentUpState(uid,itemid)
    if itemid == 0 then
        local profession =  s_getValue(0,uid,VALUE_TYPE_PROFESSION)
        local jadeid = 120001
        if profession == Profession_Gunman then
            jadeid = 120101
        elseif profession == Profession_Freeman then
            jadeid = 120201
        end

        local curJadeValue = s_getVar(uid,140,3)
        local jadelbm = JadeUpDataBase[jadeid]
        if jadelbm == nil then
            --s_debug("GetJadeFramentUpState jadelbm is nil,jadeid="..jadeid)
            return 0;
        end
        if curJadeValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    else
        local curJadeValue = s_getVar(uid,140,3)
        local jadelbm = JadeUpDataBase[itemid + 1]
        if jadelbm == nil then
            --s_debug("GetJadeFramentUpState jadelbm is nil,jadeid="..itemid)
            return 0;
        end
        if curJadeValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    end
end

--判断当前宝石是否能升级
function GetDiamondFramentUpState(uid,itemid)

    local curValue = s_getVar(uid,140,1)
    if itemid == 0 then
        local jadeid = 130001

        local jadelbm = DiamonUpDataBase[jadeid]
        if jadelbm == nil then
            --s_debug("GetDiamondFramentUpState jadelbm is nil,jadeid="..jadeid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    else
        local jadelbm = DiamonUpDataBase[itemid + 1]
        if jadelbm == nil then
            --s_debug("GetDiamondFramentUpState jadelbm is nil,jadeid="..itemid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    end
end

--判断当前护盾是否能升级

function GetShieldFramentUpState(uid,itemid)
    local curValue = s_getVar(uid,140,61)
    if itemid == 0 then
        local jadeid = 141001

        local jadelbm = ShieldUpDataBase[jadeid]
        if jadelbm == nil then
            --s_debug("GetDiamondFramentUpState jadelbm is nil,jadeid="..jadeid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
	    return 1;
        else
            return 0;
        end
	return 0
    else
        local jadelbm = ShieldUpDataBase[itemid + 1]
        if jadelbm == nil then
            --s_debug("GetDiamondFramentUpState jadelbm is nil,jadeid="..itemid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    end
end

--判断当前玄印是否能升级
function GetPearlFramentUpState(uid,itemid)

    local curValue = s_getVar(uid,140,2)
    if itemid == 0 then
        local jadeid = 140001

        local jadelbm = PearlUpDataBase[jadeid]
        if jadelbm == nil then
            --s_debug("GetPearlFramentUpState jadelbm is nil,jadeid="..jadeid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    else
        local jadelbm = PearlUpDataBase[itemid + 1]
        if jadelbm == nil then
            --s_debug("GetPearlFramentUpState jadelbm is nil,jadeid="..itemid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    end
end

--判断当前称号是否能升级
function GetTitleFramentUpState(uid,titleid)

    local curValue = s_getVar(uid,140,5)
    local profession =  s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
    local titlebm = nil;
    if titleid == 0 then
        local curtile = 0;
        if profession == Profession_Soldier then
            curtile = 1;
        elseif profession == Profession_Gunman then
            curtile = 11;
        else
            curtile = 21;
        end
        titlebm = TitleUpDataBase.query(profession,curtile)
    else
        titlebm = TitleUpDataBase.query(profession,titleid + 1)


    end
    if titlebm == nil then
        --s_debug("GetTitleFramentUpState jadelbm is nil,jadeid="..titleid)
        return 0;
    end

    if curValue >= titlebm.needpoint then
        return 1;
    end
    return 0;
end

--判断当前勋章是否能升级
function GetMedalFramentUpState(uid,itemid)

    local curValue = s_getVar(uid,140,4)
    if itemid == 0 then
        local jadelbm = MedalUpDataBase[80001]
        if jadelbm == nil then
            --s_debug("GetMedalFramentUpState jadelbm is nil,jadeid="..jadeid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    else
        local jadelbm = MedalUpDataBase[itemid + 1]
        if jadelbm == nil then
            --s_debug("GetMedalFramentUpState jadelbm is nil,jadeid="..itemid)
            return 0;
        end
        if curValue >= jadelbm.needpoint then
            return 1;
        else
            return 0;
        end
    end
end

--判断是否有副本次数
function GetCopyRemainNum(uid)
    local copyItem = {};
    --金币副本
    copyTable = {20,22}
    for k,v in pairs(copyTable) do
        if s_getVar(uid,140,v) > 0 then
            return 1;
        end
    end

    --装备副本
    copyTable = {24,25,26,27,28,29}
    for k,v in pairs(copyTable) do
        if s_getVar(uid,140,v) > 0 then
            return 1;
        end
    end

    --经验副本
    copyTable = {41,42,43,44,45,46,47,48}
    for k,v in pairs(copyTable) do
        if s_getVar(uid,140,v) > 0 then
            return 1;
        end
    end

    ----爬塔副本(有待确认)
    --if s_getVar(uid,149,5) > 0 then
        --return 1;
    --end
    return 0;

end
