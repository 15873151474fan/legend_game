--boss刷新
--世界BOSS三头龙
function OnHolidayEvent_Boss_Notice_20018(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_worldInfo("<p><n>【系】超级BOSS</n><n color='GXColorTurp'>三头龙王凯利克</n><n>冲破了遗迹的封印，将在10分钟后于中立区</n><goto mapid=\"8\" x=\"108\" y=\"705\" cid=\"13\" flagpoint=\"0\" /><n>处刷新！</n></p>",ChatPos_Sys)
	end
end
function OnHolidayEvent_Boss_20018(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local worldlevel = s_getWorldLevel()
	if s_isCountryInServer(13) == VALUE_OK then
		local cid = 13 * 2^8 + 8
		local npcid = s_sysSummon(20018,cid,108,705,103,1)
		if npcid ~= 0 then
			if worldlevel == 1 then
			--						s_addbuff(SCENE_ENTRY_NPC,npcid,105,,10)
			elseif worldlevel == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,2000,10)
			elseif worldlevel == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
			elseif worldlevel == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,16000,10)
			elseif worldlevel == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
			elseif worldlevel == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,36000,10)
			elseif worldlevel == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,54000,10)
			elseif worldlevel == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,75000,10)
			elseif worldlevel == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,100000,10)
			elseif worldlevel == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,130000,10)
			end
			s_worldInfo("<p><n>超级BOSS</n><n color='GXColorTurp'>三头龙王凯利克</n><n>冲破了遗迹的封印，出现在了中立区</n><goto mapid=\"8\" x=\"108\" y=\"705\" cid=\"13\" flagpoint=\"0\" /><n>！请各位勇士前去击杀！</n></p>",10)
		end
	end
end

function OnHolidayEvent_Boss_Notice2_20018(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local cid = 13 * 2^8 + 8
	local npcid = s_getNpcByBaseID(cid,20018)
	if #npcid == 0 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_mapInfo(13,8,"<p><n color=\"GXColorBlueSky\">【系】遗迹的封印已经渐渐愈合，</n><n color=\"GXColorBlueSky\">超级BOSS</n><n color='GXColorTurp'>三头龙王凯利克</n><n color=\"GXColorBlueSky\">将在30分钟后于离开奥丁大陆。</n></p>",ChatPos_Sys)
	end
end

function OnHolidayEvent_Boss_Dead_20018(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local cid = 13 * 2^8 + 8
	local npcid = s_getNpcByBaseID(cid,20018)
	if #npcid == 0 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_mapInfo(13,8,"<p><n color=\"GXColorBlueSky\">【系】遗迹的封印已经重新愈合，</n><n color=\"GXColorBlueSky\">世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">离开了奥丁大陆，明日21:00将再次出现。</n></p>",ChatPos_Sys)
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] == 13 then
			local cid = list[i] * 2^8 + 8
			local npclist = s_getNpcByBaseID(cid,20018)
			for i=1,#npclist do
				s_clearNpc(npclist[i])
			end
		end
	end
end
--RegisterHolidayActivityEvent(15,29,"OnHolidayEvent_Boss_20018")
--RegisterHolidayActivityEvent(15,20,"OnHolidayEvent_Boss_Notice_20018")
--RegisterHolidayActivityEvent(18,30,"OnHolidayEvent_Boss_Notice2_20018")
--RegisterHolidayActivityEvent(19,00,"OnHolidayEvent_Boss_Dead_20018")
--世界boss黑魔
function OnHolidayEvent_Boss_Notice_20500(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_worldInfo("<p><n color=\"GXColorBlueSky\">【系】世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">打开了时空之门，将在10分钟后于中立区</n><goto mapid=\"8\" x=\"423\" y=\"671\" cid=\"13\" flagpoint=\"0\" /><n color=\"GXColorBlueSky\">处刷新！</n></p>",ChatPos_Sys)
	end
	--[[local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
	if list[i] ~= 13 then
	s_worldInfo("<p><n color=\"GXColorBlueSky\">世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">打开了时空之门，将在10分钟后于中立区</n><goto mapid=\"8\" x=\"423\" y=\"671\" cid=\"13\" flagpoint=\"0\" /><n color=\"GXColorBlueSky\">处刷新！</n></p>",10)
	s_countryInfo(list[i],"<p><n color=\"GXColorBlueSky\">世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">打开了时空之门，将在10分钟后于中立区</n><goto mapid=\"8\" x=\"423\" y=\"671\" cid=\"13\" flagpoint=\"0\" /><n color=\"GXColorBlueSky\">处刷新！</n></p>",ChatPos_Sys)
	end
	end--]]
end
function OnHolidayEvent_Boss_20500(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local worldlevel = s_getWorldLevel()
	if s_isCountryInServer(13) == VALUE_OK then
		local cid = 13 * 2^8 + 8
		local npcid = s_sysSummon(20500,cid,423,671,103,1)
		if npcid ~= 0 then
			if worldlevel == 1 then
			--						s_addbuff(SCENE_ENTRY_NPC,npcid,105,,10)
			elseif worldlevel == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,2000,10)
			elseif worldlevel == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
			elseif worldlevel == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,16000,10)
			elseif worldlevel == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
			elseif worldlevel == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,36000,10)
			elseif worldlevel == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,54000,10)
			elseif worldlevel == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,75000,10)
			elseif worldlevel == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,100000,10)
			elseif worldlevel == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,130000,10)
			end
			s_worldInfo("<p><n>世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n>穿越了时空之门出现在了中立区</n><goto mapid=\"8\" x=\"423\" y=\"671\" cid=\"13\" flagpoint=\"0\" /><n>！请各位勇士前去击杀，</n><n color='GXColorGreen'>银币、宝石、装备、BOSS卡片等你来拿！</n><goto mapid=\"8\" x=\"605\" y=\"656\" cid=\"13\" flagpoint=\"0\" /></p>",10)
		end
	end
