--领地副本

-- 副本列表
ManorCopyList = ManorCopyList or {}


-- 副本默认有6个，编号1~6
ManorCopy =
{
	-- 副本脚本
	scriptid = 1206,

	-- 副本类型：key-副本编号，value-副本类型
	copytypes =
	{
		[1] = CopySceneType_Manor1,
		[2] = CopySceneType_Manor2,
		[3] = CopySceneType_Manor3,
		[4] = CopySceneType_Manor4,
		[5] = CopySceneType_Manor5,
		[6] = CopySceneType_Manor6,
	},
}

-- 创建领地副本
function CreateManorCopy(index, clanid, clanname, treelevel, clan1, clan2, clan3)
	s_trace("CreateManorCopy 创建领地参数：index" .. index .. "，clanid：" .. clanid .. "，treelevel：" .. treelevel .. "clan1:" .. clan1 .. ",clan2:" .. clan2 .. ",clan3:" .. clan3)
	local self = ManorCopy
	ManorCopyList[index] = nil
	local copydb = ManorCopyDataBase.query(index)
	if copydb == nil then
		s_error("创建领地副本失败！未找到副本数据！ index：" .. index .. "，clanid：" .. clanid .. "，treelevel：" .. treelevel)
		return 0
	end

	-- 默认神树等级
	if clanid == 0 then
		treelevel = copydb.level
	end

	local treedb = ManorTreeDataBase.query(treelevel)
	if treedb == nil then
		s_error("创建领地副本失败！未找到神树数据！ index：" .. index .. "，clanid：" .. clanid .. "，treelevel：" .. treelevel)
		return 0
	end

	local copytype = self.copytypes[index]
	if copytype == nil then
		s_error("创建领地副本失败！未找到副本类型！ index：" .. index .. "，clanid：" .. clanid .. "，treelevel：" .. treelevel)
		return 0
	end

	-- 创建副本
	local recycletime = 50*60*1000
	local recycletimenouser = 50*60*1000
	local countryid = 3
	local sceneid = s_createManorCopy(countryid, copydb.map, copytype, self.scriptid, recycletime, recycletimenouser)
	if sceneid == nil or sceneid == 0 then
		s_error("创建领地副本失败！！！ index：" .. index .. "，clanid：" .. clanid .. "，treelevel：" .. treelevel)
		return 0
	end

	s_trace("创建领地副本成功 index：" .. index .. "，sceneid：" .. sceneid)

	-- 记录副本信息
	local copyinfo =
	{
		index = index,
		sceneid = sceneid,
		clanid = clanid,
		clanname = clanname,
		over = false,
		clans = {},
		clanids = {},
		treenpcid = 0,
	}
	if clan1 ~= 0 then
		table.insert(copyinfo.clanids, clan1)
		local name = s_getClanName(clan1) or ""
		copyinfo.clans[clan1] = { name = name, hurt = 0 }
	end
	if clan2 ~= 0 then
		table.insert(copyinfo.clanids, clan2)
		local name = s_getClanName(clan2) or ""
		copyinfo.clans[clan2] = { name = name, hurt = 0 }
	end
	if clan3 ~= 0 then
		table.insert(copyinfo.clanids, clan3)
		local name = s_getClanName(clan3) or ""
		copyinfo.clans[clan3] = { name = name, hurt = 0 }
	end

	ManorCopyList[index] = copyinfo

	-- 初始化怪物
	local treenpcid = CopySceneInfo_1206:InitManorMonster(sceneid, clanid, copydb, treedb)
	if treenpcid ~= nil and treenpcid ~= 0 then
		copyinfo.treenpcid = treenpcid
	end
	return sceneid
end

-- 请求进入副本
function OnRequestIntoManorCopy(userid, clanid, sceneid)
	s_trace("请求进入领地 OnRequestIntoManorCopy(userid, clanid, sceneid):" .. userid .. "," .. clanid .. "," .. sceneid)
	local self = ManorCopy
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_sysInfo(userid, "副本未开启!")
		return
	end
	if copyinfo.over == true then
		s_sysInfo(userid, "副本已结束！")
		return
	end

	-- 检查这个帮会能否进入领地
	if clanid ~= copyinfo.clanid then
		local findclan = false
		if #copyinfo.clanids ~= 0 then
			for _,v in ipairs(copyinfo.clanids) do
				if v == clanid then
					findclan = true
					break
				end
			end
		end
		if findclan == false then
			s_error("OnRequestIntoManorCopy 玩家请求进入的领地中没有这帮会：clanid:" .. clanid .. ",sceneid:" .. sceneid .. ",index:" .. copyinfo.index)
			s_sysInfo(userid, "帮会不符合进入条件！")
			return
		end
	end

	local copydb = ManorCopyDataBase.query(copyinfo.index)
	if copydb == nil then
		s_error("OnRequestIntoManorCopy 未找到副本数据库！！？？？？？？ index：" .. copyinfo.index)
		return
	end

	s_trace("进入领地 OnRequestIntoManorCopy(userid, clanid, sceneid, index):" .. userid .. "," .. clanid .. "," .. sceneid ..  "," .. copyinfo.index)

	if clanid == copyinfo.clanid then
		s_gocopymap(SCENE_ENTRY_PLAYER, userid, copyinfo.sceneid, copydb.guardx, copydb.guardy)
	else
		s_gocopymap(SCENE_ENTRY_PLAYER, userid, copyinfo.sceneid, copydb.attackx, copydb.attacky)
	end	
