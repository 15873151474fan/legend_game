--铜矿
function OnUseItemEvent_10410(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10410") ~= VALUE_OK then
        return VALUE_FAIL
    end
    	local Mineraltype = MineralRecoveryDataBase.query(3)
        local moneynum = Mineraltype.gold
        s_addMoneyMe(uid,MoneyType_MoneyTicket,moneynum * number,"OnUseItemEvent_10410",AddItemAction_UseItem)
	return VALUE_OK
end