end

function OnHolidayEvent_Boss_Notice2_20500(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local cid = 13 * 2^8 + 8
	local npcid = s_getNpcByBaseID(cid,20500)
	if #npcid == 0 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_mapInfo(13,8,"<p><n color=\"GXColorBlueSky\">【系】时空之门的封印渐渐愈合，</n><n color=\"GXColorBlueSky\">世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">将在30分钟后于离开奥丁大陆。</n></p>",ChatPos_Sys)
	end
end

function OnHolidayEvent_Boss_Dead_20500(hour,minute)
	if s_getWorldLevel() < 3 then
		return
	end
	local cid = 13 * 2^8 + 8
	local npcid = s_getNpcByBaseID(cid,20500)
	if #npcid == 0 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then --只从中立区发布任务，避免各个服务器重复发布
		s_mapInfo(13,8,"<p><n color=\"GXColorBlueSky\">【系】时空之门已经重新封印，</n><n color=\"GXColorBlueSky\">世界BOSS</n><n color='GXColorTurp'>黑魔摩罗多姆</n><n color=\"GXColorBlueSky\">离开了奥丁大陆，明日21:00将再次出现。</n></p>",ChatPos_Sys)
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] == 13 then
			local cid = list[i] * 2^8 + 8
			local npclist = s_getNpcByBaseID(cid,20500)
			for i=1,#npclist do
				s_clearNpc(npclist[i])
			end
		end
	end
end
--RegisterHolidayActivityEvent(21,29,"OnHolidayEvent_Boss_20500")
--RegisterHolidayActivityEvent(21,20,"OnHolidayEvent_Boss_Notice_20500")
--RegisterHolidayActivityEvent(23,30,"OnHolidayEvent_Boss_Notice2_20500")
--RegisterHolidayActivityEvent(23,59,"OnHolidayEvent_Boss_Dead_20500")

