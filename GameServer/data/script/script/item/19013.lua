-- 定身·灵戒
function OnUseItemEvent_19013(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"定身·灵戒") ~= VALUE_OK then
        return VALUE_FAIL
    end

    if s_getVar(uid,149,22) == 0 then
    	s_addItem(uid,50701,0,1,0,"1-1","灵戒道具19013转换")
		s_setVar(uid,149,22,201)
    else
    	s_addItem(uid,10222,0,1,0,"1-1","灵戒道具19013转换")
    end

    return VALUE_OK
end

