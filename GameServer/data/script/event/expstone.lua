--经验石
function reqExpStone(uid)
	local userlevel = s_getUserLevel(uid)
	--[[if userlevel < 60 then
		return
	end]]--
	local list = {}
	local allnum = 5000000
	local expnum = 0
	local itemlist = {}
	local rownum = 0
	itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		for i, m in ipairs(itemlist) do
			expnum = s_getItemValue(uid,m,Item_Attribute_expstone)			
			if expnum > 5000000 then
				expnum = 5000000
			end
			table.insert(list, m)
			table.insert(list, expnum)
			table.insert(list, allnum)
			s_debugUser(uid,">>>>出售矿石m = "..m)
			s_debugUser(uid,">>>>发送每个经验石经验expnum = "..expnum)
			rownum = rownum + 1
		end
	end
	--s_debugUser(uid,">>>>经验变动 rownum = "..rownum)
	s_sendexpnum(uid,rownum,list)
	local itemlist = {}
        itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
        if itemlist ~= nil and table.getn(itemlist) > 0 then
                for i, m in ipairs(itemlist) do
                        local expnum = s_getItemValue(uid,m,Item_Attribute_expstone)
                        if expnum >= 5000000 then
            			sendexptype(uid)                    
                        end
                end
        end	
end
--经验变动
function expstonechange(uid,exp)
	local itemlist = {}
        itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
        if itemlist ~= nil and table.getn(itemlist) > 0 then
                for i, m in ipairs(itemlist) do
                        local expnum = s_getItemValue(uid,m,Item_Attribute_expstone)
                        if expnum >= 5000000 then
                                sendexptype(uid)
                        end
                end
        end	
	local userlevel = s_getUserLevel(uid)
	--[[if userlevel < 60 then
		--s_sysInfo(uid, "等级不够，请升级到60级再来", ChatPos_Tips)
		return
	end]]--
	--s_setVar(uid,140,87,0)
	if exp == 0 then
		return
	end
	--s_debugUser(uid,">>>>经验变动 exp = "..exp)
	local thisidnum = 0
	thisidnum = s_getItemNumByBaseID(uid,5101,0)
	if thisidnum == 0 then
		return
	end
	local tempexp = 0
	local VIPnum = 0
	VIPnum = s_getVIPLevel(uid)
	if VIPnum == 0 then
		tempexp = 10 * exp	
	elseif VIPnum == 1 then
		tempexp = 10 * exp * 1.3
	elseif VIPnum == 2 then
		tempexp = 10 * exp * 1.6
	elseif VIPnum == 3 then
		tempexp = 10 * exp * 2
	elseif VIPnum == 4 then
		tempexp = 10 * exp * 2.5
	elseif VIPnum == 5 then
		tempexp = 10 * exp * 3
	elseif VIPnum == 6 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 7 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 8 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 9 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 10 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 11 then
		tempexp = 10 * exp * 4
	elseif VIPnum == 12 then
		tempexp = 10 * exp * 4
	end

	local targetid = s_getVar(uid,140,87)	
	s_debugUser(uid,">>>>>>>>>>经验变动目标id = "..targetid)
	--[[if targetid ~= 0 then
		s_debugUser(uid,">>>>经验变动 判断是否进入")
		local expcount = s_getItemValue(uid,targetid,Item_Attribute_expstone)
			s_debugUser(uid,">>>>>>>>>>经验变动总经验 expcount = "..expcount)
		if expcount >= 5000 then
			s_setVar(uid,140,87,0)
			targetid = 0
		end
	end]]--
	local itemlist = {}
	itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
	local k = 0
	if itemlist ~= nil and table.getn(itemlist) > 0 then
		local numlist = {}
		for i, m in ipairs(itemlist) do
			local expcount = s_getItemValue(uid,m,Item_Attribute_expstone)
			if expcount < 5000000 then
				table.insert(numlist, m)
			end
		end		


		--[[for i, m in ipairs(itemlist) do
			if m == targetid then
				local expcount = s_getItemValue(uid,targetid,Item_Attribute_expstone)
				s_debugUser(uid,">>>>>>>>>>经验变动总经验 expcount = "..expcount)
				if expcount >= 5000 then
					s_setVar(uid,140,87,0)
					targetid = 0 
				end
			else
			end
		end]]--

		
		if itemlist ~= nil and table.getn(numlist) > 0 then
			for i, m in ipairs(numlist) do
				if m > k then
					k= m
				end	
			end
		end
		
		if k == 0 then
			return
		end
		if targetid == 0 then
			targetid = k
			s_setItemValue(uid,k,Item_Attribute_expstone,tempexp)
			s_setVar(uid,140,87,k)
			local expcount = s_getItemValue(uid,k,Item_Attribute_expstone)
			if expcount >= 5000000 then
				s_setVar(uid,140,87,0)
			end
		else
			local tm = tonumber(s_getItemValue(uid,targetid,Item_Attribute_expstone))
			if tm == 0 then
				s_setItemValue(uid,targetid,Item_Attribute_expstone,tempexp)
				local expcount = s_getItemValue(uid,targetid,Item_Attribute_expstone)
				if expcount >= 5000000 then
					s_setVar(uid,140,87,0)
				end
			else
				s_setItemValue(uid,targetid,Item_Attribute_expstone,tempexp + tm)
				local expcount = s_getItemValue(uid,targetid,Item_Attribute_expstone)
				if expcount >= 5000000 then
					s_setVar(uid,140,87,0)
				end
			end
		end
	
		--[[if targetid == 0 then
			s_setItemValue(uid,k,Item_Attribute_expstone,tempexp)
			s_setVar(uid,140,87,k)	
		else
			local tm = tonumber(s_getItemValue(uid,targetid,Item_Attribute_expstone))
			if tm == 0 then
				s_setItemValue(uid,targetid,Item_Attribute_expstone,tempexp)	
			else
				s_setItemValue(uid,targetid,Item_Attribute_expstone,tempexp + tm)
			end
		end]]--

	end
	local sssd = s_getItemValue(uid,targetid,Item_Attribute_expstone)
	s_debugUser(uid,">>>>物品充了经验值多少  sssd="..sssd)
	s_debugUser(uid,">>>>脚本经验变动  targetid="..targetid)
	s_debugUser(uid,">>>>脚本经验变动  k="..k)
	reqExpStone(uid)
