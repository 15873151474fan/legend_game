--冒险岛
-- 进入副本后区分阵营模式 17-阵营A(红方-场景属主) 18-阵营B(蓝方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
-- 0-1 ~ 0-N  副本全局变量
GroupA_Num					= 1		-- 阵营A人数
GroupB_Num					= 2		-- 阵营B人数
GroupC_Num					= 3		-- 阵营C人数

function CopySceneInfo_UserAdvanture_InitCopyScene(ctype,cid)
end

function CopySceneInfo_UserAdvanture_OnPlayerIntoCopyScene(cid,uid)
	local rednum = s_getSceneVar(cid,0,GroupA_Num)
	local bluenum = s_getSceneVar(cid,0,GroupB_Num)
	local yellownum = s_getSceneVar(cid,0,GroupC_Num)
	local min = rednum
	local minteam = 1
	if bluenum < min then
		min = bluenum
		minteam = 2
	end
	if yellownum < min then
		minteam = 3
	end
	s_addGroup(SCENE_ENTRY_PLAYER, uid, minteam+16)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local bufftime = 0
	if time%86400 < 12*3600+15*60 then
		bufftime = 12*3600+15*60-time%86400
	elseif time%86400 < 20*3600+15*60 then
		bufftime = 20*3600+15*60-time%86400
	end
	s_addbuff(SCENE_ENTRY_PLAYER,uid,140+minteam,1,bufftime)
	if minteam == 1 then
		s_setSceneVar(cid,0,GroupA_Num,rednum+1)
		s_goto(SCENE_ENTRY_PLAYER,uid,140,44)
	elseif minteam == 2 then
		s_setSceneVar(cid,0,GroupB_Num,bluenum+1)
		s_goto(SCENE_ENTRY_PLAYER,uid,60,136)
	elseif minteam == 3 then
		s_setSceneVar(cid,0,GroupC_Num,yellownum+1)
		s_goto(SCENE_ENTRY_PLAYER,uid,203,133)
	end
	s_sendCopyInfo(cid,0,bufftime,"冒险岛")
	local vlist = {}
	local size = 1
	table.insert(vlist,1)
	local point = s_getField(uid,UserVar_AdvanturePoint)
	table.insert(vlist,point)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	s_sendCopyVar(stype,cid,uid,size,vlist)
end

function CopySceneInfo_UserAdvanture_OnPlayerLeaveCopyScene(cid,uid)
	for i=1,3 do
		local level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,140+i)
		if level > 0 then
			local num = s_getSceneVar(cid,0,i)
			if num > 0 then
				s_setSceneVar(cid,0,i,num-1)
			end
			s_removebuff(SCENE_ENTRY_PLAYER,uid,140+i)
			s_removebuff(SCENE_ENTRY_PLAYER,uid,16+i)
		end
	end
end

--key 1 冒险岛积分
function CopySceneInfo_UserAdvanture_OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	if table.getn(murder) == 0 then return end
	local vlist = {}
	local size = 1
	table.insert(vlist,1)
	local point = s_getField(murder[1],UserVar_AdvanturePoint)
	table.insert(vlist,point)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_SCENE_TYPE)
	s_sendCopyVar(stype,cid,murder[1],size,vlist)
end

function CopySceneInfo_UserAdvanture_OnPlayerRelive(uid,rtype)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	for i=1,3 do
		local level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,140+i)
		if level > 0 then
			if i == 1 then
				s_goto(SCENE_ENTRY_PLAYER,uid,140,44)
			elseif i == 2 then
				s_goto(SCENE_ENTRY_PLAYER,uid,60,136)
			elseif i == 3 then
				s_goto(SCENE_ENTRY_PLAYER,uid,203,133)
			end
		end
	end
end

function OnLoopCopyScene_1Sec_UserAdvanture(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		if time - s_getVar(list[i+1],116,198) >= 60 then
			s_setVar(list[i+1],116,198,time)
			s_addField(list[i+1],UserVar_AdvanturePoint,1)
			s_addField(list[i+1],UserVar_WeekAdvanturePoint,1)
			local vlist = {}
			local size = 1
			table.insert(vlist,1)
			local point = s_getField(list[i+1],UserVar_AdvanturePoint)
			table.insert(vlist,point)
			s_sendCopyVar(ctype,cid,list[i+1],size,vlist)
			s_sysInfo(list[i+1],"冒险岛积分每1分钟，自动增加1点")
		end
	end
	if (time%86400 >= 12*3600+20*60 and time%86400 < 20*3600) or time%86400 >= 20*3600+20*60 then
		local vlist,row,col = CopySceneInfo_UserAdvantureGetCopyInfoList(cid)
		if vlist ~= nil and #vlist ~= 0 then
			s_sendCopyList(7,cid,0,col,row,vlist)
		end
		for i = 1,table.getn(list), 2 do
			ReturnUserHome(list[i+1],"OnLoopCopyScene_1Sec_UserAdvanture")
		end
	end
end

--刷新客户端战绩表
function CopySceneInfo_UserAdvantureGetCopyInfoList(cid)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	local vlist = {}
	local row = 0
	for i = 1,table.getn(list), 2 do
		if s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],141) > 0 then
			table.insert(vlist,1)	--红方
		elseif s_getbufflevel(SCENE_ENTRY_PLAYER,list[i+1],142) > 0 then
			table.insert(vlist,2)   --蓝方
		else
			table.insert(vlist,3)   --黄方
		end
		table.insert(vlist,list[i+1])
		table.insert(vlist,s_getField(list[i+1],UserVar_AdvanturePoint))
		row = row + 1
	end
	return vlist,row,3
end

--客户端请求发送战绩数据
function CopySceneInfo_UserAdvantureSendCopyInfoList(cid,uid,rtype)
	local vlist,row,col = CopySceneInfo_UserAdvantureGetCopyInfoList(cid)
	if vlist == nil or #vlist == 0 then
		return
	end
	s_sendCopyList(rtype,0,uid,col,row,vlist)
end

------------------------------------------------------------------------------------
local UserAdvantureCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_UserAdvanture_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_UserAdvanture_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_UserAdvanture_OnPlayerLeaveCopyScene(cid,uid)
    end
	function CopySceneInfo_$1:OnPlayerDie(cid,uid,murder,dtype)
		CopySceneInfo_UserAdvanture_OnPlayerDie(cid,uid,murder,dtype)
	end
	function CopySceneInfo_$1:OnPlayerRelive(uid,rtype)
		CopySceneInfo_UserAdvanture_OnPlayerRelive(uid,rtype)
	end
	function OnLoopCopyScene_1Sec_$1(ctype,cid)
		OnLoopCopyScene_1Sec_UserAdvanture(ctype,cid)
	end
	function CopySceneInfo_$1:SendCopyInfoList(cid,uid,rtype)
		CopySceneInfo_UserAdvantureSendCopyInfoList(cid,uid,rtype)
	end
]]
for i = 63,64 do
	RegistetFunction(FormatString(UserAdvantureCopyScene,i))
end
for i = 66,68 do
	RegistetFunction(FormatString(UserAdvantureCopyScene,i))
end
------------------------------------------------------------------------------------
