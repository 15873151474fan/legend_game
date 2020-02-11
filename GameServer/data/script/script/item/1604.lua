--4转首饰箱
function OnUseItemEvent_1604(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"4转首饰箱") ~= VALUE_OK then
			return VALUE_FAIL
	end
	local equip1={50031,60031,70031,90031,100031}
	local equip2={50032,60032,70032,90032,100032}
	local equip3={50033,60033,70033,90033,100033}
	local rand = math.random(1,5)
	if s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Soldier then
		local euip=equip1[rand]
		s_addItem(uid,euip,0,1,0,"1-1","战神4转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Gunman then
		local euip=equip2[rand]
		s_addItem(uid,euip,0,1,0,"1-1","法圣4转首饰箱")
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Freeman then
		local euip=equip3[rand]
		s_addItem(uid,euip,0,1,0,"1-1","道尊4转首饰箱")
	end
	return VALUE_OK
end








