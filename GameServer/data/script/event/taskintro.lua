--玩家请求任务简介
function OnGetTaskIntroEvent(uid,taskid,toid)
	local introText = GetTaskIntroText(uid, taskid)
	s_refreshTaskIntro(uid, taskid, introText, toid)
end