--中立boss
MiddleBossInfo =
{
	--每个整点刷新boss个数
	bossnum = 4,
	refresh =
	{
		--		{bossnum,{{bossid,几率,人类进程,区域},...}}
		--人类进程1
		{
		},
		--人类进程2
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{2,{{20012,50,2,21},{20013,50,2,24},{20012,100,2,23},{20013,100,2,22}}},--12
			{},{},{},{},--13--16
			{2,{{20012,100,2,21},{20013,50,2,22},{20012,50,2,24},{20013,100,2,23}}},--17
			{},{},--18--19
			{2,{{20012,50,2,21},{20013,100,2,24},{20012,50,2,23},{20013,100,2,22}}},--20
			{},{},{} --21--23
		},
		--人类进程3
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{3,{{20012,100,2,21},{20013,100,2,24},{20014,50,3,23},{20014,100,3,22}}},--12
			{},{},{},{},--13--16
			{3,{{20012,100,2,21},{20013,100,2,22},{20014,50,3,24},{20014,100,3,23}}},--17
			{},{},--18--19
			{3,{{20012,100,2,21},{20013,100,2,24},{20014,50,3,23},{20014,100,3,22}}},--20
			{},{},{} --21--23
		},
		--人类进程4
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程5
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程6
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程7
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程8
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程9
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
		--人类进程10
		{
			{},{},{},{},{},{},{},{},{},{},{},{},--0-11
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--12
			{},{},{},{},--13--16
			{4,{{20012,100,2,21},{20013,100,2,22},{20014,100,3,24},{20300,100,4,23}}},--17
			{},{},--18--19
			{4,{{20012,100,2,21},{20013,100,2,24},{20014,100,3,23},{20300,100,4,22}}},--20
			{},{},{} --21--23
		},
	-- 人类进程TODO
	},
	zone =
	{
		{21,{x1 = 89, x2 = 163, y1 = 70, y2 = 211 }},--凤凰之地
		{22,{x1 = 544, x2 = 705, y1 = 629, y2 = 720 }},--比蒙战丘
		{23,{x1 = 60, x2 = 230, y1 = 570, y2 = 724 }},--巨龙遗迹
		{24,{x1 = 535, x2 = 705, y1 = 166, y2 = 340 }}--虎神废墟
	},
	boss =
	{
		--{人类进程,boss}
		{1,{20012}},
		{2,{20012,20013}},
		{3,{20012,20013,20014}},
		{4,{20012,20013,20014,20300}},
		{5,{20012,20013,20014,20300}},
		{6,{20012,20013,20014,20300}},
		{7,{20012,20013,20014,20300}},
		{8,{20012,20013,20014,20300}},
		{9,{20012,20013,20014,20300}},
		{10,{20012,20013,20014,20300}},
	},
}

function OnMiddleBossRefresh(hour,minute)
	if s_isCountryInServer(13) ~= VALUE_OK then
		return
	end
	--根据人类进程，清除上一小时的中立boss
	local cid = 13 * 2^8 + 8
	local npclist = s_getNpcByBaseID(cid,20012)
	for i=1,#npclist do
		s_clearNpc(npclist[i])
	end
	npclist = s_getNpcByBaseID(cid,20013)
	for i=1,#npclist do
		s_clearNpc(npclist[i])
	end
	npclist = s_getNpcByBaseID(cid,20014)
	for i=1,#npclist do
		s_clearNpc(npclist[i])
	end
	npclist = s_getNpcByBaseID(cid,20300)
	for i=1,#npclist do
		s_clearNpc(npclist[i])
	end
	s_clearMiddleBoss()
	--刷新上小时设置的boss
	local worldlevel = s_getWorldLevel()
	local list = s_getMiddleRefreshBoss()
	for i=1,table.getn(list), 3 do
		for j=1,table.getn(MiddleBossInfo.zone) do
			if MiddleBossInfo.zone[j][1] == list[i+2] then
				local x = MiddleBossInfo.zone[j][2].x1 + math.random(1,MiddleBossInfo.zone[j][2].x2 -MiddleBossInfo.zone[j][2].x1)
				local y = MiddleBossInfo.zone[j][2].y1 + math.random(1,MiddleBossInfo.zone[j][2].y2 -MiddleBossInfo.zone[j][2].y1)
				local npcid = s_sysSummon(list[i+1],cid,x,y)
				if npcid ~= 0 then
					if worldlevel == 1 then
					--						s_addbuff(SCENE_ENTRY_NPC,npcid,105,,10)
					elseif worldlevel == 2 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,2000,10)
					elseif worldlevel == 3 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,8000,10)
					elseif worldlevel == 4 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,16000,10)
					elseif worldlevel == 5 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
					elseif worldlevel == 6 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,36000,10)
					elseif worldlevel == 7 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,54000,10)
					elseif worldlevel == 8 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,75000,10)
					elseif worldlevel == 9 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,100000,10)
					elseif worldlevel == 10 then
						s_addbuff(SCENE_ENTRY_NPC,npcid,105,130000,10)
					end
					--设置该boss已刷新，设置该boss thisID
					s_setMiddleBossThisID(list[i], npcid)
				else
				end
				break;
			end
		end
	end
	--注册下小时要刷新的boss
	local bossnum = 0
	if MiddleBossInfo.refresh[worldlevel] ~= nil and MiddleBossInfo.refresh[worldlevel][hour+1] ~= nil then
		bossnum = MiddleBossInfo.refresh[worldlevel][hour+1][1]
	end
	if bossnum == 0 then
		return
	end
	local nextboss = {}
	--	local zoneid = {21,22,23,24}
	if MiddleBossInfo.refresh[worldlevel] ~= nil and MiddleBossInfo.refresh[worldlevel][hour+1] ~= nil
		and MiddleBossInfo.refresh[worldlevel][hour+1][2] ~= nil then
		for i=1,table.getn(MiddleBossInfo.refresh[worldlevel][hour+1][2]) do
			local rand = math.random(1,100)
			if rand <= MiddleBossInfo.refresh[worldlevel][hour+1][2][i][2] and
				MiddleBossInfo.refresh[worldlevel][hour+1][2][i][3] <= worldlevel then
				table.insert(nextboss,MiddleBossInfo.refresh[worldlevel][hour+1][2][i][1])
				table.insert(nextboss,MiddleBossInfo.refresh[worldlevel][hour+1][2][i][4])
			end
			if table.getn(nextboss) == bossnum * 2 then
				break
			end
		end
	end
	if nextboss ~= nil and table.getn(nextboss) ~= 0 then
		for k=table.getn(nextboss)/2,bossnum do
			local zoneid = {21,22,23,24}
			for i=1,table.getn(MiddleBossInfo.boss) do
				if MiddleBossInfo.boss[i][1] == worldlevel then
					local rand = math.random(1,table.getn(MiddleBossInfo.boss[i][2]))
					table.insert(nextboss, MiddleBossInfo.boss[i][2][rand])
					rand = math.random(1,table.getn(zoneid))
					table.insert(nextboss, zoneid[rand])
				end
				if table.getn(nextboss) == bossnum * 2 then
					break
				end
			end
			if table.getn(nextboss) == bossnum * 2 then
				break
			end
		end
		s_setNextMiddleBossList(table.getn(nextboss)/2,nextboss)
	end
