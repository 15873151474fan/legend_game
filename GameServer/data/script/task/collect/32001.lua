--藏宝图任务的一些处理
RoleTaskInfo32001 =
{
	subtasknum = 1,
	subtask1 =
	{
	},
}

RoleTaskInfo32002 =
{
	subtasknum = 1,
	subtask1 =
	{
        onaccept = {
            {s_actionIntoCopyCustomSingle,{1002,222,17,12}},
        },
	},
}

RoleTaskInfo32004 =
{
	subtasknum = 1,
	subtask1 =
	{
	},
}

RoleTaskInfo32005 =
{
	subtasknum = 1,
	subtask1 =
	{
	},
}

function RoleTaskInfo32001:OnFinishTask(uid)
    if s_getVar(uid,167,10) ~= 0 then
        s_addDailyTargetTime(uid, enumDailySubTargetType_Treasure, 1)
        s_refreshDayTaskNum(uid,30005, s_getVar(uid,167,10))
    end
end

function RoleTaskInfo32002:OnFinishTask(uid)
    if s_getVar(uid,167,10) ~= 0 then
        s_addDailyTargetTime(uid, enumDailySubTargetType_Treasure, 1)
        s_refreshDayTaskNum(uid,30005, s_getVar(uid,167,10))
    end
end



RoleTaskInfo32003 =
{
    subtasknum = 1,
    subtask1 =
    {
        clicknpc = {300, 5, 0, 3000, 100, 100},
        task = {s_taskClickNpc, {238, 238}},
    },

}

function RoleTaskInfo32003:OnFinishTask(uid)
    if s_getVar(uid,167,10) ~= 0 then
        s_addDailyTargetTime(uid, enumDailySubTargetType_Treasure, 1)
        s_refreshDayTaskNum(uid,30005, s_getVar(uid,167,10))
    end
end


function RoleTaskInfo32004:OnFinishTask(uid)
    if s_getVar(uid,167,10) ~= 0 then
        s_addDailyTargetTime(uid, enumDailySubTargetType_Treasure, 1)
        s_refreshDayTaskNum(uid,30005, s_getVar(uid,167,10))
    end
end

function RoleTaskInfo32005:OnFinishTask(uid)
    if s_getVar(uid,167,10) ~= 0 then
        s_addDailyTargetTime(uid, enumDailySubTargetType_Treasure, 1)
        s_refreshDayTaskNum(uid,30005, s_getVar(uid,167,10))
    end
end


--每日完成次数
function RoleTaskInfo32001:GetTaskDailyInfo(uid, outvec)
    if outvec == nil then return end
    --taskid
    table.insert(outvec, 30005)
    --dayNum
    table.insert(outvec,  5)
    --dayDoneNum
    table.insert(outvec, s_getVar(uid,167,10))
    --weekNum
    table.insert(outvec, 0)
    --weekDoneNum
    table.insert(outvec, 0)
end
