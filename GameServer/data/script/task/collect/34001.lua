--晶源矿脉收集矿晶
RoleTaskInfo34001 =
{    
    subtasknum = 1,
    subtask1 =
    {
        onaccept = {
            {s_actionIntoCopyCustomSingle,{1209,223,37,10}},
        },
    },
}

function RoleTaskInfo34001:OnFinishTask(uid)
        s_refreshDayTaskNum(uid,30006, s_getVar(uid,167,20))
end

function RoleTaskInfo34001:GetTaskDailyInfo(uid, outvec)
    if outvec == nil then return end
    --local week = s_getCurTime(5)
    --if week == 0 or week == 6 then 
    --taskid

    table.insert(outvec, 30006)
    --dayNum
    table.insert(outvec, 1)
    --dayNoneNum
    table.insert(outvec, s_getVar(uid,167,20))
    --weekNum
    table.insert(outvec, 0)
    --WeekDoneNum
    table.insert(outvec, 0)
end
    


