--宫殿战
--进入副本后区分阵营模式 17-阵营A(红方-攻方) 18-阵营B(蓝方-守方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101 开始时间
--0_102 背旗人
--0_103 结束
--0_104 攻方复活点X坐标
--0_105 攻方复活点Y坐标

--角色数据
ArUser_Gindex           = 1     -- 阵营索引

CopySceneInfo_75 = {
	--阵营BUFF
	groupID = {17,18},
	--初始进入区
	initZone = {
		{ x = 135, y = 215, width = 5, height = 5 }, --红 攻击方传送点坐标
		{ x = 76, y = 31, width = 5, height = 5 }  --蓝 守方复方点以及传送点坐标
	},
}

--用户变量
function CopySceneInfo_75:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_75:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

function CopySceneInfo_75:InitCopyScene(cid)
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
	local curcountry = s_getCountryByScene(cid)
	local npcid = 0
	if curcountry == 2 then
		npcid = s_sysSummon(22985,cid,92,71)	--主神 92,71
	elseif curcountry == 3 then
		npcid = s_sysSummon(22986,cid,92,71)	--主神 92,71
	elseif curcountry == 4 then
		npcid = s_sysSummon(22987,cid,92,71)	--主神 92,71
	elseif curcountry == 5 then
		npcid = s_sysSummon(22988,cid,92,71)	--主神 92,71
	end
	local wlevel = s_getWorldLevel()
	local addhprate = {0,1000,2500,4500,6500,10000,13500,17000,21000,25000}
	if npcid ~= 0 and npcid ~= nil then	-- 主神
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,addhprate[wlevel],10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,addhprate[wlevel],10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,addhprate[wlevel],10)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,curcountry)
		s_addGroup(SCENE_ENTRY_NPC,npcid,18)
	end
	npcid = s_sysSummon(22989,cid,112,58,1060) --复活水晶 112,58
	if npcid ~= 0 and npcid ~= nil then --复活水晶
		s_addbuff(SCENE_ENTRY_NPC,npcid,105,addhprate[wlevel],10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,102,addhprate[wlevel],10)
		s_addbuff(SCENE_ENTRY_NPC,npcid,104,addhprate[wlevel],10)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,curcountry)
		s_addGroup(SCENE_ENTRY_NPC,npcid,18)
	end
	npcid = s_sysSummon(22990,cid,66,204,1060) --复活旗帜A 66,204
	if npcid ~= 0 and npcid ~= nil then -- 复活旗帜A
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,s_getCountryVar(curcountry,1,162))
	end

	npcid = s_sysSummon(22995,cid,136,219)  --攻方传送石
	if npcid ~= 0 and npcid ~= nil then -- 攻方传送石
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,s_getCountryVar(curcountry,1,162))
	end
	npcid = s_sysSummon(22996,cid,73,30)   --守方传送石
	if npcid ~= 0 and npcid ~= nil then  --守方传送石
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,curcountry)
	end

	local soldierpos = {{74,111},{74,114},{74,118},{74,121},
		{77,111},{77,114},{77,118},{77,121},
		{81,111},{81,114},{81,118},{81,121},
		{104,111},{104,114},{104,118},{104,121},
		{108,111},{108,114},{108,118},{108,121},
		{111,111},{111,114},{111,118},{111,121},
		{83,86},{83,90},{83,93},{83,96},
		{86,86},{86,90},{86,93},{86,96},
		{89,86},{89,90},{89,93},{89,96},
		{92,86},{92,90},{92,93},{92,96},
		{95,86},{95,90},{95,93},{95,96},
		{98,86},{98,90},{98,93},{98,96},
		{101,86},{101,90},{101,93},{101,96},--士兵坐标
	}
	for i=1,#soldierpos do
		npcid = s_sysSummon(22992,cid,soldierpos[i][1],soldierpos[i][2],1058)
		if npcid ~= 0 and npcid ~= nil then	-- 士兵
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,addhprate[wlevel],10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,addhprate[wlevel],10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,104,addhprate[wlevel],10)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,curcountry)
			s_addGroup(SCENE_ENTRY_NPC,npcid,18)
		end
	end
	local ladypos = {{60,181},{69,184},{92,183},{97,189},{117,193},{124,187},
		{55,193},{67,193},{88,195},{117,193},{120,181},{127,164},
		{63,158},{67,169},{94,164},{108,138},{120,158},{117,164},
		{55,165},{59,145},{85,159},{104,149},{124,146},{107,176},
		{71,138},{84,138},{91,170},{75,174},{81,161},{78,194},--宫女坐标
	}
	for i=1,math.random(20,30) do
		npcid = s_sysSummon(22993,cid,ladypos[i][1],ladypos[i][2],1057)
		if npcid ~= 0 and npcid ~= nil then -- 宫女
			s_addbuff(SCENE_ENTRY_NPC,npcid,105,addhprate[wlevel],10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,102,addhprate[wlevel],10)
			s_addbuff(SCENE_ENTRY_NPC,npcid,104,addhprate[wlevel],10)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,curcountry)
			s_addGroup(SCENE_ENTRY_NPC,npcid,18)
		end
	end

	local attackcountry = s_getCountryVar(curcountry,1,161)
	if attackcountry ~= nil and attackcountry ~= 0 then
		s_addCountryVar(curcountry,1,91,attackcountry)
		s_addCountryVar(curcountry,1,92,s_getCurTime(TIME_ALLSECONDS))
		local attackname = s_getCountryName(attackcountry)
		if attackname ~= nil and attackname ~= "" then
			s_worldInfo("宫殿战期间，<"..attackname..">强制占领戎装公主，控制了复活点！",ChatPos_Sys + ChatPos_Honor)
		else
			s_worldInfo("宫殿战期间，<未知国家>强制占领戎装公主，控制了复活点！",ChatPos_Sys + ChatPos_Honor)
		end
	end
	--	s_sysSummon(baseid,scene,posx,posy,ai,recycle)
