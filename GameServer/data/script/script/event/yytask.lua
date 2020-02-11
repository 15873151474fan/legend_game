--接取YY任务
function OnRequestYYTaskReturn(uid,taskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if taskid == 0 then
		s_messageBox(uid,"YY兵王2先锋任务码输入错误")
		--s_openUrl(uid,1,"http://s.zhushen.game.yy.com/task?accid=" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ACCID) .. "&taskid=" .. taskid)
		return
	elseif taskid == 1 then
		s_messageBox(uid,"YY兵王2先锋任务已经在其他服领取过，同一账号不能重复领取")
		return
	elseif taskid == 15240 then
		AddRoleSubTask(uid,taskid, 1, 1, 0)
		if level >= 21 then
			AddRoleTaskOperate(uid,15240)
		end
	end
end
--接取YY任务
function OnFiinashYYTaskReturn(uid,taskid,idcard)
	if taskid == 0 then
		s_messageBox(uid,"完成YY任务失败")
	elseif taskid == 15240 then
		if idcard ~= nil then
			--s_sysInfo(uid,"完成YY兵王2先锋活动，兑换码已发送至您邮箱！",ChatPos_MsgBox)
			--s_sysMail(uid,"恭喜您完成YY兵王2先锋活动，您的YY兵王2先锋活动兑换码为【".. idcard .."】，请前往YY游戏公会-任务大厅兑换奖励。")
			s_addVar(uid,116,125,1) --任务完成标志
		end
	end
end
