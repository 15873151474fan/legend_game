--英雄会第二层(废弃)

CopySceneInfo_16 = { }

--副本创建初始化
function CopySceneInfo_16:InitCopyScene(cid)
	s_setSceneVar(cid,0,0,s_getCurTime(TIME_ALLSECONDS))
end

function CopySceneInfo_16:OnPlayerIntoCopyScene(cid,uid)
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,0)
	s_sendCopyInfo(cid,2,300- pass,"剩余时间结束后可进入下一层")
end

function OnLoopCopyScene_1Sec_16(ctype,cid)
	local TOTAL_WAIT_TIME = 300
	local pass = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,0)
	if pass >= TOTAL_WAIT_TIME then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			local leader = s_getTeamLeader(list[i+1])
			if leader == list[i+1] then
				local room = math.random(1,3)
				for j = 1,table.getn(list), 2 do
					if s_getTeamLeader(list[j+1]) == leader then
						s_removebuff(list[j],list[j+1],10502)
						s_removebuff(list[j],list[j+1],10703)
						s_intoCopy(list[j+1],17,room)
					end
				end
			end
		end
		s_clearCopy(cid)
	end
end
