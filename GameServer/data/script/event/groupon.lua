--团购领取奖励
--level从0开始
function OnGrouponAward(uid,joined,level)
	if joined == 1 then		--参团奖励
		if level == 0 then
			s_addItem(uid,29026,3,40,0,"1-1","团购系统")
	elseif level == 1 then
		s_addItem(uid,29026,3,80,0,"1-1","团购系统")
	elseif level == 2 then
		s_addItem(uid,29026,3,120,0,"1-1","团购系统")
	elseif level == 3 then
		s_addItem(uid,29026,3,160,0,"1-1","团购系统")
	elseif level == 4 then
		s_addItem(uid,29026,3,200,0,"1-1","团购系统")
	end
	else			--未参团奖励
		if level == 0 then
			s_addItem(uid,29026,3,15,0,"1-1","团购系统")
	elseif level == 1 then
		s_addItem(uid,29026,3,30,0,"1-1","团购系统")
	elseif level == 2 then
		s_addItem(uid,29026,3,45,0,"1-1","团购系统")
	elseif level == 3 then
		s_addItem(uid,29026,3,60,0,"1-1","团购系统")
	elseif level == 4 then
		s_addItem(uid,29026,3,75,0,"1-1","团购系统")
	end
	end
end
