--加入团事件
function OnJoinCorpsEvent(uid)
	AddRoleTaskOperate(uid,12032)
end

--上线团事件处理
function OnRelationOnlineEvent(uid)
	local corps = s_getCorpsId(uid)
	local curday = s_getCurTime(TIME_ALLDAYS)
	local hours = s_getCurTime(TIME_CURHOURS)
	local army = s_getArmyID(uid)
	if corps > 0 then
		local battle = s_getCorpsVar(corps,2,1)
		if battle > 0 then
			local call = "CopySceneInfo_3:OnAckIntoCopy($1,$2," .. battle .. ")"
			local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
			local battype = s_getCorpsVar(corps,2,5)
			local msg = "<p><n>团战正在进行中，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
			if battype == 2 then
				msg = "<p><n>团称号争夺正在进行中，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
			end
			if battype == 1 then
				local step = s_getEvent(Relation_World,0,WorldEv_ArmyBattle)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			elseif battype == 2 then
				local step = s_getEvent(Relation_World,0,WorldEv_ArmyOccupyStart)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			end
		end
		--团突袭任务提示
		local taskday = s_getCorpsVar(corps, 1, 11)
		if NpcMenuInfo45111:CheckJunXunBegin(uid) == VALUE_OK and taskday ~= s_getVar(uid,103,18) then
			NpcMenuInfo45111:NotifyJunXunBegin(uid)
			s_addVar(uid,103,18,taskday)
		end
		if s_getEvent(Relation_Corps,corps,CpEv_JunXun) == EventStep_Run and taskday ~= s_getVar(uid,103,16) then
			local enemy = s_getCorpsField(corps, CorpVar_Enemy)
			local ename = s_getCorpsField(enemy, CorpVar_Name)
			if ename == "" or ename == nil then
				ename = "未知团名"
			end
			local country = s_getCorpsField(corps,CorpVar_Country)
			local msg = "对" .. ename .. "团的团突袭任务已经开始,在半个小时内达成目标可以获得高额经验奖励,是否立刻前往军营教官处参与团突袭?"
			local call = "BackToCorpsEvent($1,$2)"
			local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
			s_registerMsgBox(uid,call,buttons,msg,300)
			msg = "对" .. ename .. "团的团突袭任务已经开始,在半个小时内达成目标可以获得高额经验奖励。"
			s_sysInfo(uid, msg, ChatPos_Sys)
			s_addVar(uid,103,16,taskday)
		end
		--团战提示
		local cbatday = s_getCorpsVar(corps,2,3)
		local curmins = s_getCurTime(TIME_CURMINUTES) + hours*60
		if cbatday == curday and curmins < 60*20+30 and s_getVar(uid, 103, 14) ~= curday then
			s_sysInfo(uid, "本团团长已经选择参与了今天的团战,团战将于今晚20：30开始,参与团战将获得大量经验和战争勋章奖励,胜利方更可以获得额外的团勋章奖励，请各位注意关注开始时间")
			s_addVar(uid, 103, 14, curday)
		end
	end
	if army > 0 then
		local battle = s_getArmyVar(army,2,1)
		if battle > 0 then
			local call = "CopySceneInfo_7:OnAckIntoCopy($1,$2," .. battle .. ")"
			local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
			local msg = "<p><n>军战正在进行中，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
			local battype = s_getArmyVar(army,2,5)  -- 战场类型
			if battype == 2 then
				msg = "<p><n>国王争夺战进行中，是否前往战场参战?</n><newline/><n color='GXColorGreen'>（如果中途退场，可在战争狂人西德勒处重返战场）</n></p>"
			end
			if battle == 1 then
				local step = s_getEvent(Relation_World,0,WorldEv_ArmyBattle)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			elseif battle == 2 then
				local step = s_getEvent(Relation_World,0,WorldEv_CountryOccupyStart)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			elseif battle == 3 then
				local step = s_getEvent(Relation_World,0,WorldEv_CountryVoteKingStart)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			elseif battle == 4 then
				local step = s_getEvent(Relation_World,0,WorldEv_ArmyOccupyStart)
				if step == EventStep_Run then
					s_registerMsgBox(uid,call,buttons,msg,300)
				end
			end
		end
		--军战提示
		local abatday = s_getArmyVar(army,2,3)
		if abatday == curday and hours < 20 and s_getVar(uid, 103, 15) ~= curday then
			s_sysInfo(uid, "本军军长已经选择参与了今天的军战,军战将于今晚20：30开始,参与军战将获得大量经验奖励，请各位注意关注开始时间")
			s_addVar(uid, 103, 15, curday)
		end
	end
