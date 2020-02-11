--团冒险地宫

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_100 开始开始倒计时
--0_101 开始时间
--0_102 游戏进度
--0_103 结束倒计时
--0_104 团总赞扬值
--0_105 打开团冒险开关
--0_106 副本类型

--副本初始化
function CopySceneInfo_Adventure_InitCopyScene(ctype,cid)
	s_setSceneVar(cid,0,100,10)	--开始倒计时
	s_setSceneVar(cid,0,104,0)	--清除团总赞扬值
	s_setSceneVar(cid,0,105,0)	--打开团冒险开关
	s_setSceneVar(cid,0,106,ctype)	--副本类型
	s_setSceneVar(cid,0,102,1) --进入第一阶段
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
	local npcid = s_sysSummon(60571,cid,132,122) --睡觉的boss
	local npcid = s_sysSummon(60581,cid,127,121) --小丑宝箱
end
--玩家进入副本
function CopySceneInfo_Adventure_OnPlayerIntoCopyScene(cid,uid)
	RefreshTaskDailyInfo(uid, 30069)
	s_addVar(uid,101,46,0) --副本个人赞扬值(离开副本会清除)
	local daynum = s_getVar(uid,101,43)
	s_addVar(uid,101,43,daynum+1)
	local weeknum = s_getVar(uid,101,44)
	s_addVar(uid,101,44,weeknum+1)
	CopySceneInfo_Adventure_RefeshInfo(cid,uid)
end
--玩家离开副本
function CopySceneInfo_Adventure_OnPlayerLeaveCopyScene(cid,uid)
end
function OnLoopCopyScene_1Sec_Adventure(ctype,cid)
	local wait = s_getSceneVar(cid,0,100)
	if wait > 0 then
		s_copyInfo(cid,"倒计时:" .. wait)
		s_setSceneVar(cid,0,100,wait - 1)
		if wait == 1 then
			CopySceneInfo_Adventure_Init(cid)
		end
		return
	end
	local final = s_getSceneVar(cid,0,103)
	if final > 0 then
		s_copyInfo(cid,"倒计时:" .. final)
		s_setSceneVar(cid,0,103,final- 1)
		return
	end
	local start = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101)
	if start == 12 * 60 then
		s_copyInfo(cid,"副本将在三分钟后回收",ChatPos_Sys);
	end
	if start >= 15 * 60 and s_getSceneVar(cid,0,102) <11 then --30分钟没有出boss回收副本
		s_clearCopy(cid)
		s_copyInfo(cid,"很遗憾，限定时间内未能完美通过小丑塔布里斯的考验，请大家下次继续努力哦！ ",ChatPos_MsgBox)
	end
	if s_getSceneVar(cid,0,102) >= 12 then
		s_clearCopy(cid)
		s_copyInfo(cid,"恭喜，限定时间内完美的通过了小丑塔布里斯的考验，期待与你们的下次重逢！",ChatPos_MsgBox)
	end
end

function CopySceneInfo_Adventure_Init(cid)
	for i =0,18 do
		local posx = 132 + math.random(-15,15)
		local posy = 123 + math.random(-15,15)
		local npcid = s_sysSummon(math.random(22901,22909),cid,posx,posy)
		CopySceneInfo_Adventure_AddBuff(npcid,cid)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*60*1000)
	end
	s_copyInfo(cid,"塔布里斯召唤出了一群魔法扑克怪，请按一定规则击倒他们，去获得更高的总赞扬，迎接塔布里斯的挑战吧！",ChatPos_MsgBox)
end

