--奖励领取兑换
function OnRequestVoteOkEvent(uid,votetype,voteid)
	if s_getVar(uid,10002,voteid) ~= 0 then
		s_sysInfo(uid,"已经领取过奖励！",ChatPos_Sys + ChatPos_Important)
	else
		if voteid == 500001 then
			s_addVar(uid,"谢谢您参与投票",voteid )
			s_addItem(uid,20158,0,1,0,"1-1,3-7200","3级及以下玩家调查领取")
			s_sysInfo(uid,"谢谢您参与投票" )
		else
			if voteid == 500002 then
				s_addVar(uid,"谢谢您参与投票",voteid )
				s_addItem(uid,20158,0,1,0,"1-1,3-7200","3级以上玩家调查领取")
				s_sysInfo(uid,"谢谢您参与投票" )
			end
		end
	end
end
