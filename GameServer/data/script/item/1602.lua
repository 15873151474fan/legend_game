--2转首饰箱
function OnUseItemEvent_1602(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"1转首饰箱") ~= VALUE_OK then
			return VALUE_FAIL
	end
	local equip1={50028,60028,70028,90028,100028}
	local equip2={50029,60029,70029,90029,100029}
	local equip3={50030,60030,70030,90030,100030}
	local rand = math.random(1,5)
	if s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Soldier then
		local euip=equip1[rand]
		s_addItem(uid,euip,0,1,0,"1-1","战神2转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Gunman then
		local euip=equip2[rand]
		s_addItem(uid,euip,0,1,0,"1-1","法圣2转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Freeman then
		local euip=equip3[rand]
		s_addItem(uid,euip,0,1,0,"1-1","道尊2转首饰箱")
	end
	return VALUE_OK
end








