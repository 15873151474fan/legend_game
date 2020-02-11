function Ondavinci_Notice(hour,minute)
	if s_getWorldLevel() < 2 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then
		s_worldInfo("<p><n color='GXColorBlueSky'>【系】军乐城的</n><goto id='60789' mapid='5' flagpoint='1'/><n color='GXColorBlueSky'>结束了一晚的冥想，每个勇士都可以到他那里接取今天的</n><book bookid='70132' text='“达芬奇的秘密”任务'/><n>！</n></p>",ChatPos_Sys)
	end
end

function Ondavinci_Notice2(hour,minute)
	if s_getWorldLevel() < 2 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then
		s_worldInfo("<p><n color='GXColorBlueSky'>【系】军乐城的</n><goto id='60789' mapid='5' flagpoint='1'/><n color='GXColorBlueSky'>正在寻找能够破解宇宙奥秘的人，每个勇士在23:00前都可以到他那里接取今天的</n><book bookid='70132' text='“达芬奇的秘密”任务'/><n>！</n></p>",ChatPos_Sys)
	end
end

function Ondavinci_Notice3(hour,minute)
	if s_getWorldLevel() < 2 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK then
		s_worldInfo("<p><n color='GXColorBlueSky'>【系】军乐城的</n><goto id='60789' mapid='5' flagpoint='1'/><n color='GXColorBlueSky'>即将返回神秘的虚空进行冥想，每个勇士在23:00前都可以到他那里接取今天的</n><book bookid='70132' text='“达芬奇的秘密”任务'/><n>！</n></p>",ChatPos_Sys)
	end
end



RegisterHolidayActivityEvent(10,00,"Ondavinci_Notice")
RegisterHolidayActivityEvent(18,00,"Ondavinci_Notice2")
RegisterHolidayActivityEvent(22,00,"Ondavinci_Notice3")
