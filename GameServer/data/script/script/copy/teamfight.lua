--组队争夺战
-- 进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101 开始时间
--0_102 红方积分
--0_103 蓝方积分
--0_104 红方占领NPC数量
--0_105 蓝方占领NPC数量
--0_106 祭坛压制
--0_107 红方杀人数
--0_108 蓝方杀人数
--0_109 压制胜利
--0_110 红方天平事件,1已触发
--0_111 蓝方天平事件,1已触发
--0_112 组队争夺战结束
--0_113 祭坛是否刷新，0未刷新，1已刷新

--角色数据
ArUser_Gindex           = 1     -- 阵营索引
ArUser_KillUser         = 2     -- 杀人数
ArUser_Point			= 3		-- 积分

--旗数据
ArFlag_Npc              = 1     -- 旗子NPC
ArFlag_Group            = 2     -- 当前阵营
ArFlag_OccupyTime		= 3		-- 占领时间

CopySceneInfo_65 = {
	--阵营BUFF
	groupID = {17,18},
	--初始进入区
	initZone = {
		{ x = 140, y = 113, width = 5, height = 5 }, --红
		{ x = 351, y = 145, width = 5, height = 5 }  --蓝
	},
	--NPC坐标
	flag = {
		{60854,60855,60853,x =93, y =63,  buff = {75,78}},   --西北
		{60854,60855,60853,x =191, y =191,  buff = {75,78}}, --西南
		{60854,60855,60853,x =384, y =205, buff = {75,78}},  --东南
		{60854,60855,60853,x =337, y =56, buff = {75,78}},   --东北
	},
}

--用户变量
function CopySceneInfo_65:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_65:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--获取最大积分者
function CopySceneInfo_65:GetMaxScoreUser(sid,group)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	local glist = {}
	for i = 1,table.getn(list), 2 do
		if self:GetUserVar(list[i+1],ArUser_Gindex) == group then
			table.insert(glist,list[i+1])
		end
	end
	if table.getn(glist) > 0 then
		local maxscore = self:GetUserVar(glist[1],ArUser_Point)
		local maxuser = glist[1]

		for i = 1,table.getn(glist) do
			local score = self:GetUserVar(glist[i],ArUser_Point)
			if maxscore < score then
				maxscore = score
				maxuser = glist[i]
			end
		end
		return maxuser
	end
	return 0
end

--旗变量
function CopySceneInfo_65:GetFlagVar(sid,index,key)
	return s_getSceneVar(sid,3,index*100+key)
end
function CopySceneInfo_65:SetFlagVar(sid,index,key,value)
	s_setSceneVar(sid,3,index*100+key,value)
end

--刷新客户端战绩表
function CopySceneInfo_65:GetCopyInfoList(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_PLAYER)
	local row = 0
	local vlist = {}
	for i = 1,table.getn(list), 2 do
		local userid = list[i+1]
		local score = self:GetUserVar(list[i+1],ArUser_Point)
		table.insert(vlist,self:GetUserVar(list[i+1],ArUser_Gindex))
		table.insert(vlist,userid)
		table.insert(vlist,score)
		row = row + 1
	end
	return vlist,row,3
end

--客户端请求发送战绩数据
function CopySceneInfo_65:SendCopyInfoList(sid,uid,rtype)
	local vlist,row,col = self:GetCopyInfoList(sid)
	if vlist == nil or #vlist == 0 then
		return
	end
	s_sendCopyList(rtype,0,uid,col,row,vlist)
end

