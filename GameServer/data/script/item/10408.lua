--碎石
function OnUseItemEvent_10408(uid,thisid,targetid, number)
    	s_debugUser(uid,">>>>出售矿石thisid = "..thisid)
	s_debugUser(uid,">>>>>>>>>>> 碎石矿石  thisid=="..thisid)
	if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10408") ~= VALUE_OK then
        	return VALUE_FAIL
    	end
	local Mineraltype = MineralRecoveryDataBase.query(1)
   	local moneynum = Mineraltype.gold
	s_addMoneyMe(uid,MoneyType_MoneyTicket,moneynum * number,"OnUseItemEvent_10408",AddItemAction_UseItem)
    	return VALUE_OK
end
