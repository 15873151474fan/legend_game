--夺旗战
CopySceneInfo_4 =
{
	reliveZone = { x = 39, y = 39, width = 160, height = 160 },
	--		{ x = 200, y = 126, width = 5, height = 5 }
	buffZone = {
		{ x = 39, y = 126, width = 5, height = 5 },
		{ x = 473, y = 126, width = 5, height = 5 }
	},
}
--副本初始化
function CopySceneInfo_4:InitCopyScene(cid)
	s_setSceneVar(cid,0,100,10)	--开始倒计时
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
	s_setSceneVar(cid,0,102,60)
	s_setSceneVar(cid,0,103,1)	--结束10秒倒计时是否开始
	s_setSceneVar(cid,0,105,0)
end

--刷新客户端战绩表
function CopySceneInfo_4:GetCopyInfoList(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	local row = 0
	local vlist = {}
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local score = s_getVar(list[i+1],100,37)
		local killnum = s_getVar(list[i+1],100,38)
		local killednum = s_getVar(list[i+1],100,39)
		table.insert(vlist,userid)
		table.insert(vlist,score)
		table.insert(vlist,killnum)
		table.insert(vlist,killednum)
		row = row + 1
	end
	return vlist,row,4
end
--客户端请求发送战绩数据
function CopySceneInfo_4:SendCopyInfoList(sid,uid,rtype)
	local vlist,row,col = self:GetCopyInfoList(sid)
	if vlist == nil or #vlist == 0 then
		return
	end
	s_sendCopyList(rtype,0,uid,col,row,vlist)
end

function CopySceneInfo_4:OnPlayerIntoCopyScene(cid,uid)
	--初始化25分
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE,25)
	s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,10)
	local last = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101)
	s_sendCopyInfo(cid,1,20*60-last,"血战到底")
	s_addVar(uid,100,36,0)
	s_addVar(uid,100,38,0)
	s_addVar(uid,100,39,0)
end
function CopySceneInfo_4:OnPlayerLeaveCopyScene(cid,uid)
	--离开积分清零
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20300) ~= 0 then
		local npcid = s_summon(SCENE_ENTRY_PLAYER,uid,60765)
		if s_getSceneVar(cid,60633,1) == uid then
			s_setSceneVar(cid,60633,1,npcid)
		end
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20301) ~= 0 then
		local npcid = s_summon(SCENE_ENTRY_PLAYER,uid,60766)
		for i=1,4 do
			if s_getSceneVar(sid,60634,i) == uid then
				s_setSceneVar(cid,60634,i,npcid)
			end
		end
	end
	for i=20300,20310 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE) >= 100 then
		AddAchieveTaskOperate(uid,41007,1)
	end
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE,0)
	s_addVar(uid,102,16,0)
	s_addVar(uid,102,17,0)
end
function CopySceneInfo_4:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	local index,score = CopySceneInfo_4:getUserOrder(cid,uid)
	if index == nil or score == nil then return end
	local mscore = s_getVar(murder[1],100,37)
	if score > 0 then --被杀的有积分先把分扣了
		if score >= 80 then
			s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE,score-5)
	elseif score > 2 then
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE,score-2)
	else
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_FLAG_SCORE,0)
	end
	end
	local addpoint = 0
	if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20300) ~= 0 then
		addpoint = addpoint + 10
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20301) ~= 0 then
		addpoint = addpoint + 5
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20300) ~= 0 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,20300)
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20301) ~= 0 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,20301)
	end
	local angrypoint = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ANGRY_POINT)
	if score < 80 then --击败普通者+5
		if score > 0 then
			s_addValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_FLAG_SCORE,5)
			local rand = math.random(30,50)
			angrypoint = angrypoint + rand
			if angrypoint > 100 then
				angrypoint = 100
			end
			s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ANGRY_POINT,angrypoint)
	elseif score == 0 then
		angrypoint = angrypoint+100
		if angrypoint > 100 then
			angrypoint = 100
		end
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ANGRY_POINT,angrypoint)
	end
	end
	if index == nil or score == nil then return end
	if index <= 50 and score >= 80 then --击败领跑者+15
		s_addValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_FLAG_SCORE,15)
		local rand = math.random(10,20)
		angrypoint = angrypoint + rand
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ANGRY_POINT,angrypoint)
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20310)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20308) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,20308,1,20*60)
		end
	elseif score >= 80 then --击败领先者+10
		s_addValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_FLAG_SCORE,10)
		local rand = math.random(5,10)
		angrypoint = angrypoint + rand
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ANGRY_POINT,angrypoint)
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20310)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20309) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,20309,1,20*60)
		end
	elseif score > 2 then
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20310)
		end
	else
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,uid,20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20310) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,20310,1,20*60)
		end
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20300) ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_FLAG_SCORE,10)
	end
	if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20301) ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_FLAG_SCORE,5)
	end
	local mindex,mscore1 = CopySceneInfo_4:getUserOrder(cid,murder[1])
	if mindex == nil or mscore1 == nil then return end
	if mindex <= 50 and mscore1 >= 80 then
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20310)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20308) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,murder[1],20308,1,20*60)
		end
	elseif mscore1 >= 80 then
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20310)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20309) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,murder[1],20309,1,20*60)
		end
	elseif mscore1 > 0 then
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20310) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20310)
		end
	elseif mscore1 == 0 then
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20308) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20308)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20309) ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER,murder[1],20309)
		end
		if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],20310) == 0 then
			s_addbuff(SCENE_ENTRY_PLAYER,murder[1],20310,1,20*60)
		end
	end
	local killnum = s_getVar(murder[1],100,38)
	if killnum ~= nil then
		s_addVar(murder[1],100,38,killnum+1)
	end
	s_addVar(uid,100,39,s_getVar(uid,100,39)+1)
	local score2 = s_getVar(uid,100,37)
	local mscore2 = s_getVar(murder[1],100,37)