--刷新客户端副本信息
--1-7 当前7个占领点被占情况(0无,1红,2篮)
function CopySceneInfo_65:SendCopyInfo(sid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	if ckey == 0 then
		for i=1, 4 do
			table.insert(vlist,i)
			local group = self:GetFlagVar(sid,i,ArFlag_Group)
			table.insert(vlist,group)
		end
		table.insert(vlist, 5)
		table.insert(vlist, s_getSceneVar(sid,0,102))
		table.insert(vlist, 6)
		table.insert(vlist, s_getSceneVar(sid,0,103))
		table.insert(vlist, 7)
		table.insert(vlist,s_getSceneVar(sid,0,104))
		table.insert(vlist,8)
		table.insert(vlist,s_getSceneVar(sid,0,105))
		table.insert(vlist,9)
		table.insert(vlist,s_getSceneVar(sid,0,106))
		local start = s_getSceneVar(sid,0,101)
		local cursec = s_getCurTime(TIME_ALLSECONDS)
		table.insert(vlist,10)
		table.insert(vlist,10*60+30-(cursec-start))
		size = 10
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
	end
	s_sendCopyVar(CopySceneType_TeamFight, sid,uid,size,vlist)
end

function CopySceneInfo_65:InitCopyScene(cid)
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
end

function CopySceneInfo_65:OnPlayerIntoCopyScene(cid,uid)
	--[[
	if s_getVar(uid,117,1) == 1 then
	s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
	self.SetUserVar(uid,ArUser_Gindex,1)
	else if s_getVar(uid,117,1) == 2 then
	s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
	self.SetUserVar(uid,ArUser_Gindex,2)
	end
	]]
	local x = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(self.initZone[1].x-x) < 20 and math.abs(self.initZone[1].y-y) < 20 then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		self:SetUserVar(uid,ArUser_Gindex,1)
	elseif math.abs(self.initZone[2].x-x) < 20 and math.abs(self.initZone[2].y-y) < 20 then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		self:SetUserVar(uid,ArUser_Gindex,2)
	end
	self:SetUserVar(uid,ArUser_KillUser,0)
	self:SetUserVar(uid,ArUser_Point,0)
	local start = s_getSceneVar(cid,0,101)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	if cursec-start < 30 then
		s_addbuff(SCENE_ENTRY_PLAYER,uid,95,1,30-(cursec-start))
	end
	self:SendCopyInfo(cid,uid,0,0)
end

function CopySceneInfo_65:OnPlayerLeaveCopyScene(cid,uid)
	for i=17,18 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	s_removebuff(SCENE_ENTRY_PLAYER,uid,95)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,1014)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,31067)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,31068)
	s_deleteItemByBaseID(uid,31688,0,"组队争夺战结束删除")
end

function CopySceneInfo_65:gameOver(cid,group)
	if s_getSceneVar(cid,0,112) == 1 then
		return
	end
	if group == 1 then
		s_copyInfo(cid,"红方获得组队争夺战胜利")
	else
		s_copyInfo(cid,"蓝方获得组队争夺战胜利")
	end
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local gi = self:GetUserVar(list[i+1],ArUser_Gindex)
		local point = s_getVar(list[i+1],1,37)
		local msg = ""
		if gi == group then
			--增加竞技点
			msg = msg .. "您在本场比赛中获胜,"
			if self:GetMaxScoreUser(cid,gi) == list[i+1] then
				msg = msg .. "队内积分排名第一,竞技点+5,"
				point = point+5
			else
				msg = msg .. "竞技点+4,"
				point = point+4
			end
			local victimnum = s_getVar(list[i+1],1,38)
			if victimnum == 15 then
				victimnum = 0
			end
			s_addVar(list[i+1],1,38,victimnum+1)
			if victimnum+1 >= 3 then
			--AddAchieveTaskOperate(list[i+1],41006,1)
			end
			if victimnum+1 == 5 then
				msg = msg .. "个人连胜次数5,竞技点+5,"
				point = point+5
			elseif victimnum+1 == 10 then
				msg = msg .. "个人连胜次数10,竞技点+10,"
				point = point+10
			elseif victimnum+1 == 15 then
				msg = msg .. "个人连胜次数15,竞技点+20,"
				point = point+20
			end
		else
			msg = msg .. "您在本场比赛中失败,"
			if self:GetMaxScoreUser(cid,gi) == list[i+1] then
				msg = msg .. "队内积分排名第一,竞技点+3,"
				point = point+3
			else
				msg = msg .. "竞技点+2,"
				point = point+2
			end
			s_addVar(list[i+1],1,38,0)
		end
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday == 0 then
			msg = msg .. "周日额外获得竞技点+1,"
			point = point+1
		end
		msg = msg .. "已累积竞技点数" .. point
		s_sysInfo(list[i+1],msg,ChatPos_MsgBox)
		s_addVar(list[i+1],1,37,point)
		self:SendCopyInfoList(cid,list[i+1],6)
	end
	s_clearCopy(cid)
	s_setSceneVar(cid,0,112,1)
end

function CopySceneInfo_65:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	if table.getn(murder) == 0 then return end
	local redlevel = s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],17)
	if redlevel > 0 then
		s_setSceneVar(cid,0,102,s_getSceneVar(cid,0,102)+1)
		s_setSceneVar(cid,0,107,s_getSceneVar(cid,0,107)+1)
		self:SendCopyInfo(cid,0,5,s_getSceneVar(cid,0,102))
	end
	local bluelevel = s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],18)
	if bluelevel > 0 then
		s_setSceneVar(cid,0,103,s_getSceneVar(cid,0,103)+1)
		s_setSceneVar(cid,0,108,s_getSceneVar(cid,0,108)+1)
		self:SendCopyInfo(cid,0,6,s_getSceneVar(cid,0,103))
	end
	local point = self:GetUserVar(murder[1],ArUser_Point)
	if point == nil then
		point = 0
	end
	self:SetUserVar(murder[1],ArUser_Point,point+1)
	local num = self:GetUserVar(uid,ArUser_KillUser)
	if num == nil then
		num = 0
	end
	self:SetUserVar(uid,ArUser_KillUser,num+1)
	if s_getSceneVar(cid,0,102) >= 1000 then
		self:gameOver(cid,1)
	end
	if s_getSceneVar(cid,0,103) >= 1000 then
		self:gameOver(cid,2)
	end
