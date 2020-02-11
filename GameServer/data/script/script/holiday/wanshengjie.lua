--南瓜
function OnHolidayEvent_Boss_60948(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 10 and mday >= 26  then
		outtime = VALUE_OK
	elseif month == 11 and mday <= 4  then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local worldlevel = s_getWorldLevel()
	local npcbase = 60949
	if worldlevel == 1 then
		npcbase = 60948
	else
		npcbase = 60949
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			local cid = list[i] * 2^8 + 7
			local npcid = s_sysSummon(npcbase,cid,479,277,103,1)
			if npcid ~= 0 then
				if worldlevel == 1 then
				--						s_addbuff(SCENE_ENTRY_NPC,npcid,105,,10)
				elseif worldlevel == 2 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,6000,10)
				elseif worldlevel == 3 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,13000,10)
				elseif worldlevel == 4 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
				elseif worldlevel == 5 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,35000,10)
				elseif worldlevel == 6 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,58000,10)
				elseif worldlevel == 7 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,78000,10)
				elseif worldlevel == 8 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,101000,10)
				elseif worldlevel == 9 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,128000,10)
				elseif worldlevel == 10 then
					s_addbuff(SCENE_ENTRY_NPC,npcid,105,162000,10)
				end
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*60*1000)
				s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>携带大量珍宝的巨型南瓜出现在</n><goto pos='479,277' mapid='7'  flagpoint='1'/><n color='GXColorBlueSky'>45级以上勇士可前去击败，稀有的南瓜魔导器，丰厚奖励等着您！</n></p>",ChatPos_Sys + ChatPos_Honor)
			end
		end
	end
end

function OnHolidayEvent_Boss_Dead_60948(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 10 and mday >= 26  then
		outtime = VALUE_OK
	elseif month == 11 and mday <= 4  then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local worldlevel = s_getWorldLevel()
	local npcbase = 60949
	if worldlevel == 1 then
		npcbase = 60948
	else
		npcbase = 60949
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		local cid = list[i] * 2^8 + 7
		if list[i] ~= 13 then
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>本日的巨型南瓜活动已经结束，意犹未尽的勇士们可在次日活动继续参加！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
		local npclist = s_getNpcByBaseID(cid,npcbase)
		if	#npclist ~= 0 then
			for i=1,#npclist do
				s_clearNpc(npclist[i])
			end
		end
	end
end

function OnHolidayEvent_Task_Notice_50014(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 10 and mday >= 26  then
		outtime = VALUE_OK
	elseif month == 11 and mday <= 4  then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>万圣节南瓜狂欢大游行开始了，21级以上角色可寻找光明城</n><goto id='337' mapid='3' flagpoint='0'/><n color='GXColorBlueSky'>报名参加！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
end
--RegisterHolidayActivityEvent(18,01,"OnHolidayEvent_Task_Notice_50014")
--RegisterHolidayActivityEvent(20,01,"OnHolidayEvent_Boss_60948")
--RegisterHolidayActivityEvent(21,31,"OnHolidayEvent_Boss_Dead_60948")
