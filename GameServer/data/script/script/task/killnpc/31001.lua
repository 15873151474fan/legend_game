RoleTaskInfo31001 = {
    taskid = 31001,
}

---任务完成时的操作
function RoleTaskInfo31001:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end
    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31001:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);

    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31001:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31002 = {
    taskid = 31002,
}

---任务完成时的操作
function RoleTaskInfo31002:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end
    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31002:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31002:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31003 = {
     taskid = 31003,
}

---任务完成时的操作
function RoleTaskInfo31003:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end


    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31003:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31003:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31004 = {
     taskid = 31004,
}

---任务完成时的操作
function RoleTaskInfo31004:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- -- 完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31004:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31004:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31005 = {
     taskid = 31005,
}

---任务完成时的操作
function RoleTaskInfo31005:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31005:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31005:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31006 = {
     taskid = 31006,
}

---任务完成时的操作
function RoleTaskInfo31006:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end
    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1127)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1146)
    -- -- end


    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1115)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1124)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1130)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1136)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1140)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1144)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1150)
    -- -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31006:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31006:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31007 = {
     taskid = 31007,
}

---任务完成时的操作
function RoleTaskInfo31007:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
         AddRoleTaskOperate(uid,5040)
    end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1127)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1146)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1115)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1124)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1130)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1136)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1140)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1144)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1150)
    -- -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31007:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31007:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31008 = {
     taskid = 31008,
}

---任务完成时的操作
function RoleTaskInfo31008:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31008:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31008:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31009 = {
     taskid = 31009,
}

---任务完成时的操作
function RoleTaskInfo31009:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31009:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31009:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

RoleTaskInfo31010 = {
     taskid = 31010,
}

---任务完成时的操作
function RoleTaskInfo31010:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end
    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1127)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1146)
    -- -- end


    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1115)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1124)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1130)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1136)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1140)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1144)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1150)
    -- -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31010:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31010:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31011 = {
     taskid = 31011,
}

---任务完成时的操作
function RoleTaskInfo31011:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31011:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31011:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end



RoleTaskInfo31012 = {
    taskid = 31012,
}

---任务完成时的操作
function RoleTaskInfo31012:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end


function RoleTaskInfo31012:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31012:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31013 = {
     taskid = 31013,
}

---任务完成时的操作
function RoleTaskInfo31013:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31013:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31013:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31014 = {
     taskid = 31014,
}

---任务完成时的操作
function RoleTaskInfo31014:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31014:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31014:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31015 = {
     taskid = 31015,
}

---任务完成时的操作
function RoleTaskInfo31015:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1127)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1146)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1115)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1124)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1130)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1136)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1140)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1144)
    -- -- end

    -- 完成2次才能完成主线
    -- -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- -- if taskProcess == TaskProcess_Doing  then
        -- -- --AddRoleTaskOperate(uid,1150)
    -- -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31015:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31015:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31016 = {
     taskid = 31016,
}

---任务完成时的操作
function RoleTaskInfo31016:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31016:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31016:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31017 = {
     taskid = 31017,
}

---任务完成时的操作
function RoleTaskInfo31017:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31017:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31017:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31018 = {
     taskid = 31018,
}

---任务完成时的操作
function RoleTaskInfo31018:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31018:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31018:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31019 = {
     taskid = 31019,
}

---任务完成时的操作
function RoleTaskInfo31019:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31019:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31019:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31020 = {
     taskid = 31020,
}

---任务完成时的操作
function RoleTaskInfo31020:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31020:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end

function RoleTaskInfo31020:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31021 = {
     taskid = 31021,
}

---任务完成时的操作
function RoleTaskInfo31021:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31021:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31021:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31022 = {
     taskid = 31022,
}

---任务完成时的操作
function RoleTaskInfo31022:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end


    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31022:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31022:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31023 = {
     taskid = 31023,
}

---任务完成时的操作
function RoleTaskInfo31023:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31023:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31023:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31024 = {
     taskid = 31024,
}

---任务完成时的操作
function RoleTaskInfo31024:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1127)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1146)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1115)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1124)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1130)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1136)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1140)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1144)
    -- end

    -- --完成2次才能完成主线
    -- local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    -- if taskProcess == TaskProcess_Doing  then
        -- --AddRoleTaskOperate(uid,1150)
    -- end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31024:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31024:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31025 = {
     taskid = 31025,
}