end

function CopySceneInfo_65:OnPlayerRelive(uid,rtype)
	local level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,17)
	if level > 0 then
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[1].x,self.initZone[1].y)
	end
	level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,18)
	if level > 0 then
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[2].x,self.initZone[2].y)
	end
end

function OnLoopCopyScene_1Sec_65(ctype,cid)
	CopySceneInfo_65:Loop_1Sec(ctype,cid)
end
function CopySceneInfo_65:Loop_1Sec(ctype,cid)
	if s_getSceneVar(cid,0,112) == 1 then
		return
	end
	local start = s_getSceneVar(cid,0,101)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	if cursec - start < 30 then
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i=1,table.getn(list),2 do
			if s_getbufflevel(list[i],list[i+1],95) == 0 then
				s_addbuff(list[i],list[i+1],95,1,30-(cursec-start))
			end
		end
		s_copyInfo(cid,"开始倒计时:" .. 30-(cursec-start))
		return
	end
	if cursec - start >= 30 and s_getSceneVar(cid,0,113) == 0 then
		for i=1,4 do
			local npcid = s_sysSummon(self.flag[i][3], cid, self.flag[i].x, self.flag[i].y,0,1)
			if npcid == 0 then
				s_debug("组队争夺NPC初始化失败:%u",self.flag[i][3])
			else
				self:SetFlagVar(cid,i, ArFlag_Npc, npcid)
				self:SetFlagVar(cid,i, ArFlag_Group, 0)
				self:SetFlagVar(cid,i, ArFlag_OccupyTime, 0)
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,i)
			end
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i=1,table.getn(list),2 do
			s_removebuff(list[i],list[i+1],95)
		end
		s_setSceneVar(cid,0,113,1)
	end
	if cursec - start < 5*60+30 then
		if s_getSceneVar(cid,0,104) == 4 and s_getSceneVar(cid,0,102) > s_getSceneVar(cid,0,103) then
			-- 蓝方
			if s_getSceneVar(cid,0,111) == 0 then
				s_copyInfo(cid,"由于蓝方处于极度不利的境地，命运之神降临了！",ChatPos_Sys + ChatPos_Important);
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i=1,table.getn(list),2 do
					local level = s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],18)
					local powerorder = s_getField(list[i+1],UserVar_PowerOrder)
					local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
					if level > 0 then
						local rand = math.random(1,100)
						if powerorder <= 50 then
							if rand <= 45 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 90 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 98 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						else
							if rand <= 30 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 60 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 85 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						end
					end
				end
				s_setSceneVar(cid,0,111,1)
			end
		elseif s_getSceneVar(cid,0,105) == 4 and s_getSceneVar(cid,0,103) > s_getSceneVar(cid,0,102) then
			-- 红方
			if s_getSceneVar(cid,0,110) == 0 then
				s_copyInfo(cid,"由于红方处于极度不利的境地，命运之神降临了！",ChatPos_Sys + ChatPos_Important);
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i=1,table.getn(list),2 do
					local level = s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],17)
					local powerorder = s_getField(list[i+1],UserVar_PowerOrder)
					local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
					if level > 0 then
						local rand = math.random(1,100)
						if powerorder <= 50 then
							if rand <= 45 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 90 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 98 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						else
							if rand <= 30 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 60 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 85 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						end
					end
				end
				s_setSceneVar(cid,0,110,1)
			end
		elseif s_getSceneVar(cid,0,102) > s_getSceneVar(cid,0,103)+200 then
			-- 蓝方
			if s_getSceneVar(cid,0,111) == 0 then
				s_copyInfo(cid,"由于蓝方处于极度不利的境地，命运之神降临了！",ChatPos_Sys + ChatPos_Important);
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i=1,table.getn(list),2 do
					local level = s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],18)
					local powerorder = s_getField(list[i+1],UserVar_PowerOrder)
					local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
					if level > 0 then
						local rand = math.random(1,100)
						if powerorder <= 50 then
							if rand <= 45 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 90 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 98 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						else
							if rand <= 30 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 60 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 85 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了蓝方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						end
					end
				end
				s_setSceneVar(cid,0,111,1)
			end
		elseif s_getSceneVar(cid,0,103) > s_getSceneVar(cid,0,102)+200 then
			-- 红方
			if s_getSceneVar(cid,0,110) == 0 then
				s_copyInfo(cid,"由于红方处于极度不利的境地，命运之神降临了！",ChatPos_Sys + ChatPos_Important);
				local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
				for i=1,table.getn(list),2 do
					local level = s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],17)
					local powerorder = s_getField(list[i+1],UserVar_PowerOrder)
					local name = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_NAME)
					if level > 0 then
						local rand = math.random(1,100)
						if powerorder <= 50 then
							if rand <= 45 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 90 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 98 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						else
							if rand <= 30 then
								s_addItem(list[i+1],31688,0,15,0,"1-1","组队争夺战－随机卷轴")
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神出鬼莫的随机卷轴！")
							elseif rand <= 60 then
								s_addbuff(list[i],list[i+1],1014,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."神速状态，现在的速度，就像打了鸡血的猪~~")
							elseif rand <= 85 then
								s_addbuff(list[i],list[i+1],31067,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."宙斯之力，攻击暴涨，敌人要小心了")
							else
								s_addbuff(list[i],list[i+1],31068,1,10*60)
								s_copyInfo(cid,"命运之神赐予了红方"..name.."撒旦之力，已经狂暴了！众生速速回避~")
							end
						end
					end
				end
				s_setSceneVar(cid,0,110,1)
			end
		end
	end
	if cursec - start < 10*60+30 then
		if s_getSceneVar(cid,0,104) == 4 or s_getSceneVar(cid,0,105) == 4 then
			s_setSceneVar(cid,0,106,s_getSceneVar(cid,0,106)-1)
			if s_getSceneVar(cid,0,106) == 0 then
				s_setSceneVar(cid,0,109,1)
			end
		end
		if s_getSceneVar(cid,0,109) == 1 then
			if s_getSceneVar(cid,0,104) == 4 then
				self:gameOver(cid,1)
			end
			if s_getSceneVar(cid,0,105) == 4 then
				self:gameOver(cid,2)
			end
		end
		for i=1,4 do
			if cursec >= self:GetFlagVar(cid,i,ArFlag_OccupyTime)+15 then
				local gi = self:GetFlagVar(cid,i,ArFlag_Group)
				if gi == 1 then
					s_setSceneVar(cid,0,102,s_getSceneVar(cid,0,102)+12)
					self:SendCopyInfo(cid,0,5,s_getSceneVar(cid,0,102))
					if s_getSceneVar(cid,0,102) >= 1000 then
						self:gameOver(cid,1)
					end
				elseif gi == 2 then
					s_setSceneVar(cid,0,103,s_getSceneVar(cid,0,103)+12)
					self:SendCopyInfo(cid,0,6,s_getSceneVar(cid,0,103))
					if s_getSceneVar(cid,0,103) >= 1000 then
						self:gameOver(cid,2)
					end
				end
				self:SetFlagVar(cid,i,ArFlag_OccupyTime,cursec)
			end
		end
	end
	if cursec - start >= 10*60+30 then
		if s_getSceneVar(cid,0,102) > s_getSceneVar(cid,0,103) then
			self:gameOver(cid,1)
		elseif s_getSceneVar(cid,0,102) < s_getSceneVar(cid,0,103) then
			self:gameOver(cid,2)
		else
			if s_getSceneVar(cid,0,107) > s_getSceneVar(cid,0,108) then
				self:gameOver(cid,1)
			else
				self:gameOver(cid,2)
			end
		end
	end
