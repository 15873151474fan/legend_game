-- 请求进入材料副本
function RequestIntoMineralCopy(uid, chapterid)
	--s_setVar(uid,140,96,2)
	if chapterid == 0 then
		s_debugUser(uid,"材料副本外挂1111！！！")
		return
	end
        --已经在副本中
	local flag = s_getVar(uid,140,144)
        if flag == 1 then
                s_debugUser(uid,"材料副本外挂22222！！！")
                return
        end 
	s_setVar(uid,140,93,0)
	s_setVar(uid,140,95,0)
	s_debugUser(uid,"进入材料副本..flag="..flag.." chapterid="..chapterid)

	local chapterName = SceneDataBase.query(chapterid)
	if chapterName == nil then
		s_sysInfo(uid, "副本不存在", ChatPos_Tips)
		return
	end
	local userlevel = s_getUserLevel(uid)
	if not UserLevelCompare(uid, userlevel, chapterName.openlevel) then
		s_sysInfo(uid, "等级不足！", ChatPos_Tips)
		return
	end
	s_setVar(uid,140,95,chapterid)

	if s_getVar(uid, 140, 95 + chapterid) == 0 then
		s_sysInfo(uid, "今天次数已用完！", ChatPos_Tips)
		return
	end
	--local newsceneid = s_intoCopyCustomSingle(uid, chapterName.script, 246, 12, 9, 0)	
	-- 需要卷轴才能进入
	local item = chapterName.cost
	local itemcostnum = chapterName.costnum
	if item ~= nil then
		if s_deleteItemByBaseID(uid,item,itemcostnum,"材料副本扣除") ~= VALUE_OK then
			s_sysInfo(uid, "副本卷轴不足", ChatPos_Tips)
			return
		end
	end

	MaterailCopyHistory = MaterailCopyHistory or {}
	if MaterailCopyHistory[uid] == nil then
		MaterailCopyHistory[uid] = 0
	end
	local copysid = MaterailCopyHistory[uid]
	if copysid ~= 0  and  s_getCopyMapid(copysid,uid) ~= nil and s_getCopyMapid(copysid,uid) ~= 0   then
		s_clearCopy(copysid)
	end	


	
	--[[-- 上次创建的副本还在
	local lastcopysceneid, lastcopymapid = GetLastDailyCopySceneid(uid, 1, chapterid)
	]]--
	s_debugUser(uid,">>>>>>>>>>第一个材料副本 副本id = "..s_getVar(uid, 140, 95)) 	
	local ss = s_getVar(uid,140,96)
	s_debugUser(uid,">>>>>>>>>>第一个材料副本 ss = "..ss)
	s_setVar(uid,140,95 + chapterid,s_getVar(uid, 140, 95 + chapterid) - 1)
	s_addDailyTargetTime(uid,57,1)
	if chapterid == 1 then
		--[[if lastcopymapid == 246 and lastcopysceneid ~= 0 then
			s_clearCopy(lastcopysceneid)	
		end]]--	
		local copysceneid = s_intoCopyCustomSingle(uid, chapterName.script, 246, 23, 22, 0)
		MaterailCopyHistory[uid] = copysceneid
	elseif chapterid == 2 then
		--[[if lastcopymapid == 247 and lastcopysceneid ~= 0 then
			s_clearCopy(lastcopysceneid)
		end]]--
		local copysceneid = s_intoCopyCustomSingle(uid, chapterName.script, 247, 23, 22, 0)
		MaterailCopyHistory[uid] = copysceneid
	elseif chapterid == 3 then
		--[[if lastcopymapid == 248 and lastcopysceneid ~= 0 then
			s_clearCopy(lastcopysceneid)
		end]]--
		local copysceneid = s_intoCopyCustomSingle(uid, chapterName.script, 248, 23, 22, 0)
		MaterailCopyHistory[uid] = copysceneid
	elseif chapterid == 4 then
		--[[if lastcopymapid == 249 and lastcopysceneid ~= 0 then
			s_clearCopy(lastcopysceneid)
		end]]--
		local copysceneid = s_intoCopyCustomSingle(uid, chapterName.script, 249, 23, 22, 0)
		MaterailCopyHistory[uid] = copysceneid;
	end
end

