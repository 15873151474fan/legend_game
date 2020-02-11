function UpGradeRing(uid, oldid, newid)
	 if s_copyItemInheritData(uid,oldid,newid) ~= VALUE_OK then
		 return VALUE_FAIL
 	end
        --s_debug("UpGradeRing.........newid="..newid)
	return newid
end
