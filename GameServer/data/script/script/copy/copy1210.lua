
--帮会驻地
CopySceneInfo_224 =
{
	DayHourTable = {10,12,14,16,18,20,22},
	monster_contri = {[20001] = {20},[20002] = {20},[20003] = {20},[20004] = {20},[20005] = {20},[20006] = {20},[20007] = {20},[20008] = {20},[20009] = {20},[20010] = {20},[20011] = {20},[20012] = {30},[20013] = {30},[20014] = {30},[20015] = {30},[20016] = {30},[20017] = {30},[20018] = {30},[20019] = {30},[20020] = {30},[20021] = {30},[20022] = {30}},
	monster_active = {[20001] = {50},[20002] = {50},[20003] = {50},[20004] = {50},[20005] = {50},[20006] = {50},[20007] = {50},[20008] = {50},[20009] = {50},[20010] = {50},[20011] = {50},[20012] = {90},[20013] = {90},[20014] = {90},[20015] = {90},[20016] = {90},[20017] = {90},[20018] = {90},[20019] = {90},[20020] = {90},[20021] = {90},[20022] = {90}},
}

function ParseClanRobInfo(clanrobinfo, minfoTable)
	if clanrobinfo == nil or clanrobinfo == "" then
		s_error("帮会强盗配置信息错误")
		return
	end

	for str in string.gmatch(clanrobinfo, "%d+,%d+") do
		local baseid,num = string.match(str, "(%d+),(%d+)")
		local tmp = {}
		tmp.baseid = baseid
		tmp.num = num
		table.insert(minfoTable, tmp)
	end

end

function GetClanRobInfo(days,minfoTable)
	if days == nil or days < 1 then
		return
	end

	local flag = 0
	if days >= 1 and days < 3 then
		flag = 1
	elseif days >= 3 and days < 21 then
		flag = 3
	elseif days >= 21 and days < 10 then
		flag = 21
	elseif days >= 10 and days < 14 then
		flag = 10
	elseif days >= 14 and days < 99999 then
		flag = 14
	elseif days >= 99999 then
		flag = 99999
	end


	if flag ~= 0 then
		for k,v in pairs(ManorRobLuaDataBase) do
			if type(v) == "table" and v.day == flag then
				ParseClanRobInfo(v.monsterinfo, minfoTable)
				return
			end
		end
	end
end


function CreateClanRobNpc(minfoTable,cid)
	if minfoTable == nil or table.getn(minfoTable) == 0 then
		return
	end

	local temp_days = {}
	local open_days = {}
	for k,v in pairs(ManorRobLuaDataBase) do
		if type(v) == "table" and v.day == 1 then
			temp_days[v.wday] = true
		end
	end
	if temp_days == nil then
		s_debug("强盗没有有效的日期")
		return
	end

	for open_day,_ in pairs(temp_days) do
		local index = 2
		local remainder = 0
		while open_day > 0 do
			open_day,remainder = math.modf(open_day / 2)
			if remainder > 0.1 then
				open_days[index] = true
				s_trace("开启index = "..index)
			end
			index = index + 1
		end
	end

	local curday = s_getCurTime(5)
	s_trace("curday"..curday)
	if open_days[curday] ~= true then
		s_debug("今天没有强盗产生")
		return
	end
	s_trace("生产强盗")

	local npcidlist = {}
	for i=1,table.getn(minfoTable) do
		for j=1,minfoTable[i].num do
			local npcid = s_sysSummon(minfoTable[i].baseid,cid,math.random(16,45),math.random(16,32),103,1);
			if npcid ~= nil and npcid ~=0 then
				s_setSceneVar(cid,1,5,s_getSceneVar(cid,1,5) + 1)
				table.insert(npcidlist,npcid)
			end
		end
	end
	local msg = "帮会强盗来袭，请勇士速回帮会驻地清理！"
	s_sendClanMsg(cid,msg)
end
--[[
function CopySceneInfo_224:InitCopyScene(cid)
end

function CopySceneInfo_224:OnPlayerIntoCopyScene(cid)
    --设置倒计时
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
end
]]--
function CopySceneInfo_224:clearNpc(cid)
	local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list),2 do
		s_clearNpc(list[i+1])
	end
	s_setSceneVar(cid,1,5,0)
end

