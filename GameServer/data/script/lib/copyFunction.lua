--副本条件函数

--检查副本变量[minValue, maxValue]{int:key1, int:key2, int:minValue, int:maxValue}
function s_copycheckSceneVar(uid, stype, customid, sid, paramlist)
	local key1 = paramlist[1]
	local key2 = paramlist[2]
	local minValue = paramlist[3]
	local maxValue = paramlist[4]
	local value = s_getSceneVar(sid, key1, key2)
	if minValue ~= nil and minValue > value then
		return VALUE_FAIL
	end
	if maxValue ~= nil and maxValue ~= 0 and maxValue < value then
		return VALUE_FAIL
	end
	return VALUE_OK
end


--事件函数
--------------------------------------------------------------------------------------------------
--设置副本最大存活时间{int:副本生存期(单位:秒,0表示默认)}
function s_copySetLifeTime(uid, stype, customid, sid, paramlist)
	s_setCopyLifeTime(sid, paramlist[1])
end

--设置副本回收时间{int:副本生存期(单位:秒,0表示默认)}
function s_copySetRecycleTime(uid, stype, customid, sid, paramlist)
	s_setCopyRecycleTime(sid, paramlist[1])
end

--关闭副本
function s_copyClearCopy(uid, stype, customid, sid, paramlist)
	s_clearCopy(sid)
end

--summonnpc{int:npc_baseid, int:num, int:posx, int:posy, int:ai, int:recycle(0表示没有回收ai，1表示有回收ai)}
function s_copySummonNpc(uid, stype, customid, sid, paramlist)
	for i=1, paramlist[2] do
		s_sysSummon(paramlist[1],sid,paramlist[3],paramlist[4],paramlist[5],paramlist[6])
	end
end


function callback_copyKillNpc(sid,npcthisid,key1,key2,total)
	local num = s_getSceneVar(sid,key1,key2)
	s_setSceneVar(sid,key1,key2,num+1)
	s_copyInfo(sid,"已杀死怪物:" .. num + 1 .. "/" .. total,ChatPos_Sys + ChatPos_Important)
end

--summonnpc,用来杀戮{int:npc_baseid, int:num, int:posx, int:posy, int:ai, int:recycle(0表示没有回收ai，1表示有回收ai), int:key1(副本变量1), int:key2(副本变量2), int:total(杀怪物时显示的计数总数)}
function s_copySummonNpcToKill(uid, stype, customid, sid, paramlist)
	for i=1, paramlist[2] do
		s_sysSummon(paramlist[1],sid,paramlist[3],paramlist[4],paramlist[5],paramlist[6])
	end
	RegisterCopyNpcDeadEvent(paramlist[1],stype,customid,"callback_copyKillNpc($1,$2," .. paramlist[7] .. "," .. paramlist[8] .. "," .. paramlist[9] .. ")")
end

--summonnpc,用来杀戮，带人类进程加成{int:npc_baseid, int:num, int:posx, int:posy, int:ai, int:recycle(0表示没有回收ai，1表示有回收ai), int:key1(副本变量1), int:key2(副本变量2), int:total(杀怪物时显示的计数总数),int:人类进程加成血量是否开启（0关闭，1开启）}
function s_copyWorldLevelSummonNpcToKill(uid, stype, customid, sid, paramlist)
	local worldlevel = s_getWorldLevel()
	local npcid = 0
	for i=1, paramlist[2] do
		npcid = s_sysSummon(paramlist[1],sid,paramlist[3],paramlist[4],paramlist[5],paramlist[6])
		if paramlist[10] ~= nil and paramlist[10] ~= 0 then
			if npcid ~= 0 then
				if worldlevel == 1 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,1000,10)
				elseif worldlevel == 2 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,2000,10)
				elseif worldlevel == 3 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
				elseif worldlevel == 4 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,16000,10)
				elseif worldlevel == 5 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
				elseif worldlevel == 6 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,30000,10)
				elseif worldlevel == 7 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,35000,10)
				elseif worldlevel == 8 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,40000,10)
				elseif worldlevel == 9 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,45000,10)
				elseif worldlevel == 10 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,50000,10)
				end
			end
		end
	end
	RegisterCopyNpcDeadEvent(paramlist[1],stype,customid,"callback_copyKillNpc($1,$2," .. paramlist[7] .. "," .. paramlist[8] .. "," .. paramlist[9] .. ")")
end

--清空所有怪物{}
function s_copyClearAllMonster(uid, stype, customid, sid, paramlist)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid > 10000 then
			s_clearNpc(list[i+1])
		end
	end
end

--清空所有NPC，包括怪物{}
function s_copyClearAllNpc(uid, stype, customid, sid, paramlist)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		s_clearNpc(list[i+1])
	end
end