end

function CopySceneInfo_75:OnPlayerIntoCopyScene(cid,uid)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local curcountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	if homeland == curcountry or s_isFriendCountry(homeland,curcountry) == VALUE_OK then
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		self:SetUserVar(uid,ArUser_Gindex,2)
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[2].x,self.initZone[2].y)
	else
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		self:SetUserVar(uid,ArUser_Gindex,1)
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[1].x,self.initZone[1].y)
	end
end

function CopySceneInfo_75:OnPlayerLeaveCopyScene(cid,uid)
	for i=17,18 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	local flaglevel = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,20402)
	if flaglevel ~= 0 and flaglevel ~= nil then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,20402)
	end
end

function CopySceneInfo_75:OnPlayerRelive(uid,rtype)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,17)
	if level > 0 then
		if s_getSceneVar(cid,0,104) ~= 0 and s_getSceneVar(cid,0,105) ~= 0 then
			s_goto(SCENE_ENTRY_PLAYER,uid,s_getSceneVar(cid,0,104),s_getSceneVar(cid,0,105))
		end
	end
	level = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,18)
	if level > 0 then
		s_goto(SCENE_ENTRY_PLAYER,uid,self.initZone[2].x,self.initZone[2].y)
	end
end

function OnLoopCopyScene_1Sec_75(ctype,cid)
	CopySceneInfo_75:Loop_1Sec(ctype,cid)
end
function CopySceneInfo_75:Loop_1Sec(ctype,cid)
	if s_getSceneVar(cid,0,103) == 1 then
		return
	end
	local country = s_getCountryByScene(cid)
	--国战结束
	if s_getCountryVar(country,1,163) ~= 0 then
		--		s_setSceneVar(cid,0,100,1)
		s_addCountryVar(country,1,161,0)
		s_addCountryVar(country,1,162,0)
		s_addCountryVar(country,1,163,0)
		s_setSceneVar(cid,0,103,1)
		local sid = HashSceneID(country,5)
		local npclist = s_getNpcByBaseID(sid, 22984)
		if npclist ~= nil then
			for i=1, #npclist do
				local curcountry = s_getValue(SCENE_ENTRY_NPC, npclist[i], VALUE_TYPE_CURRENT_COUNTRY)
				if curcountry == country then
					s_clearNpc(npclist[i])
				end
			end
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			s_relive(list[i],list[i+1])
		end
		s_clearCopy(cid)
	end
end

function CopySceneInfo_75:GroupInfo(cid,index,msg,info_type)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i = 1,table.getn(list), 2 do
		local gi = self:GetUserVar(list[i+1],ArUser_Gindex)
		if gi == index then
			s_sysInfo(list[i+1],msg,info_type)
		end
	end
end
function CopySceneInfo_75:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	if murder[1] ~= nil then
		s_addVar(murder[1],100,57,s_getVar(murder[1],100,57)+1)
	end
end

------------------------------------------------------------------------------------
