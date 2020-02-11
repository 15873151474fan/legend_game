RoleTaskInfo3771 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {60037, 60627, 1, 1}},
	},
}

function RoleTaskInfo3771:OnAcceptTask(uid)
	local info =
		{
			button = {
				--{"驾驶空行者I型(2)","RoleTaskInfo3771:ToDrive($1,44331)"},
				--{"驾驶铁魔人I型(2)","RoleTaskInfo3771:ToDrive($1,44332)"},
				{"驾驶蝎型兽I型(2)","RoleTaskInfo3771:ToDrive($1,44333)"},
			},
		}
	ShowNpcMenuByTable(uid,info)
end

function RoleTaskInfo3771:ToDrive(uid, equipid)
	s_restdemon(uid)
	s_resetTrafficType(uid)
	local demonid = s_getcurdemon(uid)
	if demonid ~= nil and demonid ~= 0 then
		s_sysInfo(uid,"请收起宠物后再领取装备",ChatPos_Sys + ChatPos_Important)
		return
	end
	if s_getTrafficType(uid) ~= 0 then
		s_sysInfo(uid,"当前状态不可以领取装备",ChatPos_Important + ChatPos_Sys)
		return
	end
	local curequip = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ARMY_EQUIP_ID)
	if curequip ~= 0 then
		return
	end
	local myequip = s_summonArmyEquip(uid, equipid, 1.0)
	s_setValue(SCENE_ENTRY_NPC,myequip,VALUE_TYPE_MASTER, uid)
	--s_setTaskValue(uid,3771,TaskValue_Operate,1)
end

function RoleTaskInfo3771:checkAccept(uid)
	local taskProcess = s_getTaskValue(uid,3771,TaskValue_Process)
	if taskProcess ~= TaskProcess_Doing then
		return VALUE_FAIL
	end
	local curequip = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ARMY_EQUIP_ID)
	if curequip ~= 0 then
		return VALUE_FAIL
	end
	return VALUE_OK
end
function RoleTaskInfo3771:OnFinishTask(uid)
	s_resetTrafficType(uid)
end

function RoleTaskInfo3771:OnNpcDead(uid)
	local taskProcess = s_getTaskValue(uid,3771,TaskValue_Process)
	if taskProcess ~= TaskProcess_Doing then
		return
	end
	local curequip = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ARMY_EQUIP_ID)
	local baseid = s_getValue(SCENE_ENTRY_NPC, curequip, VALUE_TYPE_BASE_ID)
	if baseid ~= 44331 and baseid ~= 44332 and baseid ~= 44333 then
		return
	end
	AddRoleTaskOperate(uid, 3771)
	local callback = "RoleTaskInfo3771:OnExitEquip($1,$2)"
	s_showbar(uid,3000,callback,UninterruptActionType_TASK,0)
end

function RoleTaskInfo3771:OnExitEquip(uid,tbreak)
	s_resetTrafficType(uid)
end

--NPC死亡事件
--RegisterNpcDeadEvent(22806,"RoleTaskInfo3771:OnNpcDead($1)")

--领取菜单
AppendMenuToNpc(60037,"领取团魔甲(2)","RoleTaskInfo3771:OnAcceptTask($1)","RoleTaskInfo3771:checkAccept($1)")