function GetMineralCopyInfo(uid)
	MaterialCopyCheckUserVar(uid)
	local outvec = {}
	local userlevel = s_getUserLevel(uid)
	local rownum = 0
	for i = 1,4,1 do
		local copyid = SceneDataBase.query(i)
		--if UserLevelCompare(uid, userlevel, copyid.openlevel) then
			local total = 0
			local surplus = 0
			surplus = surplus + s_getVar(uid, 140, 95 + i)
			total = total + copyid.intertime
			table.insert(outvec, 30006 + i)
			table.insert(outvec, total)
			table.insert(outvec, surplus)
			rownum = rownum + 1
		--end		
	end
	local Feather = s_getItemNumByBaseID(uid,500002,0)
	s_debugUser(uid,"培养羽毛等级 Feather"..Feather)
	s_refreshMaterialTaskInfo(uid,Feather,rownum,outvec)
end
function MaterialSuccess(uid)
	local copyid = 0
	copyid = s_getVar(uid,140,95)
	s_sendmaterialsuccess(uid,copyid)
end

--每日刷新
function MaterialCopyResetUserVar(uid)
	--[[for i = 1,4,1 do
		local chapterName = SceneDataBase.query(i)
		s_debugUser(uid,">>>>>>>>>>第一个材料副本 chapterName = "..chapterName) 
		s_setVar(uid, 140, 95 + i, chapterName.intertime)
	end]]--
	s_debugUser(uid,">>>>>>>>>>第一个材料副本 chapterName = ")
	local chapterName1 = SceneDataBase.query(1)
	local chapterName2 = SceneDataBase.query(2)
	local chapterName3 = SceneDataBase.query(3)
	local chapterName4 = SceneDataBase.query(4)
	s_setVar(uid, 140,96,chapterName1.intertime)
	s_setVar(uid, 140,97,chapterName2.intertime)
	s_setVar(uid, 140,98,chapterName3.intertime)
	s_setVar(uid, 140,99,chapterName4.intertime)
end
-- 日常副本首次设置玩家数据
function MaterialCopyCheckUserVar(uid)
	--local ss = s_getVar(uid,140,94)
	s_debugUser(uid,">>>>>>>>>>第一个材料副本 ss = ")	
	if s_getVar(uid,140,94) ~= 0 then
		s_debugUser(uid,">>>>>>>>>>222222222222222第一个材料副本 ss = ") 
		return
	end
	s_setVar(uid, 140,94,1)
	MaterialCopyResetUserVar(uid)	
end

function sendMaterialRewardonline(uid)
	local copyid = 0
	copyid = s_getVar(uid,140,95)
	local chapterName = SceneDataBase.query(copyid)
	GetRewardByMail(uid,chapterName.item,"材料副本获得","材料副本未领取奖励！",1,false,0)
	s_setVar(uid,140,93,1)
	s_setVar(uid,140,95,0)
	s_setVar(uid,140,144,0)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>自动发 ")
end

function sendMaterialReward(uid,itemtimes,copyid)
         --local chapterid = 0
         --chapterid = s_getVar(uid,140,95)
	local flag = s_getVar(uid,140,144)
        s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>111111111>第一个材料副 ,flag="..flag)
        if flag == 0 then
        	s_debugUser(uid,"材料副本外挂！！！")
        	return
        end  
	if itemtimes == 3 then
                 local chapterName = SceneDataBase.query(copyid)
                 local usemoney = chapterName.threecost
                 if s_removeMoney(uid,MoneyType_Gold,usemoney,"材料副本三倍领取") ~= VALUE_OK then
                         s_sysInfo(uid,"元宝不足",ChatPos_Tips)
                         return
                 end
         end
         local chapterName = SceneDataBase.query(copyid)
         if s_getVar(uid,140,93) == 2 then
                if s_getPayRate(enumPaySubType_shenshi, 0) > 1 then
			GetRewardWithMail(uid,chapterName.item,"材料副本双倍奖励",1,false,AddItemAction_Task)
		end 
		GetRewardWithMail(uid,chapterName.item,"材料副本获得",itemtimes,false,AddItemAction_Task)
                 s_setVar(uid,140,93,1)
         end
         s_setVar(uid,140,95,0)
         s_setVar(uid,140,144,0)
end
