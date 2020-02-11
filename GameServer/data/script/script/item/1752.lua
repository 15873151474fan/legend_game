--魂玉
function OnUseItemEvent_1752(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"测试") ~= VALUE_OK then
			return VALUE_FAIL
	end
	s_trace("使用测试魂玉箱..........")
	--500000+职业*10000+槽位*1000+属性*100+品质*1
	local zhiye=2		--职业
	local caowei=1		--槽位
	local shuxin=1		--属性
	local pinzhi=1		--品质
	for caowei=1,6 do
		for shuxin=1,4 do
			for pinzhi=1,5 do
				s_addItem(uid,500000+zhiye*10000+caowei*1000+shuxin*100+pinzhi*1,0,1,0,"1-1","测试")
			end
		end
	end
	return VALUE_OK
end
