--铁矿
function OnUseItemEvent_10409(uid,thisid,targetid, number)
    s_debugUser(uid,">>>>回收矿石thisid = "..thisid)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10409") ~= VALUE_OK then
        return VALUE_FAIL
    end
	local Mineraltype = MineralRecoveryDataBase.query(2)
        local moneynum = Mineraltype.gold
        s_addMoneyMe(uid,MoneyType_MoneyTicket,moneynum * number,"OnUseItemEvent_10409",AddItemAction_UseItem)
    return VALUE_OK
end
