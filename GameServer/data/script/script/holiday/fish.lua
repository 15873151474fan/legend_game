--周末钓鱼活动
function OnHolidayEvent_Fish(hour,minute)
	local wday = s_getCurTime(TIME_CURWDAYS)
	if wday == 0 and hour == 20 and minute == 0 then
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
			if list[i] ~= 13 then
				local cid = list[i] * 2^8 + 5
				local npcid = s_sysSummon(60625,cid,316,691,1032,1)
				if npcid ~= 0 then
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,1)
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*60*1000)
				end
				s_countryInfo(list[i],"贪吃的小海兽『安古瑞』偷偷溜出海底的普利斯神殿，来到了军乐城钓鱼区的水塘，赶快去给它喂食吧，可以获得丰厚奖励哦！",ChatPos_Sys + ChatPos_Honor)
			end
		end
	end
end
--RegisterHolidayActivityEvent(20,0,"OnHolidayEvent_Fish")

function OnHolidayEvent_Fish_60625(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local dtype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEAD_TYPE)
	if dtype == NPC_DEAD_TYPE_TIME  then
		local country = math.floor(cid / (2^8))
		s_countryInfo(country,"『安古瑞』似乎没有吃饱，很不开心的回家了！",ChatPos_Sys + ChatPos_Honor)
	end
end
--RegisterNpcDeadEvent(60625,"OnHolidayEvent_Fish_60625($1,$2)")
