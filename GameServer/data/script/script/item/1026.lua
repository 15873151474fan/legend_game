--魂玉
function OnUseItemEvent_1026(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"测试") ~= VALUE_OK then
			return VALUE_FAIL
	end
	--s_trace("使用测试目标宝箱..........")	
	local mysteryBox={{19102,1,10},{10116,1,3},{10227,1,3},{10079,5,20},{10080,2,5},{10402,1,1},{10403,1,1},{10118,10,20},{10095,1,10},{10158,1,10}}

	local randItem=math.random(1,10)
	local mysteryItem=mysteryBox[randItem]
	local randNum=math.random(mysteryItem[2],mysteryItem[3])
	s_addItem(uid,mysteryItem[1],0,randNum,0,"1-1","测试")
	return VALUE_OK
end
























