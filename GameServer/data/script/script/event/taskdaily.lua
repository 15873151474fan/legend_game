--请求任务每日完成信息
function OnGetAllTaskDailyInfo(uid)
	local outvec = {}
    local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
    --守卫王城
    if level >= 67 then
        CopySceneInfo_2001:GetTaskDailyInfo(uid, outvec)
    end
    --摇钱树
--    if level >= 70 then
--        MoneyTreeTaskDailyInfo(uid, outvec)
--    end
    --副本
    if level >= 70 then
        GetDailyFinishInfo(uid, outvec)
    end
    --佣兵任务
    if level >= 53 then
        RoleTaskInfo31001:GetTaskDailyInfo(uid, outvec)
    end
	
	
	if level >= 70 then
		GetMineralCopyInfo(uid)
	end
    --宝藏任务
    if level >= 70 then
        RoleTaskInfo32001:GetTaskDailyInfo(uid, outvec)
    end
	--阴阳妖参
	--if level >=1 then
	--	GetYinYangGinsengDailyInfo(uid, outvec)
	--end

    --矿脉任务
    --if level >= 1 then
    --    RoleTaskInfo34001:GetTaskDailyInfo(uid, outvec)
    --end

	--阴阳妖参
	--if level >=70 then
	--	RoleTaskInfo40001GetTaskDailyInfo(uid, outvec)
	--end
	s_debug("22222222222222222222")
	local re = s_getRebirthLevel(uid)
	if re >= 2 then
		s_debug("111111111111111111111111111")
		OnRequestFenmoDailyTask(uid)
	end
	if re >= 1 and s_getVar(uid,460,1) == 1 then
		s_debug("fenmozhi--------111111111111111111111111111")
		if s_getVar(uid,460,2) == 0 then
		s_debug("fenmozhi=========111111111111111111111111111")
			AddRoleTaskForGM(uid,10001)	
			s_setVar(uid,460,2,1)
		end
	end	

	local num = table.getn(outvec)
	if num == 0 or num % 5 ~= 0 then return end
	num = num / 5;
	s_refreshDayTaskInfo(uid, num, outvec)
end

function RefreshCopyDailyInfo(uid)
	local outvec = {}

    GetDailyFinishInfo(uid, outvec)

	local num = table.getn(outvec)
	if num == 0 or num % 5 ~= 0 then return end
	num = num / 5;
    s_refreshDayTaskNum(uid,30003,outvec[3])
end

