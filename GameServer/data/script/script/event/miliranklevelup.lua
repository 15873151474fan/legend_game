--军衔升级事件,只是第一次升N时触发，降了以后再升不会触发
function OnMiliRankLevelUpEvent(uid,rank)
	--前3级任务做
	if rank > 3 then
		s_sysInfo(uid,"去找女王授勋吧")
	end
	--军衔提升引导任务
	if rank >= 5 then
		AddRoleTaskOperate(uid,11832)
	end
	if rank >= 8 then
		AddRoleTaskOperate(uid,11833)
	end
	if rank == 8 then
		AddAchieveTaskOperate(uid,41011,1)
	end
end
