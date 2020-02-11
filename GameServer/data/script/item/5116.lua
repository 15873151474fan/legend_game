--一经验石1
function OnUseItemEvent_5116(uid,thisid,targetid, number)
	local itinfo = ExpStoneDataBase.query(targetid) 
	local viplevel = s_getVIPLevel(uid)	
		
	if itinfo["vip"..number] > viplevel then
		s_sysInfo(uid, "会员等级不足",ChatPos_Tips);
		return VALUE_FAIL
	end
	if s_removeMoney(uid,MoneyType_Gold,itinfo["gold"..number],"经验石") ~= VALUE_OK then
		s_sysInfo(uid, "元宝不足",ChatPos_Tips);
		return VALUE_FAIL
	end
        if s_deleteItemByThisID(uid,thisid,1,"经验石1级") ~= VALUE_OK then
                        return VALUE_FAIL
        end
        s_trace("经验石ing..........")
	s_refreshExp(uid,itinfo.exp * number,ExpType_Item,0)
        return VALUE_OK
end
