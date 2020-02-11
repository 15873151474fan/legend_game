--好友数量
function OnFriendEvent(uid,optye,num)
	--增加好友
	if optye == 1 then
		AddRoleTaskOperate(uid, 10325)
		if num >= 3 then
			AddRoleTaskOperate(uid, 10326)
			if num >= 5 then
				AddRoleTaskOperate(uid, 10327)
				if num >= 10 then
					AddRoleTaskOperate(uid, 10328)
				end
			end
		end
	end
end
