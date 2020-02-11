--购买十字镐
function BuyPicker(uid)
	if s_removeMoney(uid,MoneyType_Gold,20,"购买十字镐") ~= VALUE_OK then
        	s_sysInfo(uid,"元宝不足，不能购买",ChatPos_Tips)
        	return 0;
    	end
	local surplusnum = s_getVar(uid,140,81)
	s_setVar(uid,140,81,300 + surplusnum)
	s_debugUser(uid,">>>>>>>十字镐剩余数 surplusnum="..surplusnum)
	s_debugUser(uid,">>>>>>>买十字镐")
end

--十字镐剩余次数
function PickerNum(uid)
	if s_getVar(uid,140,81) ~=0 then
		local surplus = s_getVar(uid,140,81)
		--return surplus
		s_sendPickerNum(uid,surplus)
	end
	--s_sendPickerNum(uid,surplus)
	--s_debugUser(uid,">>>>>>>十字镐剩余数 surplus="..surplus)
	s_debugUser(uid,">>>>>>>十字镐剩余数")
end

--卖矿石
function SellMineralStone(uid,typeid,num)
	local Mineraltype = MineralRecoveryDataBase.query(typeid)
	if Mineraltype == nil then
		s_debugUser(uid,"卖矿石未找到配表MineralRecoveryDataBase")
		return
	end
	local moneynum = Mineraltype.gold
	s_addMoneyMe(uid,MoneyType_MoneyTicket, num * moneynum,"卖矿石获得")
	s_debugUser(uid,">>>>>>>卖矿石")
end

--请求矿石数
function reqMineralNum(uid)
	local getnum1,getnum2,getnum3,getnum4,getnum5,getnum6,getpickernum,allmoney,packnum = 0,0,0,0,0,0,0,0,0 
	local list = {}
	--getnum1 = s_getVar(uid,140,82)
	--getnum2 = s_getVar(uid,140,83)
	--getnum3 = s_getVar(uid,140,84)
	--getnum4 = s_getVar(uid,140,85)
	--getnum5 = s_getVar(uid,140,86)
	--getnum6 = s_getVar(uid,140,87)
	local getnum1 = s_getItemNumByBaseID(uid,10408,0)
	local getnum2 = s_getItemNumByBaseID(uid,10409,0)
	local getnum3 = s_getItemNumByBaseID(uid,10410,0)
	local getnum4 = s_getItemNumByBaseID(uid,10411,0)
	local getnum5 = s_getItemNumByBaseID(uid,10412,0)
	local getnum6 = s_getItemNumByBaseID(uid,10413,0)
	getpickernum = s_getVar(uid,140,81)
	local Mineraltype1 = MineralRecoveryDataBase.query(1)
	local Mineraltype2 = MineralRecoveryDataBase.query(2)
	local Mineraltype3 = MineralRecoveryDataBase.query(3)
	local Mineraltype4 = MineralRecoveryDataBase.query(4)
	local Mineraltype5 = MineralRecoveryDataBase.query(5)
	local Mineraltype6 = MineralRecoveryDataBase.query(6)
	if Mineraltype1 == nil then
		s_debugUser(uid,"未找到配表MineralRecoveryDataBase")
		return
	end
	local allmoney = getnum1 * Mineraltype1.gold + getnum2 * Mineraltype2.gold + getnum3 * Mineraltype3.gold + getnum4 * Mineraltype4.gold + getnum5 * Mineraltype5.gold + getnum6 * Mineraltype6.gold
	local packnum = s_getAutoPackSpace(uid)
	s_debugUser(uid,">>>>>>>请求矿石 packnum ="..packnum)
	s_debugUser(uid,">>>>>>>请求矿石 getnum1 ="..getnum1)
	table.insert(list, getnum1)
	table.insert(list, getnum2)
	table.insert(list, getnum3)
	table.insert(list, getnum4)
	table.insert(list, getnum5)
	table.insert(list, getnum6)
	s_reqMineralNum(uid,getpickernum,allmoney,packnum,list)
end

