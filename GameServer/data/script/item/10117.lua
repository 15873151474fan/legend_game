--爬塔副本巻轴(每天只能使用2次)
function OnUseItemEvent_10117(uid,thisid)
    if s_getVar(uid,164,3) > 2 then
        s_sysInfo(uid,"每天只能使用2次",ChatPos_Tips)
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10117") ~= VALUE_OK then
        return VALUE_FAIL
    end

    s_setVar(uid,149,4,0)
    s_sysInfo(uid,"副本关卡重置成功",ChatPos_Tips)
    return VALUE_OK
end