end

-- 找到副本信息
function ManorCopy:GetCopyInfo(sceneid)
	for _, info in pairs(ManorCopyList) do
		if info.sceneid == sceneid then
			return info
		end
	end
end

-- 神树受到伤害
function OnManorTreeHurt(npcbaseid, sceneid, clanid, hurt)
	local self = ManorCopy
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("ManorCopy:OnManorTreeHurt(sceneid,clanid,hurt) 未找到副本：" .. sceneid .. "," .. clanid)
		return
	end

	local copydb = ManorCopyDataBase.query(copyinfo.index)
	if copydb == nil then
		s_error("OnManorTreeHurt 未找到副本数据库！！？？？？？？ index：" .. copyinfo.index)
		return
	end

	-- 非树、非boss
	if npcbaseid ~= copydb.tree and npcbaseid ~= copydb.boss then
		return
	end

	local clans = copyinfo.clans
	if clans[clanid] == nil then
		s_error("ManorCopy:OnManorTreeHurt(sceneid,clanid,hurt) 未找到公会伤害数据：" .. sceneid .. "," .. clanid)
		return
	else
		clans[clanid].hurt = clans[clanid].hurt + hurt
	end

	-- s_trace("神树受到伤害 OnManorTreeHurt index:" .. copyinfo.index .. ", clanid:" .. clanid .. ", hurt:" .. clans[clanid].hurt)
	self:SynHurtRank(copyinfo, 0)
end

-- 同步神树伤害排名
local tempmanorrank = {}
function ManorCopy:SynHurtRank(copyinfo, userid, clear)
	local num = #copyinfo.clanids
	if num == 0 then
		if clear == true then
			s_sendCopyZoneTwo(copyinfo.sceneid,"",userid)
		else
			s_trace("ManorCopy:SynHurtRank(copyinfo, userid) 没有帮会来攻打 index:" .. copyinfo.index .. ", userid:" .. userid)
		end
		return
	end
	for i = 1, 3 do
		if i <= num then
			local clanid = copyinfo.clanids[i]
			tempmanorrank[i*2 - 1] = copyinfo.clans[clanid].name
			tempmanorrank[i*2] = copyinfo.clans[clanid].hurt
		else
			tempmanorrank[i*2 - 1] = nil
			tempmanorrank[i*2] = nil
		end
	end
	local str = table.concat(tempmanorrank, ",")
	s_sendCopyZoneTwo(copyinfo.sceneid,str,userid)
	-- s_trace("伤害排名 s_sendCopyZoneTwo(sceneid,str,userid):" .. copyinfo.sceneid .. "==" .. str .. "==" .. userid)
end

-- 发送神树伤害排名给一个玩家
function ManorCopy:SendHurtRank(sceneid, userid)
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("ManorCopy:SendHurtRank(sceneid,userid) 未找到副本：" .. sceneid .. "," .. userid)
		return
	end
	self:SynHurtRank(copyinfo, userid)
end

-- 副本信息：占领帮会名，剩余时间
function ManorCopy:SendCopyInfo(sceneid, userid)
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("ManorCopy:SendCopyInfo(sceneid,userid) 未找到副本：" .. sceneid .. "," .. userid)
		return
	end
	local str = nil
	if copyinfo.clanid ~= 0 then
		str = copyinfo.clanname .. ","
	else
		str = " ,"
	end

	local seconds = s_getEventTime(Relation_World,0,EventManor,EVENT_TIME_REM)
	str = str .. seconds
	s_sendCopyZoneOne(sceneid, str, userid)
	s_trace("副本时间 s_sendCopyZoneOne(sceneid, str, userid):" .. sceneid .. "==" .. str .. "==" .. userid)
end

-- 副本结束时间到了
function ManorCopy:ManorCopyTimeOver(sceneid)
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("ManorCopy:ManorCopyTimeOver(sceneid) 未找到副本：" .. sceneid)
		return
	end

	if copyinfo.over == true then
		return
	end
	copyinfo.over = true

	-- 将结果发给 Session
	self:SendWinnerClanToSession(copyinfo.index, copyinfo.clanid)

	-- 通知客户端副本结束
	if copyinfo.clanid == 0 then
		s_sendCopyZoneThree(sceneid," ")
		s_trace("ManorCopyTimeOver 副本结束 s_sendCopyZoneThree(sceneid,clanname) 无帮会胜利")
	else
		s_sendCopyZoneThree(sceneid,copyinfo.clanname)
		s_trace("ManorCopyTimeOver 副本结束 s_sendCopyZoneThree(sceneid,clanname):" .. copyinfo.clanname)
	end
	self:ClearOver()
end

-- 清除副本信息
function ManorCopy:ClearOver()
	for index, copyinfo in pairs(ManorCopyList) do
		if copyinfo.over == true then
			s_trace("ManorCopy:Clear(sceneid) index:" .. tostring(copyinfo.index))
			ManorCopyList[index] = nil
		end
	end