--回收矿石
function SellAllMineral(uid)
        --local getnum1 = s_getVar(uid,140,82)
        --local getnum2 = s_getVar(uid,140,83)
        --local getnum3 = s_getVar(uid,140,84)
        --local getnum4 = s_getVar(uid,140,85)
        --local getnum5 = s_getVar(uid,140,86)
        --local getnum6 = s_getVar(uid,140,87)
	local getnum1 = s_getItemNumByBaseID(uid,10408,0)
	local getnum2 = s_getItemNumByBaseID(uid,10409,0)
	local getnum3 = s_getItemNumByBaseID(uid,10410,0)
	local getnum4 = s_getItemNumByBaseID(uid,10411,0)
	local getnum5 = s_getItemNumByBaseID(uid,10412,0)
	local getnum6 = s_getItemNumByBaseID(uid,10413,0)	


        local Mineraltype1 = MineralRecoveryDataBase.query(1)
        local Mineraltype2 = MineralRecoveryDataBase.query(2)
        local Mineraltype3 = MineralRecoveryDataBase.query(3)
        local Mineraltype4 = MineralRecoveryDataBase.query(4)
        local Mineraltype5 = MineralRecoveryDataBase.query(5)
        local Mineraltype6 = MineralRecoveryDataBase.query(6)
        local allmoney = 0
	s_debugUser(uid,">>>>回收矿石getnum2 = "..getnum2)
	allmoney = getnum1 * Mineraltype1.gold + getnum2 * Mineraltype2.gold + getnum3 * Mineraltype3.gold + getnum4 * Mineraltype4.gold + getnum5 * Mineraltype5.gold + getnum6 * Mineraltype6.gold
	s_debugUser(uid,">>>>回收矿石allmoney前 allmoney = "..allmoney)	
	s_debugUser(uid,">>>>回收矿石getnum1 = "..getnum1)
	if allmoney ~= 0 then
		if getnum1 ~= 0 then
			if s_deleteItemByBaseID(uid,10408,getnum1,"回收矿石删除") ~= VALUE_OK then
				ree = s_deleteItemByBaseID(uid,10408,getnum1,"回收矿石删除",0)
				 s_debugUser(uid,">>>>回收矿石ree = "..ree)
				s_debugUser(uid,">>>>删除矿石失败")
				return
			end
		end
		if getnum2 ~= 0 then
			if s_deleteItemByBaseID(uid,10409,getnum2,"回收矿石删除") ~= VALUE_OK then
				return
			end
		end
		if getnum3 ~= 0 then
			if s_deleteItemByBaseID(uid,10410,getnum3,"回收矿石删除") ~= VALUE_OK then
				return
			end
		end
		if getnum4 ~= 0 then
			if s_deleteItemByBaseID(uid,10411,getnum4,"回收矿石删除") ~= VALUE_OK then
				return
			end
		end
		if getnum5 ~= 0 then
			if s_deleteItemByBaseID(uid,10412,getnum5,"回收矿石删除") ~= VALUE_OK then
				return
			end
		end
		if getnum6 ~= 0 then
			if s_deleteItemByBaseID(uid,10413,getnum6,"回收矿石删除") ~= VALUE_OK then
				return
			end
		end	
	else
		return
	end
	s_addMoneyMe(uid,MoneyType_MoneyTicket, allmoney,"卖矿石获得")	
	s_debugUser(uid,">>>>回收矿石allmoney = "..allmoney)
	--s_setVar(uid,140,82,0)
	--s_setVar(uid,140,83,0)
	--s_setVar(uid,140,84,0)
	--s_setVar(uid,140,85,0)
	--s_setVar(uid,140,86,0)
	--s_setVar(uid,140,87,0)
end