function OnLoopCopyScene_1Sec_224(ctype,cid)
	local curtime = s_getCurTime(TIME_DAYSEC)
	local createtime = s_getClanCreateDay(cid)
	for _,var in pairs(CopySceneInfo_224.DayHourTable) do
		if curtime == var*3600 then
			if s_getSceneVar(cid,1,5) > 100 then
				return
			end
			if createtime ~= 1 then
				return
			end
			local days = s_openServiceDay()
			local minfoTable = {}
			--GetClanRobInfo(days,minfoTable)
			--CreateClanRobNpc(minfoTable,cid)
--			local callback_15min_ID = RegisterTimeTriggerCallBack(15 * 60 * 1000,"ClanBase_15Min_CallBack")
--			s_addWorldVar(224,10,callback_15min_ID)
		end
	end
	if curtime == 24*3600 - 1 then
		CopySceneInfo_224:clearNpc(cid)
	end
	if curtime == 1 then
		local npcid1 = s_sysSummon(190,cid,47,15,100,1);
		local npcid2 = s_sysSummon(191,cid,10,29,100,1);
		local npcid3 = s_sysSummon(192,cid,18,7,100,1);
	end
end

--创建副本
function ClanIntoCopy(uid, clanid, mapid)
	s_trace("进入帮会副本......")
	s_copyteamIntoCopy(uid,clanid,mapid,224)
end

--[[销毁副本
function CopySceneInfo_224:FinalCopyScene(sid)
    TreasureCopyHistory = TreasureCopyHistory or {}
    for k,v in pairs(TreasureCopyHistory) do
        if v == sid then
            TreasureCopyHistory[k] = nil
        end
    end

    --清空副本npc
    for k,v in pairs (npcidlist1) do
        s_clearNpc(v[k])
    end

    for k,v in pairs (npcidlist2) do
        s_clearNpc(v[k])
    end

    --清空副本倒计时
    s_setSceneVar(sid,1,1,0)
end
]]
function OnLoopCopyScene_15Min_224(ctype,cid)
	local fund = 0
	local boom = 0
	s_trace("强盗剩余数量"..s_getSceneVar(cid,1,5))
		if s_getSceneVar(cid,1,5) <= 0 then
			return
		end
		for k,v in pairs(ManorRobLuaDataBase) do
			if type(v) == "table" and v.day == 1 then
				fund = v.reduceFund
				boom = v.reduceBoom
			end
		end

		local msg = "帮会强盗正在掠夺帮会资金和繁荣度，请尽快回驻地清理！"
		s_sendClanMsg(cid,msg)

		s_reduceClanFund(cid,fund,boom)
end

function CopySceneInfo_224:CopySceneInfo_224_monster_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
	local contri = 0
	local active = 0
	if self.monster_active[baseid] ~= nil then
		active = self.monster_active[baseid][1]
	end
	if self.monster_contri[baseid] ~= nil then
		contri = self.monster_contri[baseid][1]
	end
	if active == 0 or contri == 0 then
		return;
	end
	s_setVar(uid,240,10,s_getVar(uid,240,10) + 1)
	if(s_getVar(uid,240,10) > 32) then
		s_sysInfo(uid,"当日击杀帮会强盗获得贡献值已达上限",ChatPos_Tips)
		s_copyInfo(cid,"增加帮会活跃度:"..active,ChatPos_Honor)
		s_addClanActive(uid,active,0)
		s_setSceneVar(cid,1,5,s_getSceneVar(cid,1,5) - 1)
		if(s_getSceneVar(cid ,1 ,5) <= 0) then
			s_setSceneVar(cid,1,5,0)
		end
		return;
	end

	s_copyInfo(cid,"增加帮会活跃度:"..active,ChatPos_Honor)
--	s_copyInfo(cid,"增加个人贡献度:"..contri,ChatPos_Honor)
	s_addClanActive(uid,active,contri)
	s_setSceneVar(cid,1,5,s_getSceneVar(cid,1,5) - 1)
	if(s_getSceneVar(cid ,1 ,5) <= 0) then
		s_setSceneVar(cid,1,5,0)
	end
	s_addDailyTargetTime(uid,47,1)
end

for i=1,22 do
	RegisterNpcDeadEvent(20000+i,"CopySceneInfo_224:CopySceneInfo_224_monster_death_callback($1,$2)")
end

--local callback_15min_ID = RegisterTimeTriggerCallBack(15 * 60 *1000,"ClanRob_15Min_CallBack");
--s_addWorldVar(224,10,callback_15min_ID)

