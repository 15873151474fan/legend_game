RoleTaskInfo31101 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,43}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,43}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31101:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end

    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31101:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local bindgold = 0
	local expstr = s_getTaskValue(uid,31101,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31101, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end
    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 70
	end
    return bindgold;
end

RoleTaskInfo31102 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,42}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,42}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31102:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31102:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local expstr = s_getTaskValue(uid,31102,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31102, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local bindgold = 0;
	local exp = tonumber(expstr)

    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end

    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 140
	end
--    return exp;
    return bindgold;
end

RoleTaskInfo31103 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,41}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,41}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}


---任务完成时的操作
function RoleTaskInfo31103:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31103:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local expstr = s_getTaskValue(uid,31103,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31103, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local bindgold = 0
	local exp = tonumber(expstr)

    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run or  step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end

    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 210
	end
--    return exp;
    return bindgold;
end

RoleTaskInfo31104 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,40}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,40}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31104:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
    	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
	s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31104:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local expstr = s_getTaskValue(uid,31104,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31104, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local bindgold = 0
	local exp = tonumber(expstr)

    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end

    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 280
	end
--    return exp;
    return bindgold;
end

RoleTaskInfo31111 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,43}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,43}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31111:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31111:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local bindgold = 0
	local expstr = s_getTaskValue(uid,31111,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31101, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end
    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 70
	end
    return bindgold;
end

RoleTaskInfo31112 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,42}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,42}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31112:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31112:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local bindgold = 0
	local expstr = s_getTaskValue(uid,31112,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31112, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end
    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 70
	end
    return bindgold;
end

RoleTaskInfo31113 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,41}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,41}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31113:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31113:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local bindgold = 0
	local expstr = s_getTaskValue(uid,31101,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31101, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end
    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 70
	end
    return bindgold;
end

RoleTaskInfo31114 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
            {s_addTaskTitle,{0,40}},
            {s_actionAddBuff,{2006}},
            {s_actionAddBuff,{2007}},
		},

        onfinish = {
            {s_actionSetTaskVar,{161,4,0}},
            {s_actionSetTaskVar,{161,5,0}},
            {s_delTaskTitle,{0,40}},
            {s_actionRemoveBuff,{2006}},
            {s_actionRemoveBuff,{2007}},
        },
	},
}

---任务完成时的操作
function RoleTaskInfo31114:OnFinishTask(uid)
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1036)
    end
	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1117)
    end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1126)
    end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1139)
    end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1145)
    end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1153)
    end

    s_addDailyTargetTime(uid, enumDailySubTargetType_PostCar, 1)
	if s_getVar(uid, 147, 1) == 0 then
		s_addDailyTargetTime(uid, enumDailySubTargetType_xianshi, 1)
		s_setVar(uid,147,1,1)
	end
    s_refreshDayTaskNum(uid,30000, s_getVar(uid,161,1))
    s_setVar(uid,161,3,0)
    s_setVar(uid,161,4,0)
end

function RoleTaskInfo31114:GetTaskExp(uid)
    local isfaild =s_getVar(uid,161,5)
	--检查表格
	local bindgold = 0
	local expstr = s_getTaskValue(uid,31101,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, 31101, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end
	local exp = tonumber(expstr)
    --双倍押镖
    local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
    local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
    local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
    if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
        exp = exp * 2;
    end
    --失败
    if isfaild == 1 then
--        exp = math.floor(exp * 0.8 )
		bindgold = 280
	end
    return bindgold;
end

--[[
function RoleTaskInfo31101:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 30000)
	--dayNum
	table.insert(outvec, 2)
	--dayDoneNum
	table.insert(outvec,  s_getVar(uid,161,1))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
--]]