--清空指定baseid的npc{int:baseid}
function s_copyClearNpcByBaseID(uid, stype, customid, sid, paramlist)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		for _,delteid in ipairs(paramlist) do
			if baseid == delteid then
				s_clearNpc(list[i+1])
			end
		end
	end
end


--复活所有玩家
function s_copyReliveAllPlayer(uid, stype, customid, sid, paramlist)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_relive(list[i],list[i+1])		--复活所有玩家
	end
end

--发送副本区域一的信息{string:格式化字串}
function s_copyZoneOne(uid, stype, customid, sid, paramlist)
	s_sendCopyZoneOne(sid, paramlist[1],uid)
end

--发送副本区域二的信息{string:格式化字串}
function s_copyZoneTwo(uid, stype, customid, sid, paramlist)
	s_sendCopyZoneTwo(sid, paramlist[1],uid)
end

--发送副本区域三的信息{string:格式化字串}
function s_copyZoneThree(uid, stype, customid, sid, paramlist)
	s_sendCopyZoneThree(sid, paramlist[1],uid)
end

--发送副本剩余时间{int:剩余时间(单位:秒)}
function s_copyTime(uid, stype, customid, sid, paramlist)
	s_sendCopyTime(sid, paramlist[1])
end

--设置副本变量{int:key1,int:key2,int:value}
function s_copySetSceneVar(uid, stype, customid, sid, paramlist)
	s_setSceneVar(sid, paramlist[1], paramlist[2], paramlist[3])
end

--设置玩家变量{int:key1,int:key2,int:value}
function s_copySetVar(uid, stype, customid, sid, paramlist)
	s_setVar(uid, paramlist[1], paramlist[2], paramlist[3])
end

--增加副本变量{int:key1,int:key2,int:value}
--{s_copyAddSceneVar,{1,100,10}},
function s_copyAddSceneVar(uid, stype, customid, sid, paramlist)
	local value = s_getSceneVar(sid, paramlist[1], paramlist[2])
	if value == nil then return end
	s_setSceneVar(sid, paramlist[1], paramlist[2], value+paramlist[3])
end

--副本扣除玩家货币{int:货币种类,int:数量}
--钱币类型
--MoneyType_MoneyTicket       = 1  --1绑银*/
--MoneyType_Money             = 2  --2银币*/
--MoneyType_GoldTicket        = 4  --4金票*/
--MoneyType_Gold              = 8  --8金币*/
function s_copyRemoveMoney(uid, stype, customid, sid, paramlist)
	s_removeMoney(uid,paramlist[1], paramlist[2],paramlist[3])
end


--设置副本任务加计数{int:taskid}
--{s_copyAddRoleTaskOperate,{1}},
function s_copyAddRoleTaskOperate(uid, stype, customid, sid, paramlist)
	if paramlist[1] == nil then return end
	if uid ~= nil and uid ~= 0 then
		AddRoleTaskOperate(uid, paramlist[1])
	else
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			AddRoleTaskOperate(list[i+1], paramlist[1])
		end
	end
end

--计算一个随机数，并设置为副本变量[随机数最小值,随机数最大值]{int:随机数最小值, int:随机数最大值, int:key1,int:key2,}
--{s_copyRandomSetSceneVar,{1,5,1,1}},
function s_copyRandomSetSceneVar(uid, stype, customid, sid, paramlist)
	local rand = math.random(paramlist[1],paramlist[2])
	s_setSceneVar(sid, paramlist[3], paramlist[4], rand)
end

--增加副本定时器{int:定时器ID, int:多长时间后触发(单位:秒)}
function s_copyAddTimer(uid, stype, customid, sid, paramlist)
	s_addCopyTimer(sid, paramlist[1], paramlist[2])
end

--玩家播放客户端脚本{int:客户端脚本ID}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyPlayClientLua(uid, stype, customid, sid, paramlist)
	if uid ~= nil and uid ~= 0 then
		s_playClientLua(uid, paramlist[1])
	else
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_playClientLua(list[i+1], paramlist[1])
		end
	end
end

--玩家播放新功能开启{int:新功能开启表ID}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyNewFunctionOpen(uid, stype, customid, sid, paramlist)
	if uid ~= nil and uid ~= 0 then
		s_newFunctionOpen(uid, paramlist[1])
	else
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_newFunctionOpen(list[i+1], paramlist[1])
		end
	end
end

--玩家播放客户端Guide脚本{int:GuideID} 在客户端data/gui/guide下
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyOpenGuide(uid, stype, customid, sid, paramlist)
	if uid ~= nil and uid ~= 0 then
		s_openGuide(uid, paramlist[1])
	else
		local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_openGuide(list[i+1], paramlist[1])
		end
	end
end

