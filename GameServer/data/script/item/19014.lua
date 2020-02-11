-- 减伤·灵戒
function OnUseItemEvent_19014(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"减伤·灵戒") ~= VALUE_OK then
        return VALUE_FAIL
    end

    if s_getVar(uid,149,23) == 0 then
    	s_addItem(uid,50801,0,1,0,"1-1","灵戒道具19014转换")
		s_setVar(uid,149,23,301)
    else
    	s_addItem(uid,10222,0,1,0,"1-1","灵戒道具19014转换")
    end

    return VALUE_OK
end

