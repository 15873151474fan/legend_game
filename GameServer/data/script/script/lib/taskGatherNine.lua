--收集多个道具，九宫格收集

--------------------------------------------------------------------------------------------------
--道具检查函数

--检查道具是否为装备{}
function s_itemCheckEquip(uid, taskid, subtaskid, thisid, paramlist)
	local name = s_getItemValue(uid,thisid,Item_Base_Name)
	if checkEquip(uid, thisid) ~= VALUE_OK then
		s_sysInfo(uid,name.."不是装备，无法交付")
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查道具需求等级是否满足[minLevel,maxLevel]{int:minLevel, int:maxLevel}
function s_itemCheckNeedLevel(uid, taskid, subtaskid, thisid, paramlist)
	local name = s_getItemValue(uid,thisid,Item_Base_Name)
	local needLevel = s_getItemValue(uid,thisid,Item_Base_NeedLevel)
	if paramlist[1] ~= nil and paramlist[1] ~= 0 then
		if needLevel < paramlist[1] then
			s_sysInfo(uid, name.."等级低于"..paramlist[1].."级，无法交付")
			return VALUE_FAIL
		end
	end

	if paramlist[2] ~= nil and paramlist[2] ~= 0 then
		if needLevel > paramlist[2] then
			s_sysInfo(uid, name.."等级高于"..paramlist[2].."级，无法交付")
			return VALUE_FAIL
		end
	end

	return VALUE_OK
end

--检查道具是否鉴定{int:0/1(0表示不需要鉴定,1表示需要鉴定)}
function s_itemCheckJudge(uid, taskid, subtaskid, thisid, paramlist)
	if paramlist[1] == nil then return VALUE_OK end

	local name = s_getItemValue(uid,thisid,Item_Base_Name)
	if paramlist[1] == 0 and s_getItemValue(uid,thisid,Item_Attribute_Judge) ~= 0 then
		s_sysInfo(uid, name.."已经鉴定，无法交付")
		return VALUE_FAIL
	elseif paramlist[1] ~= 0 and s_getItemValue(uid,thisid,Item_Attribute_Judge) == 0 then
		s_sysInfo(uid, name.."没有鉴定，无法交付")
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查道具品质[minQuality,maxQuality]{int:minQuality, int:maxQuality}
function s_itemCheckQuality(uid, taskid, subtaskid, thisid, paramlist)
	local name = s_getItemValue(uid,thisid,Item_Base_Name)
	local quality = s_getItemValue(uid,thisid,Item_Attribute_Quality)
	if paramlist[1] ~= nil and paramlist[1] ~= 0 and quality < paramlist[1] then
		s_sysInfo(uid,name.."品质不符合要求，无法交付")
		return VALUE_FAIL
	end
	if paramlist[2] ~= nil and paramlist[2] ~= 0 and quality > paramlist[2] then
		s_sysInfo(uid,name.."品质不符合要求，无法交付")
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查道具类型[minType,maxType]{int:minType, int:maxType}
function s_itemCheckType(uid, taskid, subtaskid, thisid, paramlist)
	local name = s_getItemValue(uid,thisid,Item_Base_Name)
	local itemtype = s_getItemValue(uid,thisid,Item_Base_Type)
	if paramlist[1] ~= nil and paramlist[1] ~= 0 then
		if itemtype < paramlist[1] then
			s_sysInfo(uid,name.."类型不符合要求，无法交付")
			return VALUE_FAIL
		end
	end

	if paramlist[2] ~= nil and paramlist[2] ~= 0 then
		if itemtype > paramlist[2] then
			s_sysInfo(uid,name.."类型不符合要求，无法交付")
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end

--------------------------------------------------------------------------------------------------
--收集多个道具{int:BeginNpcID, int:EndNpcID, int:道具数量}
function s_taskGatherNine(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil or paramlist[2] == nil or paramlist[3] == nil then return end
	local beginNpcID = paramlist[1]
	local endNpcID = paramlist[2]
	local itemNum = paramlist[3]

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskGatherNine_AcceptDealer($1,"..taskid..","..subtaskid..","..itemNum..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskGatherNine_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskGatherNine_Accept(uid, taskid, subtaskid, itemNum)
	end
end

function s_taskGatherNine_AcceptDealer(uid, taskid, subtaskid, itemNum)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskGatherNine_Accept($1,".. taskid .. "," .. subtaskid ..","..itemNum..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskGatherNine_Accept(uid, taskid, subtaskid, itemNum)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	AddRoleSubTask(uid, taskid, subtaskid, itemNum, 0, 0, 0, subinfo.task[2][2])
end

function s_taskGatherNine_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local name = GetTaskName(taskid)
		local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
		if msg == nil then return end
		ShowNinePack(uid,name,msg,"确定","s_taskGatherNine_CheckItem($1,"..taskid..","..subtaskid..",$2,$3,$4,$5,$6,$7,$8,$9,$10)")
	elseif taskProcess == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
		if msg == nil then return end
		local call = "FinishRoleSubTask($1,".. taskid .. "," .. subtaskid..")"
		local info = GetTaskInfo(taskid)
		if subtaskid >= info.subtasknum then
			ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
		else
			ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
		end
	end
end


function s_taskGatherNine_CheckItem(uid, taskid, subtaskid, item1, item2, item3, item4, item5, item6, item7, item8, item9)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end

	local itemlist = {}
	if item1 ~= 0 then table.insert(itemlist, item1) end
	if item2 ~= 0 then table.insert(itemlist, item2) end
	if item3 ~= 0 then table.insert(itemlist, item3) end
	if item4 ~= 0 then table.insert(itemlist, item4) end
	if item5 ~= 0 then table.insert(itemlist, item5) end
	if item6 ~= 0 then table.insert(itemlist, item6) end
	if item7 ~= 0 then table.insert(itemlist, item7) end
	if item8 ~= 0 then table.insert(itemlist, item8) end
	if item9 ~= 0 then table.insert(itemlist, item9) end

	for i=1, table.getn(itemlist), 1 do
		local bValid = true
		if subinfo.checkitem ~= nil and type(subinfo.checkitem) == "table" and table.getn(subinfo.checkitem) > 0 then
			for j=1, table.getn(subinfo.checkitem), 1 do
				if subinfo.checkitem[j][1](uid, taskid, subtaskid, itemlist[i], subinfo.checkitem[j][2]) == VALUE_FAIL then
					bValid = false
					break
				end
			end
		end

		if bValid == true then
			if s_deleteItemByThisID(uid,itemlist[i],1,"RoleTaskInfo"..taskid.."_"..subtaskid) == VALUE_OK then
				AddRoleTaskOperate(uid, taskid)
			end
		end

		local process = s_getTaskValue(uid,taskid,TaskValue_Process)
		if process == TaskProcess_CanDone then
			break
		end
	end

	s_taskGatherNine_FinishDealer(uid, taskid, subtaskid)
end



--[[

RoleTaskInfo1 =
{
	subtasknum = 1,
	subtask1 = 
	{
		--道具检查函数
		checkitem = 
		{
			{s_itemCheckType,{1,19}},
			{s_itemCheckEquip,{}},
			{s_itemCheckJudge,{0}},
			{s_itemCheckNeedLevel,{1,10}},
			{s_itemCheckQuality,{2,2}},
		},

		task = {s_taskGatherNine, {60013, 60045, 10}},
	},
}

]]
