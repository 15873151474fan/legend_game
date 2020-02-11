--金矿
function OnUseItemEvent_10412(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10412") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local Mineraltype = MineralRecoveryDataBase.query(5)
        local moneynum = Mineraltype.gold
        s_addMoneyMe(uid,MoneyType_MoneyTicket,moneynum * number,"OnUseItemEvent_10412",AddItemAction_UseItem)
	return VALUE_OK
end
