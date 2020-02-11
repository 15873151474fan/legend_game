--万圣节
function OnHolidayEvent_Ghost(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 10 and mday >= 29 then
		outtime = VALUE_OK
	end
	if month == 11 and mday <= 4 then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			local cid = list[i] * 2^8 + 3
			for j = 1,300 do
				local posx = 383 + math.random(-80,80)
				local posy = 362 + math.random(-80,80)
				local npcid = s_sysSummon(21003,cid,posx,posy,107,1)
				if npcid ~= 0 then
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
				end
			end
			local cid1 = list[i] * 2^8 + 5
			for j = 1,300 do
				local posx = 380 + math.random(-80,80)
				local posy = 620 + math.random(-80,80)
				local npcid = s_sysSummon(21003,cid1,posx,posy,107,1)
				if npcid ~= 0 then
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
				end
			end
			local cid2 = list[i] * 2^8 + 7
			if hour == 20 and minute == 0 then --大南瓜
				local npcid = s_sysSummon(20019,cid2,559,284)
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,30*60*1000)
				s_countryInfo(list[i],"巨型南瓜已经降临本国遗忘沙漠[559,284],它携带大量宝物，赶快前往击败",ChatPos_Pop)
			end
		end
	end
end
--RegisterHolidayActivityEvent(19,0,"OnHolidayEvent_Ghost")
--RegisterHolidayActivityEvent(19,20,"OnHolidayEvent_Ghost")
--RegisterHolidayActivityEvent(19,40,"OnHolidayEvent_Ghost")
--RegisterHolidayActivityEvent(20,0,"OnHolidayEvent_Ghost")
--RegisterHolidayActivityEvent(20,20,"OnHolidayEvent_Ghost")
--RegisterHolidayActivityEvent(20,40,"OnHolidayEvent_Ghost")

function OnHolidayEvent_Ghost_dead21003(uid,npcid)
	if uid == nil or uid == 0 then return end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)

	local items = {31226,31227,31228}
	for i = 1,math.random(3,8) do
		local item = items[math.random(1,table.getn(items))]
		s_addSceneItem(item,1,cid,posx,posy,0,"")
	end
end
--RegisterMyNpcDeadEvent(21003,"OnHolidayEvent_Ghost_dead21003($1,$2)")
