--150绑定元宝
function OnUseItemEvent_19099(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19099") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,150 * number,"OnUseItemEvent_19099",AddItemAction_UseItem)
    return VALUE_OK
end