--采矿石
function GetMineralStone(uid,mapId)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local gettime = s_getVar(uid,140,83)
	if gettime > curtime - 5 then
		return
	end
	s_setVar(uid,140,83,curtime)
	
	local userlevel = s_getUserLevel(uid)
	if userlevel < 80 then
		s_sysInfo(uid, "等级不够，请升级到80级再来", ChatPos_Tips)
		return 
	end
	local viplevel = s_getVIPLevel(uid)
	local getnum = s_getVar(uid,140,80)
	local nNum1 = MineralDataBase.query(1)
	local usermapid = s_getUserMapId(uid)	
	local nNum2 = MineralDataBase.query(2)
	local nNum3 = MineralDataBase.query(3)
	local nNum4 = MineralDataBase.query(4)
	local nNum5 = MineralDataBase.query(5)
	local nNum6 = MineralDataBase.query(6)
	local nNum7 = MineralDataBase.query(7)
	local nNum8 = MineralDataBase.query(8)
	local nNum9 = MineralDataBase.query(9)
	local stonetype = 0
	local Mineralid = nil
	s_debugUser(uid,">>>>每日采矿石次数 getnum"..getnum)
	s_debugUser(uid,">>>>采矿石 usermapid"..usermapid)	
	local randnum = math.random(1,10000)
	if getnum <= nNum1.time then
		Mineralid = nNum1
		s_debugUser(uid,">>>>采矿石 111111111")	
	elseif getnum > nNum1.time and getnum <= nNum2.time then
		Mineralid = nNum2
		s_debugUser(uid,">>>>采矿石 2222222")
	elseif getnum > nNum2.time and getnum <= nNum3.time then
		Mineralid = nNum3
	elseif getnum > nNum3.time and getnum <= nNum4.time then
		Mineralid = nNum4
	elseif getnum > nNum4.time and getnum <= nNum5.time then
		Mineralid = nNum5
	elseif getnum > nNum5.time and getnum <= nNum6.time then
		Mineralid = nNum6
	elseif getnum > nNum6.time and getnum <= nNum7.time then
		Mineralid = nNum7
	elseif getnum > nNum7.time and getnum <= nNum8.time then
		Mineralid = nNum8
	elseif getnum > nNum8.time then
		Mineralid = nNum9
	end
	if  Mineralid == nil then
		s_debugUser(uid,"没有MineralDataBase表")
		return
	end

	
	if randnum <= Mineralid.mineral1 then
		stonetype = 1
	elseif randnum > Mineralid.mineral1 and randnum <= Mineralid.mineral1 + Mineralid.mineral2 then
		stonetype = 2
	elseif randnum > Mineralid.mineral1 + Mineralid.mineral2 and randnum <= Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 then
		stonetype = 3
	elseif randnum > Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 and randnum <= Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 + Mineralid.mineral4 then
		stonetype = 4
	elseif randnum > Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 + Mineralid.mineral4 and randnum <= Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 + Mineralid.mineral4 + Mineralid.mineral5 then
		stonetype = 5
	elseif randnum > Mineralid.mineral1 + Mineralid.mineral2 + Mineralid.mineral3 + Mineralid.mineral4 + Mineralid.mineral5 and randnum <= 10000 then
		stonetype = 6
	end	
	
	local stonenum = 1
	
	if s_getAutoPackSpace(uid) < 1 then
		if viplevel >= 3 then
			if usermapid == 230 and s_getVar(uid,140,81) ~=0 then
				s_setVar(uid,140,81,s_getVar(uid,140,81) - 1)
				stonenum = 3
			end
			SellMineralStone(uid,stonetype,stonenum)
			SellAllMineral(uid)
		else
			s_sysInfo(uid,"您的背包已满,请清理背包",ChatPos_Tips)
			return
		end
	else
		if usermapid == 230 and s_getVar(uid,140,81) ~=0 then
			s_setVar(uid,140,81,s_getVar(uid,140,81) - 1)
			stonenum = 3
		end
		s_debugUser(uid,">>>>>>>>mineral 碎石矿石 stonenum =="..stonenum)
		if stonetype == 1 then
			s_addItem(uid,10408,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,82,s_getVar(uid,140,82) + stonenum)
		elseif stonetype ==2 then
			s_addItem(uid,10409,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,83,s_getVar(uid,140,83) + stonenum)
		elseif stonetype ==3 then
			s_addItem(uid,10410,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,84,s_getVar(uid,140,84) + stonenum)
		elseif stonetype ==4 then
			s_addItem(uid,10411,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,85,s_getVar(uid,140,85) + stonenum)
		elseif stonetype ==5 then
			s_addItem(uid,10412,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,86,s_getVar(uid,140,86) + stonenum)
		elseif stonetype ==6 then
			s_addItem(uid,10413,3,stonenum,0,"1-1","采矿奖励")
			--s_setVar(uid,140,87,s_getVar(uid,140,87) + stonenum)
    		end
	end
	local desss = s_getVar(uid,140,82)
	s_debugUser(uid,">>>>>>>>mineral 碎石矿石=="..desss)
	local dess = s_getVar(uid,140,83)
	s_debugUser(uid,">>>>>>>>mineral 铁矿石=="..dess)
	s_debugUser(uid,">>>>>>>>mineral 矿石类型=="..stonetype)
	s_debugUser(uid,">>>>>>>>mineral 矿石数量=="..stonenum)	
	s_debugUser(uid,">>>>>>>>mineral mapId=="..mapId)
	s_setVar(uid,140,80,s_getVar(uid,140,80) + 1)
	s_addDailyTargetTime(uid, enumDailySubTargetType_Mineral, 1)
end

