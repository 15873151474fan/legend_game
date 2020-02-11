--任务相关扩展

--主线任务等级不足,前置完成的处理(等级不足，返回VALUE_OK)
function DealMainTaskNoLevel(uid,taskid)
	if IsMainNormalTask(taskid) == VALUE_FAIL then
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minLevel = s_getTaskValue(uid,taskid,TaskValue_MinLevel)
	if level >= minLevel then
		return VALUE_FAIL
	end

	local msg = [[body(space()space()space()player()，你的能力还不足以接受此任务，请]]..minLevel ..[[级再来找我吧。)]]
	msg = parseToTalk(msg)
	local info =
		{
			talk = msg,
			button =
			{
				{"查看可接任务(2)","ShowTaskDialog($1,1)"},
				{"查看尚未完成高额经验日常任务(2)","ShowUnFinishedDayTask($1)"},
				{"查看高经验团任务(2)","ShowCorpsTask($1)","CheckShowCorpsTask($1)"},
				{"前往副本中转站(2)","s_gomap($1,13,118,115,103)","CheckGoToFuBen($1)"},
			},
		}
	ShowNpcMenuByTable(uid,info)
	return VALUE_OK
end

function CheckShowCorpsTask(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 21 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function CheckGoToFuBen(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 25 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function ShowUnFinishedDayTask(uid)
	local tasklist = {30022,  30021,30041,30027,30016,30006, 30025,	30026,	30002,	30042,	30043, 30421}
	local taskmap = {
		[30021] = 7,
		[30022] = 3,
		[30025] = 3,
		[30026] = 3,
		[30002] = 2,
		[30042] = 3,
		[30043] = 3,
		[30041] = 6,
		[30027] = 3,
		[30016] = 4,
		[30006] = 2,
		[30421] = 1,
	}
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local tlist = {}
	for i = 1, table.getn(tasklist) do
		local taskid = tasklist[i]
		local minLevel = s_getTaskValue(uid,taskid,TaskValue_MinLevel)
		local maxLevel = s_getTaskValue(uid,taskid,TaskValue_MaxLevel)
		if level >= minLevel and level <= maxLevel then
			local process = s_getTaskValue(uid,taskid,TaskValue_Process)
			if process ~= TaskProcess_None then
				table.insert(tlist,taskid)
			elseif CheckRoundAndRing(uid, taskid) == VALUE_OK then
				table.insert(tlist,taskid)
			end
			if table.getn(tlist) >= 4 then
				break
			end
		end
	end
	local msg = ""
	if table.getn(tlist) >= 4 then
		msg = [[body(尚未完成的高额经验的日常任务:newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()打开活动面板查看更多日常任务)]]
		local name1 = s_getTaskValue(uid,tlist[1],TaskValue_Name)
		local npc1 = s_getTaskValue(uid,tlist[1],TaskValue_BegNpc)
		local npcname1 = string.format("goto(%u,%u)",npc1,taskmap[tlist[1]])--s_getNpcBase(npc1,1)
		local name2 = s_getTaskValue(uid,tlist[2],TaskValue_Name)
		local npc2 = s_getTaskValue(uid,tlist[2],TaskValue_BegNpc)
		local npcname2 = string.format("goto(%u,%u)",npc2,taskmap[tlist[2]])
		local name3 = s_getTaskValue(uid,tlist[3],TaskValue_Name)
		local npc3 = s_getTaskValue(uid,tlist[3],TaskValue_BegNpc)
		local npcname3 = string.format("goto(%u,%u)",npc3,taskmap[tlist[3]])
		local name4 = s_getTaskValue(uid,tlist[4],TaskValue_Name)
		local npc4 = s_getTaskValue(uid,tlist[4],TaskValue_BegNpc)
		local npcname4 = string.format("goto(%u,%u)",npc4,taskmap[tlist[4]])
		msg = string.format(msg,name1,npcname1,name2,npcname2,name3,npcname3,name4,npcname4)
		msg = parseToTalk(msg)
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
		return
	elseif table.getn(tlist) == 3 then
		msg = [[body(尚未完成的高额经验的日常任务:newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()打开活动面板查看更多日常任务)]]
		local name1 = s_getTaskValue(uid,tlist[1],TaskValue_Name)
		local npc1 = s_getTaskValue(uid,tlist[1],TaskValue_BegNpc)
		local npcname1 = string.format("goto(%u,%u)",npc1,taskmap[tlist[1]])--s_getNpcBase(npc1,1)
		local name2 = s_getTaskValue(uid,tlist[2],TaskValue_Name)
		local npc2 = s_getTaskValue(uid,tlist[2],TaskValue_BegNpc)
		local npcname2 = string.format("goto(%u,%u)",npc2,taskmap[tlist[2]])
		local name3 = s_getTaskValue(uid,tlist[3],TaskValue_Name)
		local npc3 = s_getTaskValue(uid,tlist[3],TaskValue_BegNpc)
		local npcname3 = string.format("goto(%u,%u)",npc3,taskmap[tlist[3]])
		msg = string.format(msg,name1,npcname1,name2,npcname2,name3,npcname3)
		msg = parseToTalk(msg)
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
		return
	elseif table.getn(tlist) == 2 then
		msg = [[body(尚未完成的高额经验的日常任务:newline()hot(%s)newline()接取NPC:%s newline()hot(%s)newline()接取NPC:%s newline()打开活动面板查看更多日常任务)]]
		local name1 = s_getTaskValue(uid,tlist[1],TaskValue_Name)
		local npc1 = s_getTaskValue(uid,tlist[1],TaskValue_BegNpc)
		local npcname1 = string.format("goto(%u,%u)",npc1,taskmap[tlist[1]])--s_getNpcBase(npc1,1)
		local name2 = s_getTaskValue(uid,tlist[2],TaskValue_Name)
		local npc2 = s_getTaskValue(uid,tlist[2],TaskValue_BegNpc)
		local npcname2 = string.format("goto(%u,%u)",npc2,taskmap[tlist[2]])
		msg = string.format(msg,name1,npcname1,name2,npcname2)
		msg = parseToTalk(msg)
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
		return
	elseif table.getn(tlist) == 1 then
		msg = [[body(尚未完成的高额经验的日常任务:newline()hot(%s)newline()接取NPC:%s newline()打开活动面板查看更多日常任务)]]
		local name1 = s_getTaskValue(uid,tlist[1],TaskValue_Name)
		local npc1 = s_getTaskValue(uid,tlist[1],TaskValue_BegNpc)
		local npcname1 = string.format("goto(%u,%u)",npc1,taskmap[tlist[1]])
		msg = string.format(msg,name1,npcname1)
		msg = parseToTalk(msg)
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
		return
	end
	if table.getn(tlist) == 0 then
		msg = "高额经验的日常任务已经基本完成了"
		ShowNpcMenuBottomStyle(uid,msg,"离开(3)")
		return
	end
end

function ShowCorpsTask(uid)
	local msg = [[body(军团中每日都会产出大量的经验，如果您对经验有需求的话可以尝试下军团中的玩法。blankline()（推荐团建设任务与军团种植）)]]
	local info =
		{
			talk = parseToTalk(msg),
			button = {
				{"立即前往团基地(2)","NpcMenuInfo122:DealMenu2($1)","NpcMenuInfo122:ShowMenu2($1)"},
				{"团列表(2)","NpcMenuInfo122:DealMenu6($1)","NpcMenuInfo122:ShowMenu6($1)"},
				{"使用100枚银币创建团(2)","NpcMenuInfo122:CreateCorps($1,0)","NpcMenuInfo122:ShowCreateCorps($1)"},
				{"使用5份团契约创建团(2)","NpcMenuInfo122:CreateCorps($1,1)","NpcMenuInfo122:ShowCreateCorps($1)"},
			},
		}
	ShowNpcMenuByTable(uid,info)
end

--团突袭任务处理
function CorpsJunXunDoTaskFunc(uid, tbreak, tasktype, thisid, buffid)
	if tbreak == nil then tbreak = 0 end
	if tbreak == 1 then return end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local taskstep = s_getCorpsVar(corps, 1, 20)
	s_addbuff(SCENE_ENTRY_NPC, thisid, 86, 1, 3)
	if taskstep == 4 then
		s_removebuff(SCENE_ENTRY_PLAYER, uid, buffid)
		--local hpsub = {[81]=200, [82]=400, [83]=1000}
		local hpsub = {[81]=4, [82]=9, [83]=14}
		s_subValue(SCENE_ENTRY_NPC, thisid, VALUE_TYPE_HP, hpsub[buffid])
		local enemy = s_getCorpsField(corps, CorpVar_Enemy)
		if corps > 0 and enemy > 0 then
			local maxhp = s_getValue(SCENE_ENTRY_NPC, thisid, VALUE_TYPE_MAXHP)
			local curhp = s_getValue(SCENE_ENTRY_NPC, thisid, VALUE_TYPE_HP)
			local percent = math.floor(100*curhp/maxhp)
			if percent == 0 and curhp > 0 then
				percent = 1
			end
			local hpper = {100, 75, 40, 0}
			local laststep = s_getCorpsVar(corps, 1, 22)
			local curstep = laststep
			for i=1, #hpper do
				if percent <= hpper[i] then
					curstep = i-1
				end
			end
			if laststep ~= curstep then
				local allmoney = {600, 800, 1100, 1500, 2000, 2600, 3400, 4200, 5000}
				local expmod = {{15, 0.5}, {20,0.3}, {35,0.2}}
				local mylevel = s_getCorpsField(corps, CorpVar_Level)
				local enlevel = s_getCorpsField(enemy, CorpVar_Level)
				-- 经验系数*(50+0.1*(25+10*(被抢军团等级-1))^2.2)
				local exp = expmod[curstep][1] * (50+0.1*(25+10*(mylevel-1))^2.2)
				local money = allmoney[mylevel] * expmod[curstep][2]
				s_sendToSession(7, enemy, corps, curstep, exp, money)
				s_addCorpsVar(corps, 1, 22, curstep)
			end
		end
	end
end

--团突袭任务破坏NPC
function JunXunTask_OnClickNpc(uid, thisid, info)
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local baseid = s_getValue(SCENE_ENTRY_NPC, thisid, VALUE_TYPE_BASE_ID)
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		local enemy = s_getCorpsField(corps, CorpVar_Enemy)
		local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local sowner = s_getSceneVar(sid,0,1)
		local tasktype = s_getCorpsVar(corps, 1, 21)
		if sowner == enemy and tasktype > 0 then
			local tasknpc = {[45001]=1, [45012]=1, [45013]=1, [45014]=1, [45015]=1, [45016] = 1, [45002]=2, [45005]=3}
			if tasknpc[baseid] == tasktype then
				local buffid = 0
				if s_getbufflevel(SCENE_ENTRY_PLAYER, uid, 81) > 0 then
					buffid = 81
				elseif s_getbufflevel(SCENE_ENTRY_PLAYER, uid, 82) > 0 then
					buffid = 82
				elseif s_getbufflevel(SCENE_ENTRY_PLAYER, uid, 83) > 0 then
					buffid = 83
				end
				if buffid > 0 then
					local x = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSX)
					local y = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_POSY)
					local myx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					if math.abs(x-myx) > 7 or math.abs(y-myy) > 7 then
						s_sysInfo(uid,"请再靠近一点",ChatPos_Sys + ChatPos_Important)
						return
					end
					if s_getbufflevel(SCENE_ENTRY_PLAYER, uid, 10211) > 0 then
						s_removebuff(SCENE_ENTRY_PLAYER, uid, 10211)
					end
					local callback = "CorpsJunXunDoTaskFunc($1,$2," .. tasktype .. "," .. thisid .. "," ..buffid .. ")"
					s_showbar(uid,5000,callback,UninterruptActionType_TASK,1,0,1)
				end
			end
		end
	else
		ShowNpcMenuByTable(uid, info)
	end
