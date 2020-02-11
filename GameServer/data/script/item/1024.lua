--技能残券
function OnUseItemEvent_1024(uid,thisid,targetid, number)
	if s_getAutoPackSpace(uid) < 1 then
        s_sysInfo(uid,"您的背包已满,请清理背包",ChatPos_Tips)
        return false
    end

    if s_deleteItemByThisID(uid,thisid,number,"高级藏宝图宝箱") ~= VALUE_OK then
        return VALUE_FAIL
    end

    --发放高级藏宝图
    addAdvTreasure(uid)

    s_setVar(uid,3,14,s_getVar(uid,3,14) + number)
    s_sysInfo(uid,"高级藏宝图:"..number)
    return VALUE_OK
end