end

-- 团突袭任务开始
function JunXunTaskBegin(corps)
	local ret = s_addEvent(Relation_Corps,corps,CpEv_JunXun,0,30*60,0)
	if ret == VALUE_OK then
		local dstnpc = math.random(1,3)
		s_addCorpsVar(corps,1,21,dstnpc)
		local npcids = {"指挥所","军营","后勤部"}
		local enemy = s_getCorpsField(corps, CorpVar_Enemy)
		if enemy == 0 then
			s_debug("团突袭任务开始后，找不到敌团" .. corps)
			return
		end
		local ename = s_getCorpsField(enemy, CorpVar_Name)
		if ename == "" or ename == nil then
			ename = "未知团名"
		end
		local country = s_getCorpsField(corps,CorpVar_Country)
		local sid = HashSceneID(country,3)
		local msg = "对" .. ename .. "团 "..npcids[dstnpc] .."的团突袭任务已经开始,在半个小时内达成目标可以获得高额经验奖励,是否立刻前往军营教官处参与团突袭?"
		local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
		local call = "BackToCorpsEvent($1,$2)"
		s_registerRelationMsgBox(0,Relation_Corps,corps,0,call,buttons,msg,300)
		msg = "对" .. ename .. "团 "..npcids[dstnpc] .."的团突袭任务已经开始,在半个小时内达成目标可以获得高额经验奖励。"
		s_corpsInfo(corps, msg, ChatPos_Sys)
		country = s_getCorpsField(enemy, CorpVar_Country)
		sid = HashSceneID(country,3)
		local cname = s_getCorpsField(corps, CorpVar_Name)
		msg = cname .. "团针对本团"..npcids[dstnpc] .."的团突袭任务已经开始，请本团成员做好防守准备，以防本团资金及财产损失，在半个小时内击败敌方侵略者可以获得经验奖励。"
		buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
		call = "BackToCorpsEvent($1,$2)"
		s_registerRelationMsgBox(0,Relation_Corps,enemy,0,call,buttons,msg,300)
		s_corpsInfo(enemy, msg, ChatPos_Sys)
		s_addCorpsVar(corps,1,20,4)
		s_addCorpsVar(corps,1,15, s_getCurTime(TIME_ALLSECONDS)+30*60)
		s_sendToSession(9, corps)
	else
		s_debug("团突袭任务发布失败" .. corps)
	end
end

-- 团突袭返回团基地
function BackToCorpsEvent(uid, result)
	if result ~= Button_Yes then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		s_sysInfo(uid,"没有加入团，无法使用返回团基地技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
	local country = s_getValue(etype1,eid1,VALUE_TYPE_CURRENT_COUNTRY)
	if homeland ~= country then
		s_sysInfo(uid, "身处国外时无法快速回到团基地",ChatPos_Sys)
		return VALUE_FAIL
	end
	s_intoCopy(uid,CopySceneType_CorpsBase,corps)
	return VALUE_OK
end

-- 团突袭炸弹爆炸
function OnJunXunBombEndEvent(corps)
	local sid = s_getCorpsField(corps, CorpVar_SceneId)
	if sid > 0 then
		local npclist = s_getNpcByBaseID(sid, 60161)
		for i=1,#npclist do
			s_killnpc(npclist[i])
		end
	end
end

-- 团新手礼包
function OnGetCorpsPresentsEvent(uid,itemid,exclude)
	local baseid = s_getItemValue(uid,itemid,Item_Base_ID)
	if baseid ~= 31178 then
		return
	end
	if s_deleteItemByThisID(uid,itemid,1,"OnGetCorpsPresentsEvent") == VALUE_OK then
		s_addItem(uid,44081,0,1,0,"1-1","团新手礼包")
		s_addItem(uid,31145,0,3,0,"1-1,7-1,","团新手礼包")
		s_addItem(uid,29066,0,1,0,"1-1,7-2","团新手礼包")
		s_addItem(uid,44031,0,1,0,"1-1","团新手礼包")
		s_addItem(uid, 29052,0,1,0,"1-1","团新手礼包")
		s_addItem(uid, 27115,0,1,0,"1-1","团新手礼包")
	end
end

-- 团建设任务首次完成
function OnFirstFinishTechTask(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:OnFirstFinishTechTask()'
	local message = talkDialog .. interfaceDialog
	s_setMessage(uid,0,message,0)
end

-- 团副本开启回调
function CorpsCopyStartEvent(corps)
	local call = "CorpsCopyStartUserAck($1,$2," .. corps .. ")"
	local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
	local msg = "本团团长发布了团守卫活动,是否前往参加?"
	local list = s_getCorpsEntry(0,0,0,corps)
	for i = 1,table.getn(list), 2 do
		local homeland = s_getValue(list[i],list[i+1],VALUE_TYPE_HOMELAND)
		local country = s_getValue(list[i],list[i+1],VALUE_TYPE_CURRENT_COUNTRY)
		local userlevel = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_LEVEL)
		if userlevel > 31 and homeland == country then
			s_registerMsgBox(list[i+1],call,buttons,msg,300)
		end
	end
end

function CorpsCopyStartUserAck(uid, result, corps)
	if result == Button_Yes then
		local homeland = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_HOMELAND)
		local country = s_getValue(etype1,eid1,VALUE_TYPE_CURRENT_COUNTRY)
		if homeland ~= country then
			s_sysInfo(uid, "身处国外时无法快速回到团基地",ChatPos_Sys)
			return
		end
		local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
		if ctype ~= 0 and ctype ~= 1 then
			s_sysInfo(uid, "身处副本时无法快速回到团基地",ChatPos_Sys)
			return
		end
		s_resetTrafficType(uid)
		s_intoCopy(uid,CopySceneType_CorpsCopy,corps)
		s_debug("应答前往团副本%u,%u",uid,corps)
	end
