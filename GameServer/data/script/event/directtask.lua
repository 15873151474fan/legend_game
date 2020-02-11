--直接完成任务
function OnDirectFinishTaskEvent(uid,taskid)
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if process ~= TaskProcess_CanDone then
		return
	end
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info == nil then
		return
	end
	if info.selectitem == nil or table.getn(info.selectitem) <= 0 then
		FinishRoleTask(uid,taskid)
	else
		local msg = GetSelectItemListText(info.selectitem)
		msg = "<p><newline></newline></p><p><newline></newline></p>"..msg
		ShowNpcMenuBottomStyle(uid,msg,"完成(3)","FinishRoleTask($1,"..taskid..")","取消(3)")
	end
end