end

function ManorCopy:SendWinnerClanToSession(index, clanid)
	s_sendWinnerClanToSession(index, clanid)
end

-- 领地神树被占领
function ManorCopy:OnTreeDie(userid, sceneid)
	s_trace("function ManorCopy:OnTreeDie(userid,sceneid):" .. tostring(userid) .. "," .. tostring(sceneid))
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("ManorCopy:OnTreeDie(userid,sceneid) 未找到副本sceneid:" .. tostring(sceneid))
		return
	end
	copyinfo.over = true

	s_trace("function ManorCopy:OnTreeDie(sceneid) index:" .. copyinfo.index)

	-- 胜利帮会
	local winnerclanid = 0
	local maxhurt = 0
	local temphurt = 0
	for _, clanid in ipairs(copyinfo.clanids) do
		temphurt = copyinfo.clans[clanid].hurt
		if temphurt > maxhurt then
			maxhurt = temphurt
			winnerclanid = clanid
		end
	end

	-- 将结果发给 Session
	self:SendWinnerClanToSession(copyinfo.index, winnerclanid)

	-- 通知客户端结束
	if winnerclanid == 0 then
		s_sendCopyZoneThree(sceneid," ")
		s_error("OnTreeDie 副本结束 s_sendCopyZoneThree(sceneid,clanname) 无帮会胜利！ userid:" .. tostring(userid))
	else
		s_sendCopyZoneThree(sceneid,copyinfo.clans[winnerclanid].name)
		s_trace("OnTreeDie 副本结束 s_sendCopyZoneThree(sceneid,clanname) clanname:" .. copyinfo.clans[winnerclanid].name)
	end
end

-- 清除副本信息
function ManorCopy:OnCopyClear(sceneid)
	for index, copyinfo in pairs(ManorCopyList) do
		if copyinfo.sceneid == sceneid then
			s_trace("ManorCopy:OnCopyClear(sceneid) index:" .. copyinfo.index)
			ManorCopyList[index] = nil
			return
		end
	end
end

-- 帮会即将解散
function OnManorClanDissmissing(clanid)
	local self = ManorCopy
	for index, copyinfo in pairs(ManorCopyList) do
		if copyinfo.clanid == clanid then
			-- 设置神树帮会为0
			s_setValue(SCENE_ENTRY_NPC, copyinfo.treenpcid, VALUE_TYPE_CLAN, 0)
			-- 设置副本信息
			copyinfo.clanid = 0
			copyinfo.clanname = nil
			-- 将帮会玩家传出副本
			self:RemoveClan(copyinfo.sceneid, clanid)
			-- 更新地图名
			self:SendCopyInfo(copyinfo.sceneid, 0)
		else
			for i, v in ipairs(copyinfo.clanids) do
				if v == clanid then
					-- 设置副本信息
					copyinfo.clans[clanid] = nil
					table.remove(copyinfo.clanids, i)
					-- 将帮会玩家传出副本
					self:RemoveClan(copyinfo.sceneid, clanid)
					-- 更新伤害排名
					self:SynHurtRank(copyinfo, 0, true)
					break
				end
			end
		end
	end
end

-- 将副本中指定帮会的玩家传出副本
function ManorCopy:RemoveClan(sceneid, clanid)
	s_removeManorClanUser(sceneid, clanid)
end

-- 获得复活点坐标
function ManorCopy:GetRelivePos(sceneid, userid)
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("GetRelivePos(sceneid) 未找到副本：" .. tostring(sceneid))
		return nil
	end

	local copydb = ManorCopyDataBase.query(copyinfo.index)
	if copydb == nil then
		s_error("GetRelivePos(sceneid) 未找到副本数据 index：" .. tostring(copyinfo.index))
		return nil
	end

	if s_getClanID(userid) == copyinfo.clanid then
		return { x = copydb.guardx, y = copydb.guardy }
	else
		return { x = copydb.attackx, y = copydb.attacky }
	end
end

function CanAttackInManor(sceneid,clan1,clan2)
	local self = ManorCopy
	local copyinfo = self:GetCopyInfo(sceneid)
	if copyinfo == nil then
		s_error("CanAttackInManor(sceneid,clan1,clan2) 未找到副本：" .. sceneid .. "," .. clan1 .. "," .. clan2)
		return 0
	end
	if clan1 ~= copyinfo.clanid and clan2 ~= copyinfo.clanid then
		return 0
	end
	return 1
end

-- 帮会神树摘取果实
function ManorTreePick(uid, awarditem)
	if awarditem == nil or awarditem == "" then
		s_debugUser(uid, "摘取帮会神树时,参数错误 awarditem="..awarditem)
		return 0
	end

	local itemlist = loadstring("return "..awarditem)()
	if itemlist == nil or table.getn(itemlist) == 0 then
		s_debugUser(uid, "摘取帮会神树时,参数错误 awarditem="..awarditem)
		return 0
	end

	for k, v in ipairs(itemlist) do
		GetGiftReward(uid, v)
	end

	return 1
end

