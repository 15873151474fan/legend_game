--客户端请求任务描述
function OnReqTaskDescEvent(uid, taskid)
	-- 团成就
	if math.floor(taskid/100) == 205 then
		local desc = GetCorpsAchieveText(uid,taskid)
		if desc ~= nil then
			s_retTaskDesc(uid, taskid, desc)
		end
	elseif taskid == 20003 then
		if s_getTaskValue(uid, taskid,TaskValue_Process) == TaskProcess_CanDone then
			local desc = GetSubTaskDescText(uid, 20003, 1)
			if desc ~= nil then
				s_retTaskDesc(uid, taskid, desc)
			end
		end
	end
end

--获得任务描述的文本
function GetCorpsAchieveText(uid, taskid)
	local awards =
		{
			[20501] = {5, 400}, [20502] = {10, 500},[20503] = {10, 500},[20504] = {15, 500},[20505] = {20, 500},
			[20506] = {30, 500}, [20507] = {30, 500},[20508] = {40, 1000},[20509] = {50, 1000},[20510] = {60, 2000},
			[20511] = {75, 3000}, [20512] = {100, 4000},[20513] = {125, 5000},[20514] = {150, 7500},[20515] = {200, 10000},
			[20516] = {250, 15000}, [20517] = {400, 20000},[20518] = {600, 40000}
		}
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	local text1 = nil
	if info == nil then return "" end
	local text1 = info.desctext
	if text1 == nil or text1 == "" then
		return ""
	end
	text1 = trim(text1)
	text1 = text1 ..[[<p>]] .. TASK_HL_ICON1 .. [[</image></p>]]
	local offer = awards[taskid][1]
	local level = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_LEVEL)
	local exp = math.floor(level^1.5 * (15+offer*2.5))
	if exp > 0 then
		text1 = text1 ..[[<p>]].. TASK_EXP_ICON1 .. exp ..[[ 经验</button></p>]]
	end
	if offer > 0 then
		text1 = text1 ..[[<p>]].. TASK_CONTRI_ICON1 .. offer ..[[ 团勋章</button></p>]]
	end
	local cmoney = awards[taskid][2]
	if cmoney > 0 then
		text1 = text1 ..[[<p>]].. TASK_CORP_MONEY_ICON1 .. cmoney ..[[ 团资金</button></p>]]
	end
	return text1
end

