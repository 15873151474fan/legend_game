--春节
function OnHolidayEvent_spring_snowman(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if month >= 2 then
		if mday > 10 then
			return
		end
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			s_addCountryVar(list[i],10000,4,s_getCountryVar(list[i],10000,4)+350)
		end
	end
end

--RegisterHolidayActivityEvent(00,01,"OnHolidayEvent_spring_snowman")

--年兽
function OnHolidayEvent_Boss_60983(hour,minute)
	if OnHolidayEvent_Boss_Check_60983() ~= VALUE_OK then
		return	VALUE_FAIL
	end
	local worldlevel = s_getWorldLevel()
	local npcbase = 60983
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			local cid = list[i] * 2^8 + 5
			local npcid = s_sysSummon(npcbase,cid,450,704,103,1)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*60*1000)
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>巨型年兽出现在</n><goto pos='450,704' mapid='5'  flagpoint='1'/><n color='GXColorBlueSky'>61级以上勇士可在</n><goto id='5086' mapid='5' flagpoint='1'/><n color='GXColorBlueSky'>处免费领取爆竹，驱赶年兽获得好运大礼！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
end

function OnHolidayEvent_Boss_Dead_60983(hour,minute)
	if OnHolidayEvent_Boss_Check_60983() ~= VALUE_OK then
		return	VALUE_FAIL
	end
	local worldlevel = s_getWorldLevel()
	local npcbase = 60983
	local npcbase2 = 60984
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		local cid = list[i] * 2^8 + 5
		if list[i] ~= 13 then
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>本日的年兽活动已经结束，意犹未尽的勇士们可在下次活动时间继续参加！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
		local npclist = s_getNpcByBaseID(cid,npcbase)
		if	#npclist ~= 0 then
			for i=1,#npclist do
				s_clearNpc(npclist[i])
			end
		end
		local npclist2 = s_getNpcByBaseID(cid,npcbase2)
		if	#npclist2 ~= 0 then
			for i=1,#npclist2 do
				s_clearNpc(npclist2[i])
			end
		end
	end
end

--RegisterHolidayActivityEvent(20,00,"OnHolidayEvent_Boss_60983")
--RegisterHolidayActivityEvent(21,00,"OnHolidayEvent_Boss_Dead_60983")

--年兽血变化
function OnNpcHpChange_60983(npcid, originhp, curhp)
	if originhp <= curhp then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
	if cid == 0 or cid == nil then
		return
	end
	if CheckHpSubEvent(npcid,10,originhp,curhp) == VALUE_OK then
		for i = 1,10 do
			local npcboss = s_sysSummon(60984,cid,math.random(448,452),math.random(702,706),103,1)
			s_setValue(SCENE_ENTRY_NPC,npcboss,VALUE_TYPE_LIFE,60*60*1000)
		end
	end
	if CheckHpSubEvent(npcid,40,originhp,curhp) == VALUE_OK then
		for i = 1,10 do
			local npcboss = s_sysSummon(60984,cid,math.random(448,452),math.random(702,706),103,1)
			s_setValue(SCENE_ENTRY_NPC,npcboss,VALUE_TYPE_LIFE,60*60*1000)
		end
	end
	if CheckHpSubEvent(npcid,70,originhp,curhp) == VALUE_OK then
		for i = 1,10 do
			local npcboss = s_sysSummon(60984,cid,math.random(448,452),math.random(702,706),103,1)
			s_setValue(SCENE_ENTRY_NPC,npcboss,VALUE_TYPE_LIFE,60*60*1000)
		end
	end
end

function OnHolidayEvent_Boss_Check_60983()
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if month == 1 and (mday == 29 or mday == 30) then
		return 	VALUE_OK
	end
	if month == 2 and (mday == 7 or mday == 8) then
		return 	VALUE_OK
	end
	return VALUE_FAIL
end
