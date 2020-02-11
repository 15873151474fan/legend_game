function OnUseItemEvent_Fashion(uid,itemid)
	local fas = FashionExplainDataBase.query(itemid)
	if fas == nil then
		s_error("时装分解找不到配置项,uid="..uid..",baseid="..itemid)
		return 0;
	end
	
	local randnum = math.random(1, 1000000)
	local result = {}
	local bfind = false
	for _,v in pairs(fas) do
        --判断是否是奖励字段
       		local _,ret = string.find(v,":")
        	if ret ~= nil then
        	    result = splitstring(v,":")
        	    if result == v then
        	        return false
        	    end
	
        	    --是否在概率内
        	    if randnum >= tonumber(result[1]) and randnum <= tonumber(result[2]) then
        	        bfind = true
        	        break
        	    end
	
        	end
    	end
	if bfind  == false then
        	s_debugUser(uid,"未匹配到概率")
        	return false
    	end
        s_debugUser(uid,"奖励道具id"..fas.destItemId)
	local id = s_addItem(uid,tonumber(result[4]),3,tonumber(result[5]),0,"1-1","分解时装获得")
	return true
end
