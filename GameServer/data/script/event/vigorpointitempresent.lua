--活力点礼物奖励
function OnRequestVigorPointItemAward(uid,point,itemid)
	if point == 0 then
		s_addItem(uid,63038,3,5,0,"1-1","活力点礼物奖励")
	elseif point == 1 then
		s_addItem(uid,55322,3,3,0,"1-1","活力点礼物奖励")
	elseif point == 2 then
		s_addItem(uid,55323,3,3,0,"1-1","活力点礼物奖励")
	elseif point == 3 then
		s_addItem(uid,63368,3,5,0,"1-1","活力点礼物奖励")
	elseif point == 4 then
		s_addItem(uid,32215,3,1,0,"1-1","活力点礼物奖励")
	end
	s_openVigorPointAwardItem(uid,itemid)
end