end

function CopySceneInfo_65:ToReadFlag(uid,npcid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if sid == 0 or stype ~= CopySceneType_TeamFight then
		return
	end
	local npcindex = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	if npcindex == 0 then
		s_debug("读旗时找不到对应序号:%u,%u",uid,npcid)
		return
	end
	if self:CheckReadState(uid,npcid) == VALUE_FAIL then
		return
	end
	local gi = self:GetUserVar(uid,ArUser_Gindex)
	local npcgroup = self:GetFlagVar(sid,npcindex,ArFlag_Group)
	if gi == npcgroup then
		s_sysInfo(uid,"本方已经占领该据点",ChatPos_Sys + ChatPos_Important)
		return
	end
	local callback = "CopySceneInfo_65:DoGetFlag($1,$2," .. sid .. "," .. npcindex .. ")"
	s_showbar(uid,10000,callback,UninterruptActionType_TASK,1,0,1)
end

function CopySceneInfo_65:DoGetFlag(uid,tbreak,sid,npcindex)
	if tbreak == nil then tbreak = 0 end
	if tbreak == 1 then
		return
	end
	local gi = self:GetUserVar(uid,ArUser_Gindex)
	local oldgi = self:GetFlagVar(sid,npcindex,ArFlag_Group)
	if gi == oldgi then
		s_sysInfo(uid,"本方已经占领该据点",ChatPos_Sys + ChatPos_Important)
		return
	end
	self:SetFlagVar(sid,npcindex,ArFlag_Group,gi)
	self:SetFlagVar(sid,npcindex,ArFlag_OccupyTime,s_getCurTime(TIME_ALLSECONDS))
	local npcid = self:GetFlagVar(sid,npcindex,ArFlag_Npc)
	if self.flag[npcindex][gi] ~= 0 then
		s_killnpc(npcid,1)
		npcid = s_sysSummon(self.flag[npcindex][gi],sid,self.flag[npcindex].x, self.flag[npcindex].y,0,1)
		if npcid > 0 then
			self:SetFlagVar(sid,npcindex,ArFlag_Npc,npcid)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,npcindex)
			s_addbuff(SCENE_ENTRY_NPC, npcid, self.flag[npcindex].buff[gi], 1, 3600)
		else
			s_debug("换旗招NPC失败:%u,%u",uid,self.flag[npcindex][gi])
		end
	end
	local gmsg = ""
	if gi == 1 then
		gmsg = gmsg .. "红方"
	elseif gi == 2 then
		gmsg = gmsg .. "蓝方"
	end
	if npcindex == 1 then
		gmsg = gmsg .. "占领了A区祭坛。"
	elseif npcindex == 2 then
		gmsg = gmsg .. "占领了C区祭坛。"
	elseif npcindex == 3 then
		gmsg = gmsg .. "占领了D区祭坛。"
	elseif npcindex == 4 then
		gmsg = gmsg .. "占领了B区祭坛。"
	end
	s_copyInfo(sid,gmsg,ChatPos_Sys + ChatPos_Important)
	local point = self:GetUserVar(uid,ArUser_Point)
	self:SetUserVar(uid,ArUser_Point,point+2)
	s_setSceneVar(sid,0,101+gi,s_getSceneVar(sid,0,101+gi)+2)
	if gi == 1 then
		s_setSceneVar(sid,0,104,s_getSceneVar(sid,0,104)+1)
	elseif gi == 2 then
		s_setSceneVar(sid,0,105,s_getSceneVar(sid,0,105)+1)
	end
	if oldgi == 1 then
		s_setSceneVar(sid,0,104,s_getSceneVar(sid,0,104)-1)
	elseif oldgi == 2 then
		s_setSceneVar(sid,0,105,s_getSceneVar(sid,0,105)-1)
	end
	if s_getSceneVar(sid,0,104) == 4 or s_getSceneVar(sid,0,105) == 4 then
		s_setSceneVar(sid,0,106,60)
	end
	if s_getSceneVar(sid,0,104) ~= 4 and s_getSceneVar(sid,0,105) ~= 4 then
		s_setSceneVar(sid,0,106,0)
		s_getSceneVar(cid,0,109,0)
	end
	self:SendCopyInfo(sid,0,0,0)
	if s_getSceneVar(sid,0,102) >= 1000 then
		self:gameOver(sid,1)
	end
	if s_getSceneVar(sid,0,103) >= 1000 then
		self:gameOver(sid,2)
	end
end

function CopySceneInfo_65:CheckReadState(uid,npcid)
	if s_checkState(SCENE_ENTRY_PLAYER,uid,0) == VALUE_FAIL then
		s_sysInfo(uid,"非正常显身状态，不可操作",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local traffic = s_getTrafficType(uid)
	if traffic == nil then
		return VALUE_FAIL
	end
	if traffic ~= TrafficType_None then
		s_sysInfo(uid,"步行状态才可操作",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	if self:CheckNearNpc(SCENE_ENTRY_PLAYER,uid,npcid,5) == VALUE_FAIL then
		s_sysInfo(uid,"请再靠近一些",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	return VALUE_OK
end

function CopySceneInfo_65:CheckNearNpc(etype,eid,npcid,maxdis)
	local x = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
	local myx = s_getValue(etype,eid,VALUE_TYPE_POSX)
	local myy = s_getValue(etype,eid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > maxdis or math.abs(y-myy) > maxdis then
		return VALUE_FAIL
	end
	return VALUE_OK
end

------------------------------------------------------------------------------------
