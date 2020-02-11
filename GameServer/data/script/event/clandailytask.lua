--帮会日常任务
clandailytasknum=10
--1转以下任务
clantaskinfo1={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,}
--1~2转任务
clantaskinfo2={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,}
--3~4转任务
clantaskinfo3={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,40038,40039,40040,40041,40042,40043,40044,40045,44046,}
--5~6转任务
clantaskinfo4={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,40038,40039,40040,40041,40042,40043,40044,40045,40046,}
--7~8转任务
clantaskinfo5={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,40038,40039,40040,40041,40042,40043,40044,40045,40046,}
--9~10转任务
clantaskinfo6={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,40038,40039,40040,40041,40042,40043,40044,40045,40046,}
--11~12转任务
clantaskinfo7={40001,40002,40003,40004,40005,40006,40007,40008,40009,40010,40011,40012,40013,40014,40015,40016,40017,40018,40019,40020,40021,40022,40023,40024,40025,40026,40027,40028,40029,40030,40031,40032,40033,40034,40035,40036,40037,40038,40039,40040,40041,40042,40043,40044,40045,40046,}

function OnRequestClanDailyTask(uid)
	if 1 then return end
	s_debug("OnRequestClanDailyTask %u",uid)
	 --是否身上有任务

   if s_getVar(uid,169,42) ~= 0 then
		s_debug("已经接取帮会任务 taskid  %d",s_getVar(uid,169,42))
		s_sysInfo(uid,"已经接取帮会日常任务",ChatPos_Tips)
       return
   end
   if s_getVar(uid,169,41) >= clandailytasknum then
		s_sysInfo(uid,"已经接取帮会日常数量上限",ChatPos_Tips)
       return
   end
   local rebirthnum = s_getRebirthLevel(uid)
   local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
   local tmpindex = 1
	if  rebirthnum == 0 then
		tmpindex = 1
	elseif rebirthnum<=2 then
		tmpindex=2
	elseif rebirthnum<=4 then
		tmpindex=3
	elseif rebirthnum<=6 then
		tmpindex=4
	elseif rebirthnum<=8 then
		tmpindex=5
	elseif rebirthnum<=10 then
		tmpindex=6
	elseif rebirthnum<=12 then
		tmpindex=7
	elseif rebirthnum >12 then
		tmpindex = 7
	else tmpindex = 1
   end

	--local tmpindex = 2

	local info = rawget(_G,"clantaskinfo"..tmpindex)
	if info == nil then
		s_debug("获取帮会任务信息出错::index %d",tmpindex)
	end

	local taskid = info[math.random(1,#info)]
	--local taskid = 40017
    --local subinfo = GetSubTaskInfo(taskid, 1)
    local subinfo = GetSubTaskInfo(taskid, 1)
	local targetnum = subinfo.task[2][4]
	AddRoleTaskForGM(uid,taskid,targetnum,1, 0)
	if s_hasTask(uid,taskid) then
		s_setVar(uid,169,42,taskid)
		s_sendClanTaskInfo(uid,taskid,s_getVar(uid,169,41),1)

		s_debugUser(uid," 添加帮会任务 >>>>>>>id  %u ",taskid)
	end
	--离线找回
	if s_getVar(uid,169,105) < clandailytasknum then
		s_setVar(uid,169,105,s_getVar(uid,169,105)+1)
	end
	if s_getVar(uid,169,105) <= clandailytasknum then
		s_setVar(uid,169,111,clandailytasknum - s_getVar(uid,169,105))
	end
	if s_getVar(uid,169,105) == clandailytasknum then
		s_setVar(uid,169,111,0)
	end

	s_debugUser(uid,"CLan OfflineBack %u",s_getVar(uid,169,111))
	return VALUE_OK
end

function OnFinishClanDailyTask(uid)
	s_debug("OnFinishClanDailyTask %u taskid %u",uid,s_getVar(uid,169,42))
	if 1 then return end

	taskid = s_getVar(uid,169,42)
    local process = s_getTaskValue(uid,taskid,TaskValue_Process)

	local finishnum = s_getVar(uid,169,41)
	if taskid == 0 or taskid == nil or finishnum == nil then
		s_debugUser(uid,"帮会日常任务完成未找到任务id ")
		return
	end

    local taskinfo = GetTaskInfo(taskid)
    if taskinfo == nil then
        s_debugUser(uid,"完成帮会任务错taskinfo=nil")
        return
    end

    if process ~= TaskProcess_CanDone then
        s_sysInfo(uid,"请完成任务后再来领奖",ChatPos_Tips)
        return
    end
	local manortaskawardinfo = ManorTaskDataBase.query(finishnum+1)
	if manortaskawardinfo == nil or manortaskawardinfo.itemaward == ""  then
		s_debug(uid,"帮会日常任务完成未查到奖励内容 id %u",finishnum)
		return
	end

    FinishRoleTask(uid,taskid);

	ClanDailyTaskGetRewardWithMail(uid,manortaskawardinfo.itemaward,"帮会日常任务奖励",1,false,AddItemAction_Task,1)

	s_setVar(uid,169,41,s_getVar(uid,169,41)+1)
    s_refreshDayTaskNum(uid,40001, s_getVar(uid,169,41))
	s_addDailyTargetTime(uid,enumDailySubTargetType_ClanDailyTask,1)

	s_delTask(uid,taskid)
	s_setTaskValue(uid,taskid,TaskValue_Process,0)
	s_setVar(uid,169,42,0)

	return VALUE_OK
end

function ClanDailyTaskRefreshInfo(uid)
	--local taskid = s_getVar(uid,169,42)
    --FinishRoleTask(uid,taskid);
	--s_delTask(uid,taskid)
	--s_setTaskValue(uid,taskid,TaskValue_Process,0)
	--s_setVar(uid,169,42,0)
	s_debug("ClanDailyTaskRefreshInfo taskid %u cyclenum %u ",s_getVar(uid,169,42),s_getVar(uid,169,41))
	if 1 then return end
	if s_getVar(uid,169,42) == nil or s_getVar(uid,169,42) == 0 then
		s_sendClanTaskInfo(uid,0,s_getVar(uid,169,41),0)
		return
	end

	if s_getVar(uid,169,41) >= clandailytasknum then
		s_sysInfo(uid,"已经接取帮会日常数量上限",ChatPos_Tips)
		return
	end
	s_sendClanTaskInfo(uid,s_getVar(uid,169,42),s_getVar(uid,169,41),s_getTaskValue(uid,s_getVar(uid,169,42),TaskValue_Process))
	return VALUE_OK
end

function RoleTaskInfo40001GetTaskDailyInfo(uid, outvec)
	if 1 then return end
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 40001)
	--dayNum
	table.insert(outvec, clandailytasknum)
	--dayDoneNum
	table.insert(outvec,  s_getVar(uid,169,41))
	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end


function ClanRemoveUserAndExitFunishTask(uid,taskid)
--	 FinishRoleTask(uid,taskid);
--
--	--s_setVar(uid,169,41,s_getVar(uid,169,41)+1)
--    --s_refreshDayTaskNum(uid,40001, s_getVar(uid,169,41))
--
--	s_delTask(uid,taskid)
--	s_setTaskValue(uid,taskid,TaskValue_Process,0)
--	s_setVar(uid,169,42,0)
end

-- 添加道具到主背包，空间不足将会发邮件
function ClanDailyTaskGetRewardWithMail(uid, awarditem, reason, rate, checkjob, actiontype,etype)
	s_debugUser(uid, "ClanDailyTaskGetRewardWithMail"..(reason or "未知原因").." 开始:倍数、检查职业:" .. rate .. "," .. tostring(checkjob))
	local itemlist = loadstring("return " .. awarditem)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end

	local times = 1
	if rate ~= nil and rate ~= 0 then
		times = rate
	end
	local action = actiontype or 0

	-- 添加物品
	for i, item in ipairs(itemlist) do
		if checkjob and not s_fitProfession(uid,item[1]) then
			item[3] = 0
		else
			local maxnum = s_getItemMaxnum(item[1])
			if maxnum == nil or maxnum < 1 then
				s_error("s_addItem error uid,itemid:" .. uid .. "," .. item[1])
				return
			end
			local total = item[3] * times
			if item[1] == 19021 and etype == 1 then
				local gxrate = s_getClanGxAndExpRate(uid,1)
				if gxrate ~= nil then
					total = total * gxrate
				end
			end
			if item[1] == 19005 and etype == 1 then
				local gxrate = s_getClanGxAndExpRate(uid,2)
				if gxrate ~= nil then
					total = total * gxrate
				end
			end
			if item[1] == 19005 and etype == 2 then
				local gxrate = s_getClanGxAndExpRate(uid,3)
				if gxrate ~= nil then
					total = total * gxrate
				end
			end
			local surplus = 0
			--s_debugUser(uid, "ClanDailyTaskGetRewardWithMail >>>>>>>>>>>>  ".." type "..item[1].." total  "..(total or 0))
			while total > 0 do
				if total <= maxnum then
					surplus = s_addItemToBag(uid, PACKAGETYPE_MAIN, item[1], total, item[4], item[5], reason, action)
					if surplus ~= nil then
						total = surplus
					else
						s_trace("GetRewardWithMail 4444 出错")
					end
					break
				else
					surplus = s_addItemToBag(uid, PACKAGETYPE_MAIN, item[1], maxnum, item[4], item[5], reason, action)
					if surplus == nil then
						s_errorm("GetRewardWithMail 5555 出错")
						break
					elseif surplus > 0 then
						total = total + surplus - maxnum
						break
					else
						total = total - maxnum
					end
				end
			end
			item[3] = total
		end
	end

	local mailitems = {}
	for i, item in ipairs(itemlist) do
		if item[3] ~= 0 then
			table.insert(mailitems,item)
		end
	end

	if #mailitems ~= 0 then
		local subject = reason
		local text = "背包空间不足，部分道具发送到邮箱"
		s_sendMail(uid, subject, text, mailitems, reason)
		s_sysInfo(uid,"背包空间不足，道具已发送至邮箱，请注意查收",ChatPos_Tips)
	end
	s_debugUser(uid, "GetRewardWithMail "..(reason or "未知原因").." 成功")
	return 1
end

function RemoveUserFromClan(uid)
	if 1 then return end
	if s_getVar(uid,169,42) > 0 then
		s_removeAllTaskMaterial(uid,s_getVar(uid,169,42))
		FinishRoleTask(uid,s_getVar(uid,169,42))
		s_setTaskValue(uid,s_getVar(uid,169,42),TaskValue_Process,0)
		s_delTask(uid,s_getVar(uid,169,42))
		s_setVar(uid,169,42,0)
	end
end


