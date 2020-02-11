--老鼠夹
function OnMouseTrapedEvent(etype,eid)
	local master = s_getValue(etype,eid,VALUE_TYPE_MASTER)
	if master ~= 0 and master ~= nil then
		--检查玩家是否在同一张地图
		local map1 = s_getValue(etype,eid,VALUE_TYPE_CURRENT_MAP)
		local map2 = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_CURRENT_MAP)
		if map1 ~= map2 then
			return
		end

		local itemid = 0
		local itemlevel = 0
		local itemnum = 0
		local rand = math.random(1,100)
		if rand <= 40 then
			itemlevel = 3
			itemnum = 1
		elseif rand <= 70 then
			itemlevel = 2
			itemnum = 3
		else
			itemlevel = 2
			itemnum = 2
		end
		if math.random(1,100) < 50 then
			itemid = 27112
		else
			itemid = 27113
		end

		local attr = string.format("2-%u",itemlevel)
		s_addItem(master,itemid,0,itemnum,0,attr,"捕鼠奖励")
		s_sysInfo(master,"被捕鼠夹夹住的地鼠苦苦挣扎吱吱乱叫，最后还是无奈交出了手中的材料",ChatPos_Important)
	end
end