function CopySceneInfo_Adventure_RefeshInfo(cid,uid)
	local index = 11
	local stage = s_getSceneVar(cid,0,102)
	local total = s_getSceneVar(cid,0,104)
	local TARGET = { 20,40,70,110,160,230,320,430,560,725}
	for i=1,table.getn(TARGET) do
		if total < TARGET[i] then
			index = i;
			break;
		end
	end
	local switch = s_getSceneVar(cid,0,105)
	if index == 11 and switch == 1 then return end
	if index >=1 and index <= table.getn(TARGET) then
		local time = 15*60 - (s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101))
		s_sendCopyInfo(cid,total,time,"获得" .. TARGET[index].. "点总赞扬值")
	else
		local time = 20*60 - (s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101))
		s_sendCopyInfo(cid,total,time,"击倒小丑塔布里斯")
	end
	if stage == index then return end --没有变化

	s_setSceneVar(cid,0,102,index)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --删除前一个boss
		local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
		if baseid >= 60571 and baseid <= 60580 then
			s_clearNpc(list[i+1])
		end
	end

	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	local XIAOCHOU = {22916,22916,22936,22937,22938,22939,22940,22941,22942,22944}
	local npcid = s_sysSummon(XIAOCHOU[ctype-82],cid,132,123) --见习小丑
	s_copyInfo(cid,"注意！顽皮的见习小丑在某处闲逛呢，找到他索取宝物吧！",34)

	local switch = s_getSceneVar(cid,0,105)
	if index == 11 and switch == 0 then --出现吧,传说中的boss同学
		local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
		for i = 1,table.getn(list), 2 do
			local baseid = s_getValue(list[i],list[i+1],VALUE_TYPE_BASE_ID)
			if baseid ~= 60580 and baseid ~= 60581 then --boss出现清场
				s_clearNpc(list[i+1])
			end
		end
		local BOSS = {22919,22919,22929,22930,22931,22932,22933,22934,22935,22943}
		local npcid = s_sysSummon(BOSS[ctype-82],cid,132,123)
		s_copyInfo(cid,"小丑塔布里斯对你们的赞赏有加，决定和你们比试一下！",ChatPos_MsgBox)
		s_setSceneVar(cid,0,105,1)
	else
		local npcid = s_sysSummon(60571 + index-1,cid,132,123)
	end
end
function OnPlayAdventureCard(uid,group)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)

	local point = 0;
	local vip = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,128)
	local vip1 = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,129)
	local vip2 = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,130)
	local vip3 = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,131)

	if group == 1 then --合壁,五张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 15 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 20 end
		if math.random(1,100) <= 25 then
			s_addItem(uid,29512,0,1,0,"1-1","出牌合璧")
		end
		s_copyInfo(cid,"太强了!".. name .. "打出了传说中的【合璧】,获得"..point.."点赞扬",34)
	end
	if group == 2 then --顺子,五张连续
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 12 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 16 end
		if math.random(1,100) <= 25 then
			s_addItem(uid,29512,0,1,0,"1-1","出牌顺子")
		end
		s_copyInfo(cid,"太强了!".. name .. "打出了传说中的【顺子】,获得"..point.."点赞扬",34)
	end
	if group == 3 then --葫芦,三张同+二张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 10 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 13 end
		if math.random(1,100) <= 25 then
			s_addItem(uid,29512,0,1,0,"1-1","出牌葫芦")
		end
		s_copyInfo(cid,"太强了!".. name .. "打出了传说中的【葫芦】,获得"..point.."点赞扬",34)
	end
	if group == 4 then --铁支,四张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 8 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 12 end
		s_copyInfo(cid,name .. "打出了【铁支】,获得"..point.."点赞扬",34)
	end
	if group == 5 then --三条,三张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 5 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 7 end
		s_copyInfo(cid,name .. "打出了【三条】,获得"..point.."点赞扬",34)
	end
	if group == 6 then --两对,两个两张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 5 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 7 end
		s_copyInfo(cid,name .. "打出了【两对】,获得"..point.."点赞扬",34)
	end
	if group == 7 then --对子,两张同
		if vip == 0 and vip1 == 0 and vip2 == 0 and vip3 ==0 then point = 2 end
		if vip > 0 or vip1 > 0 or vip2 > 0 or vip3 > 0 then point = 3 end
		s_copyInfo(cid,name .. "打出了【对子】,获得"..point.."点赞扬",34)
	end
	local totalPoint_user = s_getVar(uid,101,46)
	if totalPoint_user  < 150 then
		s_addVar(uid,100,34,s_getVar(uid,100,34)+point)
		s_addVar(uid,101,46,s_getVar(uid,101,46)+point)
	end

	s_setSceneVar(cid,0,104,s_getSceneVar(cid,0,104)+point)
	CopySceneInfo_Adventure_RefeshInfo(cid,uid)
end

function CopySceneInfo_Adventure_OnNpcDead22901_22913(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local dtype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEAD_TYPE)
	local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
	if dtype ~= NPC_DEAD_TYPE_TIME  then
		local card = baseid - 22901 + 2
		if card >=2 and card <= 14 then
			s_addpuke(uid,card)
		end
		local total = s_getSceneVar(cid,0,104)
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		if level == nil then
			return
		end
		if total <= 300 then
			local exp = 0.6 * (30+level^1.5)*(1+total/300)
			if baseid >= 22910 and baseid <= 22913 then
				exp = exp * 2
			end
			s_refreshExp(uid,exp,ExpType_Corps,0)
		else
			local exp = 0.6 * (30+level^1.5)*(1.5+total/600)
			if baseid >= 22910 and baseid <= 22913 then
				exp = exp * 2
			end
			s_refreshExp(uid,exp,ExpType_Corps,0)
		end
	end