end

--RegisterHolidayActivityEvent(0,1,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(1,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(2,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(3,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(4,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(5,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(6,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(7,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(8,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(9,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(10,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(11,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(12,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(13,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(14,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(15,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(16,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(17,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(18,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(19,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(20,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(21,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(22,0,"OnMiddleBossRefresh")
--RegisterHolidayActivityEvent(23,0,"OnMiddleBossRefresh")




--圣诞boss
function christmasBossRefresh()
    local year = s_getCurTime(TIME_CURYEARS)+1900
    local month = s_getCurTime(TIME_CURMONTHS)+1
    local mday = s_getCurTime(TIME_CURMDAYS)
    s_debug("year=%s,month=%s,mday=%s",year,month,mday)
    if (year == 2016 and month==12 and mday==31) or ((year == 2017 and month==1 and (mday==1 or mday==2))) then
        --11:00~13:00点，19:00~23:00刷新boss
        local sceneid = HashSceneID(3,3)
        if s_isNpcDead(sceneid,4800,0) == VALUE_FAIL then
            s_debug("圣诞boss准备刷新时发现之前的boss还没有死亡")
            return;
        end
        if s_sysSummon(4800, sceneid, 47, 27, 103, 1) ~= VALUE_FAIL then
			s_worldInfo("[#9]元旦活动[-]：[#5]元旦巨兽[-]携带现金出现在中都[#3]47,27[-]，请勇士们速前往击杀，赢得奖励！", ChatPos_Sys + ChatPos_Important)
            s_sendBossNotice(107)
		end

    end
end


--如果0点boss还没死，就清除boss, 一般是不可能打不死的
function killChristmasBoss()
    local year = s_getCurTime(TIME_CURYEARS)+1900
    local month = s_getCurTime(TIME_CURMONTHS)+1
    local mday = s_getCurTime(TIME_CURMDAYS)
    if year == 2017 and month == 1 and  mday == 2 then
        --11:00~13:00点，19:00~23:00刷新boss
        local sceneid = HashSceneID(3,3)
        s_clearNpcByBaseId(sceneid,4800);
    end
end


RegisterHolidayActivityEvent(9,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(10,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(12,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(13,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(18,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(19,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(22,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(23,0,"christmasBossRefresh")
RegisterHolidayActivityEvent(0,1,"killChristmasBoss")
