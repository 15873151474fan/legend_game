--玩家飞升提升事件
function OnPlayerRebirthUpEvent(userid,level)

    if level == 1 then
        --完成主线飞升1级任务
        if s_hasTask(userid,5102)  == VALUE_OK then
            AddRoleTaskOperate(userid,5102)
        end
	s_debug("333333333333333333333333")
--	AddRoleTaskForGM(userid,10001)
    elseif level == 3 then
	s_setVar(userid,460,1,1)
	OnGetAllTaskDailyInfo(userid)
    elseif level == 2 then
        --完成主线飞升2级任务
        if s_hasTask(userid,5109)  == VALUE_OK then
            AddRoleTaskOperate(userid,5109)
        end
	OnRequestFenmoDailyTask(userid)
    elseif level == 4 then
        --完成主线飞升4级任务
        if s_hasTask(userid,5116)  == VALUE_OK then
            AddRoleTaskOperate(userid,5116)
        end
    elseif level == 6 then
        --完成主线飞升6级任务
        if s_hasTask(userid,5123)  == VALUE_OK then
            AddRoleTaskOperate(userid,5123)
        end
    elseif level == 8 then
        --完成主线飞升8级任务
        if s_hasTask(userid,5131)  == VALUE_OK then
            AddRoleTaskOperate(userid,5131)
        end
    elseif level == 10 then
        --完成主线飞升10级任务
        if s_hasTask(userid,5138)  == VALUE_OK then
            AddRoleTaskOperate(userid,5138)
        end
   
   end

end

-- 检测玩家飞升等级(玩家误删后,恢复数据时field为0)
function CheckUserRebirthLevel(uid)
	if s_getVar(uid, 143, 4) ~= s_getField(uid, UserVar_RebirthNum) then
		s_debugUser(uid, "field 中飞升等级与var中不相等,重置为var中的值:"..s_getVar(uid, 143, 4))
		s_setField(uid, UserVar_RebirthNum, s_getVar(uid, 143, 4))
	end
end
