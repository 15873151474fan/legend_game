-- 复活·灵戒
function OnUseItemEvent_19015(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"复活·灵戒") ~= VALUE_OK then
        return VALUE_FAIL
    end

    if s_getVar(uid,149,21) == 0 then
    	s_addItem(uid,50901,0,1,0,"1-1","灵戒道具19015转换")
		s_setVar(uid,149,21,101)
    else
    	s_addItem(uid,10222,0,1,0,"1-1","灵戒道具19015转换")
    end

    return VALUE_OK
end

