--对地使用物品事件
function OnUseItemFloorEvent(uid,itemid,x,y)
	local baseid = s_getItemValue(uid,itemid,Item_Base_ID)
	--蜂蜜
	if baseid == 31075 then
		local guard = s_getGuardID(uid)
		if guard == nil or guard == 0 then
			return
		end
		local guard_baseid = s_getValue(SCENE_ENTRY_NPC,guard,VALUE_TYPE_BASE_ID)
		if guard_baseid == nil or guard_baseid == 0 then
			return
		end
		if guard_baseid ~= 60071 then
			return
		end
		local process = s_getTaskValue(uid,10732,TaskValue_Process)
		if process ~= TaskProcess_Doing and process ~= TaskProcess_CanDone then
			return
		end
		local step = math.random(3,6)
		s_move(SCENE_ENTRY_NPC,guard,x,y,step)
		local times = s_getTaskVar(uid,10732,11)
		s_addTaskVar(uid,10732,11,times+1)
		s_sysInfo(uid,"蜂蜜使用次数:"..(times+1),ChatPos_Important)
	end
end