end

--团突袭破坏NPC血量通知
function JunXunTask_NpcHpNotify(npcid,curhp,build)
	local names = {"指挥所", "军营", "后勤部"}
	local sid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	local enemy = s_getCorpsField(corps, CorpVar_SetEnemy)
	if corps > 0 and enemy > 0 then
		local maxhp = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP)
		local percent = math.floor(100*curhp/maxhp)
		if percent == 0 and curhp > 0 then
			percent = 1
		end
		local hpper = {100, 75, 40, 0}
		local laststep = s_getCorpsVar(enemy, 1, 22)
		local curstep = laststep
		for i=1, #hpper do
			if percent <= hpper[i] then
				curstep = i-1
			end
		end
		if laststep == curstep then
			local enemyname = s_getCorpsField(enemy, CorpVar_Name)
			local corpsname = s_getCorpsField(corps, CorpVar_Name)
			local msg = string.format( "本团的%s正受到%s团的猛烈攻击,血量已经少于%u％,低于%u％本团将遭受团资金损失，请加强对%s的防守，以防本团资金及财产损失", names[build], enemyname, percent, hpper[curstep+2],enemyname)
			s_corpsInfo(corps, msg, ChatPos_Sys + ChatPos_Important)
			local friends = s_getCorpsField(corps, CorpVar_Friend)
			if friends > 0 then
				msg = string.format( "友方团的%s正受到%s团的猛烈攻击,血量已经少于%u％,低于%u％友方团将遭受团资金损失，请加强对%s的防守，以防友方团资金及财产损失", names[build], enemyname, percent, hpper[curstep+2],enemyname)
				s_corpsInfo(friends, msg, ChatPos_Sys + ChatPos_Important)
			end
			msg = string.format("%s团的%s血量已经少于%u％,低于%u％%s团将遭受团资金损失，同时我方将获得大量经验奖励，请加强对%s的进攻", corpsname, names[build], percent, hpper[curstep+2], corpsname, corpsname)
			s_corpsInfo(enemy, msg, ChatPos_Sys + ChatPos_Important)
		end
	end
end

--科举点击
function OnClickNpc_193(uid,npcid)
	s_trace(" OnClickNpc_193 ")
	--local talkDialog =  'this:ShowNpcDialog(false)'
	--local interfaceDialog= 'this:OpenTaskDialog('..npcid..')'
	--local message = talkDialog..interfaceDialog
	local message = '{'.."text='科举任务接取'"..'}'
	--s_debug(" message >>>>>>>>>>>>>>>>>>> "..message)
	s_setMessage(uid,2008,message,0)
end