---任务完成时的操作
function RoleTaskInfo31025:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31025:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31025:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31026 = {
     taskid = 31026
}

---任务完成时的操作
function RoleTaskInfo31026:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end
    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end


    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31026:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31026:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31027 = {
     taskid = 31027
}

---任务完成时的操作
function RoleTaskInfo31027:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31027:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31027:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31028 = {
     taskid = 31028
}

---任务完成时的操作
function RoleTaskInfo31028:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31028:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31028:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31029 = {
     taskid = 31029
}

---任务完成时的操作
function RoleTaskInfo31029:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31029:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31029:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31030 = {
     taskid = 31030
}

---任务完成时的操作
function RoleTaskInfo31030:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31030:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31030:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31031 = {
     taskid = 31031
}

---任务完成时的操作
function RoleTaskInfo31031:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31031:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31031:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31032 = {
     taskid = 31032
}

---任务完成时的操作
function RoleTaskInfo31032:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31032:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31032:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31033 = {
     taskid = 31033
}

---任务完成时的操作
function RoleTaskInfo31033:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31033:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31033:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31034 = {
     taskid = 31034
}

---任务完成时的操作
function RoleTaskInfo31034:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31034:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31034:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31035 = {
     taskid = 31035
}

---任务完成时的操作
function RoleTaskInfo31035:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31035:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31035:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31036 = {
     taskid = 31036
}

---任务完成时的操作
function RoleTaskInfo31036:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31036:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31036:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31037 = {
     taskid = 31037
}

---任务完成时的操作
function RoleTaskInfo31037:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31037:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31037:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31038 = {
     taskid = 31038
}

---任务完成时的操作
function RoleTaskInfo31038:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31038:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31038:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31039 = {
     taskid = 31039
}

---任务完成时的操作
function RoleTaskInfo31039:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31039:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31039:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31040 = {
     taskid = 31040
}

---任务完成时的操作
function RoleTaskInfo31040:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31040:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31040:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31041 = {
     taskid = 31041
}

---任务完成时的操作
function RoleTaskInfo31041:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31041:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31041:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31042 = {
     taskid = 31042
}

---任务完成时的操作
function RoleTaskInfo31042:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31042:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31042:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31043 = {
     taskid = 31043
}

---任务完成时的操作
function RoleTaskInfo31043:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31043:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31043:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31044 = {
     taskid = 31044
}

---任务完成时的操作
function RoleTaskInfo31044:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31044:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31044:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end


RoleTaskInfo31045 = {
     taskid = 31045
}

---任务完成时的操作
function RoleTaskInfo31045:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31045:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31045:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

RoleTaskInfo31046 = {
     taskid = 31046
}

---任务完成时的操作
function RoleTaskInfo31046:OnFinishTask(uid)
    s_addDailyTargetTime(uid, enumDailySubTargetType_RideEvil, 1)
    if s_hasTask(uid,5040)  == VALUE_OK then
        AddRoleTaskOperate(uid,5040)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1127, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1127)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1146, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1146)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1115, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1115)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1124, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1124)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1130, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1130)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1136, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1136)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1140, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1140)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1144, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1144)
    end

    --完成2次才能完成主线
    local taskProcess = s_getTaskValue(uid, 1150, TaskValue_Process)
    if taskProcess == TaskProcess_Doing  then
        --AddRoleTaskOperate(uid,1150)
    end

    s_refreshDayTaskNum(uid,30004, s_getVar(uid,160,1))
end

function RoleTaskInfo31046:GetTaskExp(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"
		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
    --全民狂欢双倍
    if s_getPayRate(enumPaySubType_Double,0) > 1 then
        exp = exp + exp * 1;
    end
	return exp
end


function RoleTaskInfo31046:GetTaskLilian(uid)
	local expstr = s_getTaskValue(uid,self.taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, self.taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end
	local exp = tonumber(expstr)
    local curStarData = EmployDataBase.query(s_getVar(uid,160,5))
    if curStarData == nil then
        return math.floor(exp)
    end
    exp  = math.floor(exp * curStarData.doubleNum * 0.01);
	return exp
end

--每日完成次数
function RoleTaskInfo31001:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30004)
	--dayNum
	table.insert(outvec, 10)
	--dayDoneNum
	table.insert(outvec,  s_getVar(uid,160,1))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end