--发送副本系统消息{string:msg, int:info_type(请参见ChatPos)}
--[[
enum ChatPos
{
// 以下最多只能容纳16bit，且修改时需要通知GMTool修改！
ChatPos_MsgBox		= 0,	/// 对话框输出 (该类型只能单独使用，请不要和其他类型进行二进制混合，否则客户端无法显示！)
ChatPos_Normal		= 1,	/// 普通聊天输出
ChatPos_Sys			= 2,	/// 系统提示输出
ChatPos_Tips		= 4,	/// 冒泡提示
ChatPos_Pop			= 8,	/// 右下角弹出
ChatPos_Private		= 16,	/// 私聊输出
ChatPos_Important	= 32,	/// 屏幕中央输出(电视^_^)
ChatPos_Honor		= 64,	/// 屏幕中央输出(电视^_^)
ChatPos_Gm			= 128,	/// GM系统公告输出位置
};
]]
function s_copyCopyInfo(uid, stype, customid, sid, paramlist)
if paramlist[1] ~= nil then
	s_copyInfo(sid,paramlist[1],paramlist[2])
end
end

--删除道具{int:道具BaseID, int:道具数量, string:删除原因, int:道具等级}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyDeleteItemByBaseID(uid, stype, customid, sid, paramlist)
if uid ~= nil and uid ~= 0 then
	s_deleteItemByBaseID(uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_deleteItemByBaseID(list[i+1], paramlist[1], paramlist[2], paramlist[3], paramlist[4])
	end
end
end


--增加道具{int:道具ID, int:道具等级, int:道具数量, int:道具绑定,string:道具buff, string:获取道具原因}
--若itemlevel > 0, 则itembuff中需要重复包含itemlevel字段(2-itemlevel)
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyAddItem(uid, stype, customid, sid, paramlist)
if uid ~= nil and uid ~= 0 then
	s_addItem(uid, paramlist[1], 0, paramlist[3], paramlist[4], paramlist[5], paramlist[6])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_addItem(list[i+1], paramlist[1], 0, paramlist[3], paramlist[4], paramlist[5], paramlist[6])
	end
end
end

--在玩家身上加一个buff{int:buffid, int:buff等级, int:buff持续时间(单位:秒), int:buff需要的参数(某些buff需要)}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyAddBuff(uid, stype, customid, sid, paramlist)
if paramlist[1] == nil then return end
if uid ~= nil and uid ~= 0 then
	s_addbuff(SCENE_ENTRY_PLAYER, uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_addbuff(SCENE_ENTRY_PLAYER, list[i+1], paramlist[1], paramlist[2], paramlist[3], paramlist[4])
	end
end
end

--在玩家身上去除一个buff{int:buffid, int:buff数量(0表示清除所有指定id的buff)}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyRemoveBuff(uid, stype, customid, sid, paramlist)
if paramlist[1] == nil then return end
if uid ~= nil and uid ~= 0 then
	s_removebuff(SCENE_ENTRY_PLAYER, uid, paramlist[1], paramlist[2])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_removebuff(SCENE_ENTRY_PLAYER, list[i+1], paramlist[1], paramlist[2])
	end
end
end

--在玩家身上播放一个特效补充表中的特效{int:SfxID(特效补充表中的特效ID)}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyAddSfx(uid, stype, customid, sid, paramlist)
if paramlist[1] == nil then return end
if uid ~= nil and uid ~= 0 then
	s_sfxMagicPlay(uid, paramlist[1])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_sfxMagicPlay(list[i+1], paramlist[1])
	end
end
end

--播放一个笑脸表情{int:表情ID}
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copySmile(uid, stype, customid, sid, paramlist)
if paramlist[1] == nil then return end
if uid ~= nil and uid ~= 0 then
	s_smile(uid, uid, paramlist[1])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_smile(list[i+1], list[i+1], paramlist[1])
	end
end
end

--本地图跳转{int:posx, int:posy, int:跳转类型(参见enmMoveType)}
--	enum enumMoveType	///< 移动类型
--	{
--		enumMoveType_Immediate   = 0,		///< 刷新位置
--		enumMoveType_Delay_0s    = 1,		///< 立即高速移动,			技能(英勇冲锋)
--		enumMoveType_Delay_500m  = 2,		///< 延迟500毫秒高速移动,	技能(巨刃跳劈)
--		enumMoveType_Delay_2000m = 4,		///< 不变方向高速移动,		技能(紧急撤退)
--		enumMoveType_RandPos 	= 99,		///< 场景中随机位置
--		enumMoveType_Correct 	= 100,		///< 修正当前位置
--		enumMoveType_GoTo 		= 101,		///< goto用
--	};
--若uid不为0，则作用于指定玩家；若为0，则作用于副本内的所有玩家
function s_copyGoto(uid, stype, customid, sid, paramlist)
if uid ~= nil and uid ~= 0 then
	s_goto(SCENE_ENTRY_PLAYER, uid, paramlist[1], paramlist[2], paramlist[3])
else
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		s_goto(SCENE_ENTRY_PLAYER, list[i+1], paramlist[1], paramlist[2], paramlist[3])
	end
end
end