end
function CopySceneInfo_Adventure_OnNpcDead22914_22915(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local total = s_getSceneVar(cid,0,104)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level == nil then
		return
	end
	if total <= 1000 then
		local exp = 0.6 * (30+level^1.5)*(1+total/4000)
		s_refreshExp(uid,exp,ExpType_Corps,0)
	else
		local exp = 0.6 * (30+level^1.5)*(1+total/8000)
		s_refreshExp(uid,exp,ExpType_Corps,0)
	end
end
function CopySceneInfo_Adventure_MyNpcDead22901_22913(uid,npcid)
	local dtype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEAD_TYPE)
	if dtype ~= NPC_DEAD_TYPE_TIME then--召唤新扑克
		local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
		local PUKE = { --根据副本阶段召唤的扑克牌怪
			{22901,22902,22903,22904,22905,22906,22907,22908,22909},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910,22911},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910,22911},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910,22911,22912},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910,22911,22912},
			{22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,
				22901,22902,22903,22904,22905,22906,22907,22908,22909,22910,22911,22912,22913},
		}
		local stage = s_getSceneVar(cid,0,102)
		if stage >= 1 and stage <= 10 then
			local puke = PUKE[stage][math.random(1,table.getn(PUKE[stage]))]
			local posx = 132 + math.random(-15,15)
			local posy = 123 + math.random(-15,15)
			local npcid = s_sysSummon(puke,cid,posx,posy)
			if puke >= 22910 and puke <= 22913 then
				local CARD ={"J","Q","K","A"}
				s_copyInfo(cid,"运气真棒，花色牌『"..CARD[puke-22910+1] .."』出现了，击倒它可以获得双倍经验！",34)
			end
			CopySceneInfo_Adventure_AddBuff(npcid, cid)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*60*1000)
		end
	else--扑克超时变形
		local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
		if baseid % 2 == 0 then
			local npcid = s_sysSummon(22914,cid,posx,posy)
		else
			local npcid = s_sysSummon(22915,cid,posx,posy)
		end
		CopySceneInfo_Adventure_AddBuff(npcid, cid)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,5*60*1000)
	end
end

function CopySceneInfo_Adventure_AddBuff(npcid,cid)
	local ctype = s_getSceneVar(cid,0,106)
	if ctype == 85 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,4000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,3000,10)
	elseif ctype == 86 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,9000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,7000,10)
	elseif ctype == 87 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,15000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,11000,10)
	elseif ctype == 88 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,23000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,16000,10)
	elseif ctype == 89 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,31000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,21000,10)
	elseif ctype == 90 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,41000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,27000,10)
	elseif ctype == 91 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,53000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,33000,10)
	elseif ctype == 92 then
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,65000,10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,39000,10)
	end
end

function CopySceneInfo_Adventure_MyNpcDead22919_22935(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	s_setSceneVar(cid,0,102,12)
	s_setSceneVar(cid,0,103,60)

	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELADN_NAME)
	if country ~= nil and name ~= nil then
		s_worldInfo("<p><n color='GXColorBlueSky'>"..country .."的【".. name .. "】率领队伍完美通过了小丑梦境，获得了堆积如山的宝藏！</n><book bookid='70131' text='[关于]'/></p>",ChatPos_Sys + ChatPos_Honor)
	end
end

-- RegisterNpcDeadEvent(22914,"CopySceneInfo_Adventure_OnNpcDead22914_22915($1,$2)")
-- RegisterNpcDeadEvent(22915,"CopySceneInfo_Adventure_OnNpcDead22914_22915($1,$2)")

-- for i=22901,22913 do
-- 	RegisterNpcDeadEvent(i,"CopySceneInfo_Adventure_OnNpcDead22901_22913($1,$2)")
-- 	RegisterMyNpcDeadEvent(i,"CopySceneInfo_Adventure_MyNpcDead22901_22913($1,$2)")
-- end

-- RegisterMyNpcDeadEvent(22919,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22929,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22930,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22931,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22932,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22933,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22934,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")
-- RegisterMyNpcDeadEvent(22935,"CopySceneInfo_Adventure_MyNpcDead22919_22935($1,$2)")

local AdventureCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_Adventure_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_Adventure_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_Adventure_OnPlayerLeaveCopyScene(cid,uid)
    end
    function OnLoopCopyScene_1Sec_$1(ctype,cid)
        OnLoopCopyScene_1Sec_Adventure(ctype,cid)
    end
    
]]
for i = 85,92 do
	RegistetFunction(FormatString(AdventureCopyScene,i))

	--增加团冒险副本的排队
	s_createQueueOneGroup(13,i,0,109,0,0,"小丑梦境",6,0,100)
end
