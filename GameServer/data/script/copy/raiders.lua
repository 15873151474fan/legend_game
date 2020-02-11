--奇兵交锋
-- 进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101 开始时间
--0_102 红方杀敌数
--0_103 蓝方杀敌数
--0_104 结束发奖，0未发，1已发

--角色数据
ArUser_Gindex           = 1     -- 阵营索引

CopySceneInfo_72 = {
	--阵营BUFF
	groupID = {17,18},
	--初始进入区
	initZone = {
		{ x = 99, y = 121, width = 5, height = 5 }, --红
		{ x = 148, y = 121, width = 5, height = 5 }  --蓝
	},
}

--用户变量
function CopySceneInfo_72:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_72:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--刷新客户端副本信息
--1红方击败数，2蓝方击败数，3剩余时间
function CopySceneInfo_72:SendCopyInfo(sid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	if ckey == 0 then
		table.insert(vlist, 1)
		table.insert(vlist, s_getSceneVar(sid,0,102))
		table.insert(vlist, 2)
		table.insert(vlist, s_getSceneVar(sid,0,103))
		local start = s_getSceneVar(sid,0,101)
		local cursec = s_getCurTime(TIME_ALLSECONDS)
		table.insert(vlist,3)
		table.insert(vlist,5*60-(cursec-start))
		size = 3
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
	end
	s_sendCopyVar(CopySceneType_Raiders, sid,uid,size,vlist)
end

function CopySceneInfo_72:InitCopyScene(cid)
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
end

function CopySceneInfo_72:OnPlayerIntoCopyScene(cid,uid)
	local x = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(self.initZone[1].x-x) < 20 and math.abs(self.initZone[1].y-y) < 20 then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		self:SetUserVar(uid,ArUser_Gindex,1)
	elseif math.abs(self.initZone[2].x-x) < 20 and math.abs(self.initZone[2].y-y) < 20 then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		self:SetUserVar(uid,ArUser_Gindex,2)
	end
	self:SendCopyInfo(cid,uid,0,0)
end

function CopySceneInfo_72:OnPlayerLeaveCopyScene(cid,uid)
	for i=17,18 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	s_removebuff(SCENE_ENTRY_PLAYER,uid,20302)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,20303)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,20304)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,20305)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,20306)
end

function CopySceneInfo_72:gameOver(cid,group)
	if s_getSceneVar(cid,0,104) == 1 then
		return
	end
	if group == 1 then
		s_copyInfo(cid,"红方获得奇兵交锋战胜利")
	elseif group == 2 then
		s_copyInfo(cid,"蓝方获得奇兵交锋战胜利")
	else
		s_copyInfo(cid,"双方在奇兵交锋战中棋逢对手，战成平局")
	end

	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local gi = self:GetUserVar(list[i+1],ArUser_Gindex)
		if gi == group then
			s_addItem(list[i+1],31547,0,3,0,"1-1","奇兵交锋战获得")
			s_sysInfo(list[i+1],"先锋战胜利！获得角色经验和道具奖励！（先锋战剩余可参加次数"..(5-s_getVar(list[i+1],117,3)).."次）"
				,ChatPos_MsgBox)
		elseif group ~= 0 then
			s_addItem(list[i+1],31547,0,1,0,"1-1","奇兵交锋战获得")
			s_sysInfo(list[i+1],"先锋战失败！获得角色经验和道具奖励！（先锋战剩余可参加次数"..(5-s_getVar(list[i+1],117,3)).."次）"
				,ChatPos_MsgBox)
		else
			s_addItem(list[i+1],31547,0,2,0,"1-1","奇兵交锋战获得")
			s_sysInfo(list[i+1],"先锋战平局！获得角色经验和道具奖励！（先锋战剩余可参加次数"..(5-s_getVar(list[i+1],117,3)).."次）"
				,ChatPos_MsgBox)
		end
		local level = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_LEVEL)
		s_refreshExp(list[i+1],math.floor(20 * (50 + 0.1*level^2.2)),CopySceneType_Raiders,0)
	end
	s_clearCopy(cid)
	s_setSceneVar(cid,0,104,1)
end

function CopySceneInfo_72:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	if table.getn(murder) == 0 then return end
	local redlevel = s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],17)
	if redlevel > 0 then
		s_setSceneVar(cid,0,102,s_getSceneVar(cid,0,102)+1)
		self:SendCopyInfo(cid,0,1,s_getSceneVar(cid,0,102))
	end
	local bluelevel = s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],18)
	if bluelevel > 0 then
		s_setSceneVar(cid,0,103,s_getSceneVar(cid,0,103)+1)
		self:SendCopyInfo(cid,0,2,s_getSceneVar(cid,0,103))
	end
	if s_getSceneVar(cid,0,102) >= 10 then
		self:gameOver(cid,1)
	end
	if s_getSceneVar(cid,0,103) >= 10 then
		self:gameOver(cid,2)
	end
end

function CopySceneInfo_72:OnPlayerRelive(uid,rtype)
	local level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,17)
	if level > 0 then
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[1].x,self.initZone[1].y)
	end
	level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,18)
	if level > 0 then
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[2].x,self.initZone[2].y)
	end
end

function OnLoopCopyScene_1Sec_72(ctype,cid)
	CopySceneInfo_72:Loop_1Sec(ctype,cid)
end
function CopySceneInfo_72:Loop_1Sec(ctype,cid)
	if s_getSceneVar(cid,0,104) == 1 then
		return
	end
	local start = s_getSceneVar(cid,0,101)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	if cursec - start >= 5*60 then
		if s_getSceneVar(cid,0,102) > s_getSceneVar(cid,0,103) then
			self:gameOver(cid,1)
		elseif s_getSceneVar(cid,0,102) < s_getSceneVar(cid,0,103) then
			self:gameOver(cid,2)
		else
			self:gameOver(cid,0)
		end
	end
end
------------------------------------------------------------------------------------
