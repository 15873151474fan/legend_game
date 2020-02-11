--1转首饰箱
function OnUseItemEvent_1601(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"1转首饰箱") ~= VALUE_OK then
			return VALUE_FAIL
	end
	local equip1={50025,60025,70025,90025,100025}
	local equip2={50026,60026,70026,90026,100026}
	local equip3={50027,60027,70027,90027,100027}
	local rand = math.random(1,5)
	if s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Soldier then
		local euip=equip1[rand]
		s_addItem(uid,euip,0,1,0,"1-1","战神1转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Gunman then
		local euip=equip2[rand]
		s_addItem(uid,euip,0,1,0,"1-1","法圣1转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Freeman then
		local euip=equip3[rand]
		s_addItem(uid,euip,0,1,0,"1-1","道尊1转首饰箱")
	end
	return VALUE_OK
end