end
function CopySceneInfo_4:OnPlayerRelive(uid, rtype)
	if rtype == 7 then
		--		local rand = math.random(1,table.getn(CopySceneInfo_4.reliveZone))
		local zone = CopySceneInfo_4.reliveZone
		local posx = zone.x + math.random(0, zone.width)
		local posy = zone.y + math.random(0, zone.height)
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,10211,1,3)
	end
end
function CopySceneInfo_4:getUserOrder(cid,uid)
	local data = {}
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local score = s_getVar(list[i+1],100,37)
		local t = {list[i+1],score}
		table.insert(data,t)
	end
	table.sort(data,function(t1,t2)return t1[2] > t2[2] end)
	for i = 1,table.getn(data) do
		if data[i][1] == uid then
			return i,data[i][2]
		end
	end
	return 0,0
end
function OnLoopCopyScene_1Sec_4(ctype,cid)
	local wait = s_getSceneVar(cid,0,100)
	if wait > 0 then
		s_copyInfo(cid,"开始倒计时:" .. wait)
		s_setSceneVar(cid,0,100,wait - 1)
		return
	end
	local begin = s_getSceneVar(cid,0,102)
	local ret = 0
	if begin > 0 then
		s_setSceneVar(cid,0,102,begin - 1)
		return
	elseif begin == 0 and s_getSceneVar(cid,0,104) == 0 then
		--旗子刷新
		local npcid = s_sysSummon(60633,cid,119,129)
		s_setSceneVar(cid,60633,1,npcid)
		npcid = s_sysSummon(60634,cid,150,159)
		s_setSceneVar(cid,60634,1,npcid)
		npcid = s_sysSummon(60634,cid,88,159)
		s_setSceneVar(cid,60634,2,npcid)
		npcid = s_sysSummon(60634,cid,88,97)
		s_setSceneVar(cid,60634,3,npcid)
		npcid = s_sysSummon(60634,cid,149,97)
		s_setSceneVar(cid,60634,4,npcid)
		s_copyInfo(cid,"红旗、蓝旗已刷新到指定位置，点击大地图M键查看。")
		s_setSceneVar(cid,0,104,1)
	end
	local start = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101)
	--[[
	if start % 10 == 0 then
	local rand = math.random(1,table.getn(CopySceneInfo_4.buffZone))
	local zone = CopySceneInfo_4.buffZone[rand]
	local posx = (zone.x - zone.width/2) + math.random(1, zone.width)
	local posy = (zone.y - zone.height/2) + math.random(1, zone.height)
	local npcid = s_sysSummon(math.random(60208,60632,cid,posx,posy))
	end
	]]
	if start == 19 * 60 then
		s_copyInfo(cid,"副本将在1分钟后回收",ChatPos_Sys);
	end
	if start < 20 * 60 and start > 20*60 - 10 then
		local final = s_getSceneVar(cid,0,103)
		if final > 0 then
			s_setSceneVar(cid,0,103,final- 1)
			s_copyInfo(cid,"副本将在10秒后回收，当前所有人将处于无敌状态",ChatPos_Sys);
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i = 1,table.getn(list), 2 do
				s_addbuff(list[i],list[i+1],95,1,10)
				if s_getbufflevel(list[i],list[i+1],20300) ~= 0 then
					s_updateBuffTime(list[i],list[i+1],20300,0)
					s_addValue(list[i],list[i+1],VALUE_TYPE_FLAG_SCORE,150)
				end
				if s_getbufflevel(list[i],list[i+1],20301) ~= 0 then
					s_updateBuffTime(list[i],list[i+1],20301,0)
					s_addValue(list[i],list[i+1],VALUE_TYPE_FLAG_SCORE,50)
				end
			end
		end
	end
	if start < 20 * 60 and start > 20*60 - 5 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			CopySceneInfo_4:SendCopyInfoList(cid,list[i+1],5)
		end
	end
	if start >= 20 * 60 and s_getSceneVar(cid,0,105) == 0 then --时间到比赛结束
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do--回收旗帜
			--经验奖励
			local index,score = CopySceneInfo_4:getUserOrder(cid,list[i+1])
			local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
			if score * 0.4 < 200 then --积分换经验
				local exp = (100 + score * 0.4) * (50 + 0.1*level^2.2)
				s_refreshExp(list[i+1],exp,ExpType_FlagBattle,0)
			else
				local exp = (100 + 200) * (50 + 0.1*level^2.2)
				s_refreshExp(list[i+1],exp,ExpType_FlagBattle,0)
			end
			--战斗力排行500以内
			if s_getField(list[i+1],UserVar_PowerOrder) <= 500 and
				s_getField(list[i+1],UserVar_PowerOrder) ~= 0 then
				--排名奖励
				if index == 1 then
					local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
					s_worldInfo(name.."见神杀神，见佛杀佛，获得了血战到底第一名！", ChatPos_Honor)
					--称号
					--s_addTitle(SCENE_ENTRY_PLAYER,list[i+1],38)
					s_sysMail(list[i+1],"恭喜您获得血战到底第一名奖励：羽灵*18！",0,27125,18,"1-1", 0, "血战到底活动")
				elseif index == 2 then
					--s_addTitle(SCENE_ENTRY_PLAYER,list[i+1],37)
					s_sysMail(list[i+1],"恭喜您获得血战到底第二名奖励：羽灵*14！请再接再厉！再升1名可获得羽灵*18！",0,27125,14,"1-1", 0, "血战到底活动")
				elseif index == 3 then
					--s_addTitle(SCENE_ENTRY_PLAYER,list[i+1],36)
					s_sysMail(list[i+1],"恭喜您获得血战到底第三名奖励：羽灵*10！请再接再厉！再升1名可获得羽灵*14！",0,27125,10,"1-1", 0, "血战到底活动")
				elseif index <= 10 and index ~= 0 then
					s_sysMail(list[i+1],"恭喜您获得血战到底4-10名奖励羽灵*6！请再接再励！获得第三名可获得羽灵*10！",0,27125,6,"1-1", 0, "血战到底活动")
				end
				if index > 10  and index <=50 then
					s_sysMail(list[i+1],"恭喜您获得血战到底前50名奖励羽灵*4！请再接再厉！获得前10名可获得羽灵*6！",0,27125,4,"1-1", 0, "血战到底活动")
				end
				if index > 50 and index <= 100 then
					s_sysMail(list[i+1],"恭喜您获得血战到底前100名奖励羽灵*2！请再接再励！获得前50名可获得羽灵*4！",0,27125,2,"1-1", 0, "血战到底活动")
				end
				--积分奖励
				if score >= 250 then
					s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,10)
				elseif score >= 80 then
					s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,5)
				end
				s_sysMail(list[i+1],"血战到底参与奖：羽灵*3！获得更高排名可获得更多羽灵。",0,27125,3,"1-1", 0, "血战到底活动")
			else
				s_sysMail(list[i+1],"血战到底参与奖：羽灵*3！请再接再厉！进入高级场可获得更多羽灵！",0,27125,3,"1-1", 0, "血战到底活动")
			end
		end
		s_setSceneVar(cid,0,105,1)
		s_copyInfo(cid,"比赛时间结束",ChatPos_MsgBox)
	elseif start >= 20 * 60 then
		s_clearCopy(cid)
	end
end

--local flagfun = [[
--	function OnClickNpc_$1(uid,npcid)
--		if s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP) ~= 0 then
--			return
--		end
--		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,0)
--		s_addbuff(SCENE_ENTRY_PLAYER,uid,$2,1,20*60)
--	end
--]]
--[[
RegistetFunction(FormatString(flagfun,60628,20302))
RegistetFunction(FormatString(flagfun,60629,20303))
RegistetFunction(FormatString(flagfun,60630,20304))
RegistetFunction(FormatString(flagfun,60631,20305))
RegistetFunction(FormatString(flagfun,60632,20306))

RegistetFunction(FormatString(flagfun,60633,20300))
RegistetFunction(FormatString(flagfun,60634,20301))
]]
