-- 5 军乐城
-- 6 遗忘沙漠

local todayCountry = { 2, 4, 3 }

function OnHolidayEvent_christmas_event(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 12 and mday >= 24 and mday <= 26 then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local npcbase = 206
	local list = pack(s_getCountryList())
	local countrylist = {}
	for i=1,#list do
		if list[i] ~= 13 then
			table.insert(countrylist,list[i])
		end
	end
	country = todayCountry[mday % 3 + 1]
	if country == nil then country = 2 s_debug("活动X国家读取不正确") end
	local maplist = {5,7}
	local mapid = maplist[math.random(1,#maplist)]
	local cid = country * 2^8 + mapid
	local posx = math.random(1,700)
	local posy = math.random(1,700)
	local npcid = s_sysSummon(npcbase,cid,posx,posy,100,1)
	local cname = s_getCountryName(country)
	local mname = s_getMapName(mapid)
	s_addCountryVar(13,10000,7,country)
	s_addCountryVar(13,10000,8,mapid)
	for i=1,#countrylist do
		if 1 == s_isCountryInServer(countrylist[i]) then
			s_countryInfo(countrylist[i],"<p><n color='GXColorBlueSky'>携带大量礼物的圣诞老人出现在"..cname .."的"..mname.."地图，快去找他吧！！</n></p>",ChatPos_Sys + ChatPos_Honor + ChatPos_Pop)
		end
	end
end

function OnHolidayEvent_christmas_msg(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 12 and mday >= 24 and mday <= 26 then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	if s_getCountryVar(13,10000,7)~= 0 then
		local cname = s_getCountryName(s_getCountryVar(13,10000,7))
		local mname = s_getMapName(s_getCountryVar(13,10000,8))
		s_worldInfo("<p><n color='GXColorBlueSky'>携带大量礼物的圣诞老人正在"..cname .."的"..mname.."地图发放礼物，快去找他吧！！</n></p>",ChatPos_Sys + ChatPos_Honor + ChatPos_Pop)
	end
end

function OnHolidayEvent_christmas_remove(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 12 and mday >= 24 and mday <= 26 then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local list = pack(s_getCountryList())
	local maplist = {5,7}
	local npcbase = 206
	for i = 1,table.getn(list) do
		for j = 1,#maplist do
			local cid = list[i] * 2^8 + maplist[j]
			if list[i] ~= 13 then
			--s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>本日的魔兽活动已经结束，意犹未尽的少侠们可在下次活动时间继续参加！</n></p>",ChatPos_Sys + ChatPos_Honor)
			end
			local npclist = s_getNpcByBaseID(cid,npcbase)
			if	#npclist ~= 0 then
				for i=1,#npclist do
					s_clearNpc(npclist[i])
				end
			end
		end
	end
	s_worldInfo("<p><n color='GXColorBlueSky'>本次圣诞老人的祝福活动已经结束咯，圣诞老人离开了，请期待下次他的降临吧！</n></p>",ChatPos_Sys + ChatPos_Honor + ChatPos_Pop)
end
--活动开始
--RegisterHolidayActivityEvent(20,00,"OnHolidayEvent_christmas_event")
--活动每十分钟给提示
--RegisterHolidayActivityEvent(20,10,"OnHolidayEvent_christmas_msg")
--RegisterHolidayActivityEvent(20,20,"OnHolidayEvent_christmas_msg")
--RegisterHolidayActivityEvent(20,30,"OnHolidayEvent_christmas_msg")
--RegisterHolidayActivityEvent(20,40,"OnHolidayEvent_christmas_msg")
--RegisterHolidayActivityEvent(20,50,"OnHolidayEvent_christmas_msg")
--活动结束
--RegisterHolidayActivityEvent(21,00,"OnHolidayEvent_christmas_remove")
