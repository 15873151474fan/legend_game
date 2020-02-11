--银矿
function OnUseItemEvent_10411(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10411") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local Mineraltype = MineralRecoveryDataBase.query(4)
        local moneynum = Mineraltype.gold
        s_addMoneyMe(uid,MoneyType_MoneyTicket,moneynum * number,"OnUseItemEvent_10411",AddItemAction_UseItem)
	return VALUE_OK
end