end
function GetExpStoneNum(uid)
	--local usenum = 0
	local list = {}
	usenum1 = s_getVar(uid,140,86)
	usenum2 = s_getVar(uid,140,88)
	usenum3 = s_getVar(uid,140,89)
	usenum4 = s_getVar(uid,140,90)
	if usenum1 == 0 then
		local smoneynum = 0
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum1 == 1 then
		local smoneynum = 0
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum1 == 2 then
		local smoneynum = 0
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        else
		local smoneynum = 0
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        end	

	if usenum2 == 0 then
		local smoneynum = 0
		local sVIPnum = 1
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum2 == 1 then
		local smoneynum = 0
		local sVIPnum = 2
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum2 == 2 then
		local smoneynum = 0
		local sVIPnum = 4
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        else
		local smoneynum = 10
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        end	
	if usenum3 == 0 then
		local smoneynum = 50
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum3 == 1 then
		local smoneynum = 50
		local sVIPnum = 2
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum3 == 2 then
		local smoneynum = 50
		local sVIPnum = 2
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        else
		local smoneynum = 50
		local sVIPnum = 2
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        end	
	if usenum4 == 0 then
		local smoneynum = 98
		local sVIPnum = 0
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum4 == 1 then
		local smoneynum = 98
		local sVIPnum = 3
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        elseif usenum4 == 2 then
		local smoneynum = 98
		local sVIPnum = 4
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        else
		local smoneynum = 98
		local sVIPnum = 4
		table.insert(list, smoneynum)
		table.insert(list, sVIPnum)
        end	
	local allnum = 5000000
	s_SendUseStoneNum(uid,allnum,list)	
end
function sendexptype(uid)
	local snum = 0
	local stypeid = 0
	local starg = 5101
	local itemlist = {}
        itemlist = s_getItemListByBaseID(uid, 5101, PACKAGETYPE_MAIN)
        if itemlist ~= nil and table.getn(itemlist) > 0 then
                for i, m in ipairs(itemlist) do
                        local expnum = s_getItemValue(uid,m,Item_Attribute_expstone)
                        if expnum >= 5000000 then
                      		snum = 1
          			stypeid = m
                        end
                end
        end
	s_debugUser(uid,">>>>返回客户端满满1 snum = "..snum)
	s_debugUser(uid,">>>>返回客户端满满2 stypeid = "..stypeid)	
	s_sendexpnumtype(uid,snum,stypeid,starg)
end