function RefreshTaskDailyInfo(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return end
	local outvec = {}
	info:GetTaskDailyInfo(uid, outvec)
	local num = table.getn(outvec)
	if num == 0 or num % 5 ~= 0 then return end
	num = num / 5;
	s_refreshDayTaskInfo(uid, num, outvec)
end

--请求团活力任务信息
function OnGetCorpsActivityTaskInfo(uid)
	local outvec = {}
	--RoleTaskInfo33700:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33701:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33702:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33703:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33704:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33705:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33706:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33707:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33708:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33709:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33710:GetCorpsTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33711:GetCorpsTaskWeekInfo(uid,outvec)
	local num = table.getn(outvec)
	if num == 0 or num % 4 ~= 0 then return end
	num = num / 4;
	local activity = s_getVar(uid,130,100)
	s_refreshCorpsActivityInfo(uid, num, activity, outvec)
end

--请求国家活力任务信息
function OnGetCountryActivityTaskInfo(uid)
	local outvec = {}
	--RoleTaskInfo33800:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33801:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33802:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33803:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33804:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33805:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33806:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33807:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33808:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33809:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33810:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33811:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33812:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33813:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33814:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33815:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33816:GetCountryTaskWeekInfo(uid,outvec)
	--RoleTaskInfo33817:GetCountryTaskWeekInfo(uid,outvec)
	local num = table.getn(outvec)
	if num == 0 or num % 4 ~= 0 then return end
	num = num / 4;
	local activity = s_getVar(uid,130,200)
	s_refreshCountryActivityInfo(uid, num, activity, outvec)
end

function OnGetCorpsActivityBox(uid,gtype)
	local corps = s_getCorpsId(uid)
	if corps == nil or corps == 0 then
		return
	end
	local worldlevel = s_getWorldLevel()
	local donenum = 0
	if s_getCorpsVar(corps,1,43) == CORPS_ACTIVITY_33700 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,44) == CORPS_ACTIVITY_33701 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,45) == CORPS_ACTIVITY_33702 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,46) == CORPS_ACTIVITY_33703 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,47) == CORPS_ACTIVITY_33704 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,48) == CORPS_ACTIVITY_33705 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,49) == CORPS_ACTIVITY_33706 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,50) == CORPS_ACTIVITY_33707 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,51) == CORPS_ACTIVITY_33708 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,52) == CORPS_ACTIVITY_33709 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,53) == CORPS_ACTIVITY_33710 then
		donenum = donenum+1
	end
	if s_getCorpsVar(corps,1,54) == CORPS_ACTIVITY_33711 then
		donenum = donenum+1
	end
	if gtype == 1 then
		if s_getVar(uid,130,101) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		-- 判断人类进程
		if worldlevel == 1 then
			if donenum >= 1 and s_getVar(uid,130,100) >= 1 then
				s_addItem(uid,63020,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,101,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel == 2 then
			if donenum >= 3 and s_getVar(uid,130,100) >= 2 then
				s_addItem(uid,63020,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,101,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel >= 3 then
			if donenum >= 5 and s_getVar(uid,130,100) >= 4 then
				s_addItem(uid,63020,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,101,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		end
	elseif gtype == 2 then
		if s_getVar(uid,130,102) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		-- 判断人类进程
		if worldlevel == 1 then
			if donenum >= 1 and s_getVar(uid,130,100) >= 1 then
				s_addItem(uid,63021,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,102,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel == 2 then
			if donenum >= 4 and s_getVar(uid,130,100) >= 3 then
				s_addItem(uid,63021,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,102,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel >= 3 then
			if donenum >= 8 and s_getVar(uid,130,100) >= 6 then
				s_addItem(uid,63021,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,102,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		end
	elseif gtype == 3 then
		if s_getVar(uid,130,103) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		-- 判断人类进程
		if worldlevel == 1 then
			if donenum >= 1 and s_getVar(uid,130,100) >= 1 then
				s_addItem(uid,63022,0,1,0,"1-1","OnGetCorpsActivityBox") -- 可领取
				s_setVar(uid,130,103,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel == 2 then
			if donenum >= 5 and s_getVar(uid,130,100) >= 4 then
				s_addItem(uid,63022,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,103,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		elseif worldlevel >= 3 then
			if donenum >= 10 and s_getVar(uid,130,100) >= 8 then
				s_addItem(uid,63022,0,1,0,"1-1","OnGetCorpsActivityBox")-- 可领取
				s_setVar(uid,130,103,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		end
	end
end

function OnGetCountryActivityBox(uid,gtype)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if homeland == nil or homeland == 0 then
		return
	end
	local worldlevel = s_getWorldLevel()
	local donenum = 0
	if s_getCountryVar(homeland,12,1) == COUNTRY_ACTIVITY_33800 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,2) == COUNTRY_ACTIVITY_33801 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,3) == COUNTRY_ACTIVITY_33802 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,4) == COUNTRY_ACTIVITY_33803 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,5) == COUNTRY_ACTIVITY_33804 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,6) == COUNTRY_ACTIVITY_33805 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,7) == COUNTRY_ACTIVITY_33806 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,8) == COUNTRY_ACTIVITY_33807 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,9) == COUNTRY_ACTIVITY_33808 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,10) == COUNTRY_ACTIVITY_33809 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,11) == COUNTRY_ACTIVITY_33810 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,12) == COUNTRY_ACTIVITY_33811 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,13) == COUNTRY_ACTIVITY_33812 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,14) == COUNTRY_ACTIVITY_33813 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,15) == COUNTRY_ACTIVITY_33814 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,16) == COUNTRY_ACTIVITY_33815 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,17) == COUNTRY_ACTIVITY_33816 then
		donenum = donenum+1
	end
	if s_getCountryVar(homeland,12,18) == COUNTRY_ACTIVITY_33817 then
		donenum = donenum+1
	end
	if gtype == 1 then
		if s_getVar(uid,130,201) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		if donenum >= 8 and s_getVar(uid,130,200) >= 6 then
			s_addItem(uid,63023,0,1,0,"1-1","OnGetCountryActivityBox")-- 可领取
			s_setVar(uid,130,201,1)
		else
			s_messageBox(uid,"您不满足领奖条件")
			return
		end
	elseif gtype == 2 then
		if s_getVar(uid,130,202) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		if worldlevel <= 2 then
			if donenum >= 10 and s_getVar(uid,130,200) >= 8 then
				s_addItem(uid,63024,0,1,0,"1-1","OnGetCountryActivityBox")-- 可领取
				s_setVar(uid,130,202,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		else
			if donenum >= 12 and s_getVar(uid,130,200) >= 9 then
				s_addItem(uid,63024,0,1,0,"1-1","OnGetCountryActivityBox")-- 可领取
				s_setVar(uid,130,202,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		end
	elseif gtype == 3 then
		if s_getVar(uid,130,203) > 0 then
			s_messageBox(uid,"您本周已经领取过该宝箱了")
			return
		end
		if worldlevel <= 2 then
			if donenum >= 12 and s_getVar(uid,130,200) >= 10 then
				s_addItem(uid,63025,0,1,0,"1-1","OnGetCountryActivityBox")-- 可领取
				s_setVar(uid,130,203,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		else
			if donenum >= 14 and s_getVar(uid,130,200) >= 12 then
				s_addItem(uid,63025,0,1,0,"1-1","OnGetCountryActivityBox")-- 可领取
				s_setVar(uid,130,203,1)
			else
				s_messageBox(uid,"您不满足领奖条件")
				return
			end
		end
	end
end