end

--删除团突袭任务
function OnRemoveJunXunTaskEvent(uid)
	s_delTask(uid, 20002,1)
end

--领取团勋章奖励
function OnReqGetCorpsOfferEvent(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return
	end
	local fun,str = s_getFunction(uid,Relation_Corps)
	if fun == nil or fun == 0 then
		s_sysInfo(uid, "只有团官员才可以领取",ChatPos_Sys + ChatPos_Important)
		return
	end
	local hours = s_getCurTime(TIME_CURHOURS)
	local mins = s_getCurTime(TIME_CURMINUTES)
	if hours == 23 and mins == 59 then
		s_sysInfo(uid, "当前时间不可领取",ChatPos_Sys + ChatPos_Important)
		return
	end
	if hours == 0 and mins == 0 then
		s_sysInfo(uid, "当前时间不可领取",ChatPos_Sys + ChatPos_Important)
		return
	end
	local offer = 0
	local otype = 0
	if fun == FunctionType_CLeader then
		otype = CorpVar_OfferLeader
	elseif fun == FunctionType_CInterLeader then
		otype = CorpVar_OfferInter
	elseif fun == FunctionType_CExterLeader then
		otype = CorpVar_OfferExter
	elseif fun == FunctionType_CBeauty then
		otype = CorpVar_OfferBeauty
	end
	if otype == 0 then
		return
	end
	offer = s_getCorpsField(corps,otype)
	local msg = "当前职务为：" .. str .. "，"
	if offer == 0 then
		msg = msg .. "昨日团勋章奖励：0。"
		local call = "MsgBoxRet_DoGetOffer($1,$2," .. otype .. ",0)"
		local buttons = "确定|4|Esc"
		s_registerMsgBox(uid,call,buttons,msg,300)
	else
		msg = msg .. "昨日团勋章奖励：" .. offer .. ",是否领取?"
		local call = "MsgBoxRet_DoGetOffer($1,$2)"
		local buttons = "确定|3|Enter|取消|4|Esc"
		s_registerMsgBox(uid,call,buttons,msg,300)
	end
end

function MsgBoxRet_DoGetOffer(uid, result, otype, offer)
	if result ~= Button_Yes or offer == 0 then
		return
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	local fun,str = s_getFunction(uid,Relation_Corps)
	if fun == nil or fun == 0 then
		return
	end
	local offer = 0
	local otype = 0
	if fun == FunctionType_CLeader then
		otype = CorpVar_OfferLeader
	elseif fun == FunctionType_CInterLeader then
		otype = CorpVar_OfferInter
	elseif fun == FunctionType_CExterLeader then
		otype = CorpVar_OfferExter
	elseif fun == FunctionType_CBeauty then
		otype = CorpVar_OfferBeauty
	end
	if otype == 0 then
		return
	end
	offer = s_getCorpsField(corps,otype)
	if offer == 0 then
		return
	end
	s_setCorpsField(corps,otype,0)
	s_addField(uid,UserVar_Offer,offer)
	RefreshTaskDailyInfo(uid, 49103)
	s_debug("领取团勋章奖励：%u,%u,%u",uid,fun,offer)
end

function OnReqDonateCorpsMoneyEvent(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	s_donateMoney(uid,Relation_Corps)
end

