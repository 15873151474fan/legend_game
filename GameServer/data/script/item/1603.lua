--4转首饰箱
function OnUseItemEvent_1603(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"3转武器箱") ~= VALUE_OK then
			return VALUE_FAIL
	end

	if s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Soldier then
		local euip=20029
		s_addItem(uid,euip,0,1,0,"1-1","战神3转武器箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Gunman then
		local euip=20030
		s_addItem(uid,euip,0,1,0,"1-1","法圣3转武器箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Freeman then
		local euip=20031
		s_addItem(uid,euip,0,1,0,"1-1","道尊3转武器箱")
	end
	return VALUE_OK
end








