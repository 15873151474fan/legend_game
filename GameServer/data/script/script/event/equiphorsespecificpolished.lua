
local EquipHorsewashattr = 
{
["addhp"] = 1001,
["addsp"] = 1002,
["minpdam"] = 1003,
["maxpdam"] = 1004,
["minmdam"] = 1005,
["maxmdam"] = 1006,
["mintdam"] = 1007,
["maxtdam"] = 1008,
["minpdef"] = 1009,
["maxpdef"] = 1010,
["minmdef"] = 1011,
["maxmdef"] = 1012,
["luckyvalue"] = 1013,
["luckyper"] = 1014,
["luckydefvalue"] = 1015,
["luckydef"] = 1016,
["pdefper"] = 1017,
["mdefper"] = 1018,
["intervaldef"] = 1019,
["intervalvalue"] = 1020,
["intervaldam"] = 1021,
["intervalrecover"] = 1022,
["intervalvalueaddper"] = 1023,
["hpaddper"] = 1024,
["spaddper"] = 1025,
["maxmonsteratt"] = 1026,
["minmonsteratt"] = 1027,
["maxmonsterdef"] = 1028,
["minmonsterdef"] = 1029,
["hurtper"]  = 1030,
["speed"]  = 1061,
}
local HorsePolished_Type = {
["addhp"] = 0,
["addsp"] = 0,
["ssspdam"] = 0,
["sssmdam"] = 0,
["ssstdam"] = 0,
["ssspdef"] = 0,
["sssmdef"] = 0,
["luckyvalue"] = 0,
["luckyper"] = 0,
["luckydefvalue"] = 0,
["luckydef"] = 0,
["pdefper"] = 0,
["mdefper"] = 0,
["intervaldef"] = 0,
["intervalvalue"] = 0,
["intervaldam"] = 0,
["intervalrecover"] = 0,
["intervalvalueaddper"] = 0,
["hpaddper"] = 0,
["spaddper"] = 0,
["sssmonsteratt"] = 0,
["sssmonsterdef"] = 0,
["hurtper"]  = 0,
["speed"]  = 0,
}

local EquipHorsewashtype = 
{
["addhp"] = 1001,
["addsp"] = 1002,
["minpdam"] = 1003,
["maxpdam"] = 1004,
["minmdam"] = 1005,
["maxmdam"] = 1006,
["mintdam"] = 1007,
["maxtdam"] = 1008,
["minpdef"] = 1009,
["maxpdef"] = 1010,
["minmdef"] = 1011,
["maxmdef"] = 1012,
["luckyvalue"] = 1013,
["luckyper"] = 1014,
["luckydefvalue"] = 1015,
["luckydef"] = 1016,
["pdefper"] = 1017,
["mdefper"] = 1018,
["intervaldef"] = 1019,
["intervalvalue"] = 1020,
["intervaldam"] = 1021,
["intervalrecover"] = 1022,
["intervalvalueaddper"] = 1023,
["hpaddper"] = 1024,
["spaddper"] = 1025,
["maxmonsteratt"] = 1026,
["minmonsteratt"] = 1027,
["maxmonsterdef"] = 1028,
["minmonsterdef"] = 1029,
["hurtper"]  = 1030,
["speed"]  = 1061,
}
function getequiphorsewashrandomrate(ratenum)
	local sratetinfo = HorseWashRandomDataBase 
	for k,v in ipairs(sratetinfo) do
			if ratenum < v.rate then
					return v
			end
	end

end

function RessetEauipHorseAllAttrZero(uid,equipid)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_addhp,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_addsp,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minpdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxpdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minmdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxmdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_mintdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxtdam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minpdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxpdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minmdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxmdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_luckyvalue,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_luckyper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_luckydefvalue,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_luckydef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_pdefper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_mdefper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_intervaldef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_intervalvalue,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_intervaldam,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_intervalrecover,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_intervalvalueaddper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_hpaddper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_spaddper,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minmonsteratt,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxmonsteratt,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_maxmonsterdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_minmonsterdef,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_hurtper,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Final_Num,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Horse_Speed,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_TotalScore,0)

end

function ResetHorsebindTypeAndData(uid,equipid)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type1,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type2,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type3,0)
       s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type4,0)
	   s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type5,0)
	   s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type6,0)
end

function RessetEauipHorseBindAttrZero(uid,equipid)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type1,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type2,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type3,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type4,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type5,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type6,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type7,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type8,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type9,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type10,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data1,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data2,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data3,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data4,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data5,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data6,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data7,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data8,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data9,0)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data10,0)

end
--生成属性值
function editwashHorsetabledAddAttr(attr,minvalue,maxvalue,final,key)
	math.randomseed(tostring(os.time()):reverse():sub(1, 7))
	local ratenum = math.random(1,1000000) --配置表中最大值
	local rateinfo = getequiphorsewashrandomrate(ratenum)
	local finalnum = 0
	--finalnum = (math.random(rateinfo.randDown,rateinfo.randUp) * maxvalue)/100000 --配置表中最大值
	local finalnumb,finalnums = math.modf((math.random(rateinfo.randDown,rateinfo.randUp) * maxvalue)/100000 ) + minvalue
	--print(" rrrr >>>> "..attr.." >>>> "..rateinfo.randDown.." >>> "..rateinfo.randUp.." >>>> ".."  finalnum: "..finalnumb.." final : "..final.." Maxvalue : "..maxvalue.." minvalue : "..minvalue)
	if finalnumb > 0 then
		return true,finalnumb
	else
		return false,finalnumb
	end
end
--获得属性数量 成对代表一条存在
function GetHorsePolisthedAttrNum( uid,sstable )
	local typettb = HorsePolished_Type
	for k,v in pairs(sstable) do
		
				--print(type(v.attr).."  ... "..v.attr)
				if v.attr == "minpdam" or v.attr == "maxpdam" then
					typettb.ssspdam  = typettb.ssspdam + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "minmdam" or v.attr == "maxmdam" then
					typettb.sssmdam = typettb.sssmdam + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "mintdam" or v.attr == "maxtdam" then
					typettb.ssstdam = typettb.ssstdam + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "minpdef" or v.attr == "maxpdef" then
					typettb.ssspdef = typettb.ssspdef + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "minmdef" or v.attr == "maxmdef" then
					typettb.sssmdef = typettb.sssmdef + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "minmonsteratt" or v.attr == "maxmonsteratt" then
					typettb.sssmonsteratt = typettb.sssmonsteratt + 1
					--print(type(v.attr).."  ... "..v.attr)
				elseif v.attr == "maxmonsterdef" or v.attr == "minmonsterdef" then
					typettb.sssmonsterdef = typettb.sssmonsterdef + 1
					--print(type(v.attr).."  ... "..v.attr)
				else
				--s_debugUser(uid," sstable : "..v.attr)
					typettb[""..v.attr] =  1
				end	
	end

	return typettb
end
--生成随机的概率
function getHorseratenumfromrand( washtable, ratenum, maxgetnum )
	
	local tmptable = washtable
	for k,v in pairs(tmptable) do
		--math.randomseed(tostring(os.time()):reverse():sub(1, 7))
		--math.randomseed(os.time())
		local ratenum = math.random(1,maxgetnum) --配置表中最大值
		local rateinfo = getequiphorsewashrandomrate(ratenum)
		local finalrate = math.random(rateinfo.randDown,rateinfo.randUp)
		 
		if k == "minpdam" or k == "maxpdam" then
			tmptable["minpdam"] = finalrate
			tmptable["maxpdam"] = finalrate
		elseif k == "minmdam" or k == "maxmdam" then
			tmptable["minmdam"] = finalrate
			tmptable["maxmdam"] = finalrate
		elseif k == "mintdam" or k == "maxtdam" then
			tmptable["mintdam"] = finalrate
			tmptable["maxtdam"] = finalrate
		elseif k == "minpdef" or k == "maxpdef" then
			tmptable["minpdef"] = finalrate
			tmptable["maxpdef"] = finalrate
		elseif k == "minmdef" or k == "maxmdef" then
			tmptable["minmdef"] = finalrate
			tmptable["maxmdef"] = finalrate
		elseif k == "minmonsteratt" or k == "maxmonsteratt" then
			tmptable["minmonsteratt"] = finalrate
			tmptable["maxmonsteratt"] = finalrate
		elseif k == "maxmonsterdef" or k == "minmonsterdef" then
			tmptable["maxmonsterdef"] = finalrate
			tmptable["minmonsterdef"] = finalrate
		else
			tmptable[""..k] = finalrate
		end
		 
		--print(rateinfo.randDown,rateinfo.randUp,v,ratenum,finalrate)
	end
	return tmptable
end
--编辑最终属性table
function EditHorsefinalAttrAddInfo(uid,equipid,bindtype,totalinfo)
		local tmpattr,tmpminvalue,tmpmaxvalue,tmpfinal,tmpkey
		for k,v in pairs(totalinfo) do
			if v.key == bindtype then
				tmpattr = v.attr
				tmpminvalue = v.minvalue
				tmpmaxvalue = v.maxvalue
				tmpfinal = s_getItemValue(uid,equipid,bindtype)
				if tmpfinal == nil then
					tmpfinal = 0
				end
				tmpkey = v.key
				break
			end
		end
		return tmpattr,tmpminvalue,tmpmaxvalue,tmpfinal,tmpkey
end


--洗练装备
function UserPolishSpecificHorseEquipAttr(uid,equipid)


  	--s_debugUser(uid,"UserPolishSpecificEquipAttrr equipid="..equipid)
	 local equbaseid = s_getitembaseid(uid,equipid)	
	 if equbaseid == nil then
		 s_debugUser(uid,"Baseid 未找到信息 ...")
			s_sysInfo(uid,"原装备为不可洗炼装备",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 --s_debugUser(uid,"Baseid ... ".."equipid"..equbaseid)
	 end
	 local newwashinfo = HorseWashDataBaseConfig.query(equbaseid)
	 if newwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equipid)
	     s_sysInfo(uid,"此装备无法进行洗炼",ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 if newwashinfo.speed == nil then
		s_debugUser(uid,"此装备不是坐骑装备"..equipid)
		s_sysInfo(uid,"此装备不是坐骑装备",ChatPos_Tips)
	 end
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	 if pro == Profession_Soldier or pro == Profession_Gunman or pro == Profession_Freeman then
		--s_debugUser(uid,"profession  角色职业信息正常 ... %u",pro)
	 else
		s_debugUser(uid,"profession  未找到角色职业信息 ... %u",pro)
	     return VALUE_FAIL
	 end
	 local washcost = newwashinfo.cost
	 local bindcost = newwashinfo.lockCost
	 local washnum = newwashinfo.washNum
	 local maxpower = newwashinfo.maxPower
	       s_debugUser(uid,"洗练装备，washcost : %u , bindcost : %u , washnum : %u ,maxpower : %u",washcost,bindcost,washnum,maxpower)
	 --10095 装备洗练材料 10096 坐骑洗练材料
	 if 0 == s_checkItem(uid,10096,washcost,0) then
	         s_debugUser(uid,"洗练装备时，材料不足")
	         s_sysInfo(uid,"材料不足，无法洗练",ChatPos_Tips)
	     return VALUE_FAIL
	 end     
	 
	 local bindcount = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num)
	 local bindtype1 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type1)
	 local bindtype2 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type2)
	 local bindtype3 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type3)
	 local bindtype4 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type4)
	 local bindtype5 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type5)
	 local bindtype6 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type6)
	 local bindvalue1 = s_getItemValue(uid,equipid,bindtype1)
	 local bindvalue2 = s_getItemValue(uid,equipid,bindtype2)
	 local bindvalue3 = s_getItemValue(uid,equipid,bindtype3)
	 local bindvalue4 = s_getItemValue(uid,equipid,bindtype4)
	 local bindvalue5 = s_getItemValue(uid,equipid,bindtype5)
	 local bindvalue6 = s_getItemValue(uid,equipid,bindtype6)
	 if(s_checkMoneyByType(uid, MoneyType_Gold, bindcost * bindcount) ==0) then
	         s_debugUser(uid,"洗练装备时，元宝不足")
	         s_sysInfo(uid,"元宝不足，无法洗练",ChatPos_Tips)
	     return VALUE_FAIL
	 end     
	 
	 --扣除材料 元宝
	 local moneytype = newwashinfo.transformType
	 local moneycount = bindcost * bindcount
	 local ret = s_removeMoney(uid, moneytype, moneycount,"洗练装备绑定属性消耗元宝",AddItemAction_Advanced)
	 if ret == nil or ret == 0 then
			s_debugUser(uid, "装备洗练 绑定属性 扣除元宝失败"..equipid)
			s_sysInfo(uid, "装备洗练 绑定属性 扣除元宝失败", ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 ret = s_deleteItemByBaseID(uid,10096,washcost,"洗练装备扣除材料",0)
	 if ret == nil or ret == 0 then
			s_debugUser(uid, "装备洗练扣除材料失败 "..equipid)
			s_sysInfo(uid, "装备洗练扣除材料失败 ", ChatPos_Tips)
	     return VALUE_FAIL
	 end

	 --重置多有绑定属性
	 RessetEauipHorseBindAttrZero(uid,equipid)
	 
	 --s_debugUser(uid,"绑定数量 ；%u %u %u %u %u %u %u",bindcount,bindtype1,bindtype2,bindtype3,bindtype4,bindtype5,bindtype6)
	local index = 1
	local typenum = 0
	local getwashinfo = {} --本装备能进行洗练的全部属性,包含最大值，key等信息
	local washdata = {} --本装备能进行洗练的全部属性，不包含其他信息
	local tmpwash = {} --已经洗练的属性
	local willwash = {} --将要进行洗练的属性
	local willwashdetail = {} ----将要进行洗练的属性,包含最大值，key
	local finaldata = {} --最终洗练的结果，包含最大值，key
	for k,v in pairs(newwashinfo)do
	    if v > 0 and k ~= "id" and k~="washNum" and k~="cost" and k~="lockCost" and k~="transformType" and k~="transformNum" and k~="maxGrade" and k~="maxPower" then
	    	if pro == Profession_Soldier and k~="minmdam" and k~="maxmdam" and k~="mintdam" and k~="maxtdam" then
				local tmp = {}
	    		tmp.attr=k
	    		tmp.minvalue = 0
	    		tmp.maxvalue = v
	    		tmp.final = 0
	    		tmp.key = 0
	        	table.insert(getwashinfo,tmp)
	        	table.insert(washdata,k)
	        	index = index + 1
	    	elseif pro == Profession_Gunman and k~="minpdam" and k~="maxpdam" and k~="mintdam" and k~="maxtdam" then
				local tmp = {}
	    		tmp.attr=k
	    		tmp.minvalue = 0
	    		tmp.maxvalue = v
	    		tmp.final = 0
	    		tmp.key = 0
	        	table.insert(getwashinfo,tmp)
	        	table.insert(washdata,k)
	        	index = index + 1
	    	elseif pro == Profession_Freeman and k~="minmdam" and k~="maxmdam" and k~="minpdam" and k~="maxpdam" then
				local tmp = {}
	    		tmp.attr=k
	    		tmp.minvalue = 0
	    		tmp.maxvalue = v
	    		tmp.final = 0
	    		tmp.key = 0
	        	table.insert(getwashinfo,tmp)
	        	table.insert(washdata,k)
	        	index = index + 1
			end
	    end 
	end 
	--for k,v in pairs(newwashinfo) do 
	--	 s_debugUser(uid," 洗练 ... newwashinfo  Attr : %s ",k)	
	--end
	
	for k,v in pairs(getwashinfo) do 
		for m,n in pairs(EquipHorsewashtype) do
			if v.attr == m then
				v.key = n
			end
		end
	end

	--[[
	local sratetinfo = HorseWashRandomDataBase 
	local ratemaxnum = 0
	local maxgetnum = 0
	for k,v in ipairs(sratetinfo) do
		if v.randUp > ratemaxnum then
				ratemaxnum = v.randUp
		end
		if v.rate > maxgetnum then
			maxgetnum = v.rate
		end 
	end


	local minattrvalue = {}
	for k,v in pairs(getwashinfo) do 
		if v.attr == "minpdam" or  v.attr == "minmdam" or  v.attr == "mintdam" or v.attr == "minpdef" or v.attr == "minmdef" or v.attr == "minmonsteratt" or v.attr == "minmonsterdef" then
			minattrvalue[""..v.attr ] = v.maxvalue
		end
	end

	for k,v in pairs(getwashinfo) do 
		if v.attr == "maxpdam" then
			v.minvalue = minattrvalue.minpdam
		elseif v.attr == "maxmdam" then
			v.minvalue = minattrvalue.minmdam
		elseif v.attr == "maxtdam" then
			v.minvalue = minattrvalue.mintdam
		elseif v.attr == "maxpdef" then
			v.minvalue = minattrvalue.minpdef
		elseif v.attr == "maxmdef" then
			v.minvalue = minattrvalue.minmdef
		elseif v.attr == "maxmonsteratt" then
			v.minvalue = minattrvalue.minmonsteratt
		elseif v.attr == "maxmonsterdef" then
			v.minvalue = minattrvalue.minmonsterdef
		else
		end
	end
	]]

	--for k,v in pairs(getwashinfo)do
	--	s_debugUser(uid," 洗练 ... getwashinfo  Attr : %s "..v.attr)
	--end
	if bindtype1 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype1,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype1,bindvalue1)
	end
	if bindtype2 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype2,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype2,bindvalue2)
	end

	if bindtype3 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype3,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype3,bindvalue3)
	end
	if bindtype4 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype4,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype4,bindvalue4)
	end
	if bindtype5 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype5,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype5,bindvalue5)
	end
	if bindtype6 > 0 then
		local tmp = {}
		local tattr,tmpminvalue,tmaxvalue,tfinal,tkey = EditHorsefinalAttrAddInfo(uid,equipid,bindtype6,getwashinfo)
		tmp.attr = tattr
		tmp.minvalue = tmpminvalue
		tmp.maxvalue = tmaxvalue
		tmp.final = tfinal
		tmp.key = tkey
		table.insert(finaldata,tmp)
		table.insert(tmpwash,tattr)
	   	--s_debugUser(uid,"洗练 ... 原绑定属性 Attr : %u ,final  %u",bindtype6,bindvalue6)
	end

	local polishtype = GetHorsePolisthedAttrNum(uid,getwashinfo)
	for k,v in pairs(polishtype) do
		if v > 0 then
			typenum = typenum + 1
		end
	end


	local washfinalcount = washnum - bindcount

	if typenum - bindcount < washfinalcount then
	--	print("  剩余属性数量不够 ... "..typenum)
	     s_debugUser(uid,"剩余属性数量不够 ....equipid",equipid)
		 return VALUE_FAIL
	end

	  --   s_debugUser(uid,"洗练数量条数 washnum %u , bind %u , wash %u ,typenum %u ",washnum,bindcount,washfinalcount,typenum)

	local prenum = 0
	local tnum = 0;
	while(prenum < washfinalcount and washnum > bindcount)
	do

	--for i,j in pairs(getwashinfo) do	
		local find = false
		--math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    	local ridx = math.random(1,index-1)
    	for k,v in pairs(tmpwash) do 
    		if getwashinfo[ridx].attr == v then
    			find = true
    		end
    	end
    	--print(" iiiiiiiii >>>>>> "..ridx.."  >>>>>>>> "..getwashinfo[ridx].attr)
    	if find == false then
    		if  getwashinfo[ridx].attr == "minpdam" or getwashinfo[ridx].attr  == "maxpdam" then
    			table.insert(willwash,"minpdam")
    			table.insert(willwash,"maxpdam")
    			table.insert(tmpwash,"minpdam")
    			table.insert(tmpwash,"maxpdam")
    		elseif getwashinfo[ridx].attr == "minmdam" or getwashinfo[ridx].attr == "maxmdam" then
				table.insert(willwash,"minmdam")
				table.insert(willwash,"maxmdam")
				table.insert(tmpwash,"minmdam")
				table.insert(tmpwash,"maxmdam")
    		elseif getwashinfo[ridx].attr == "mintdam" or getwashinfo[ridx].attr == "maxtdam" then
				table.insert(willwash,"mintdam")
				table.insert(willwash,"maxtdam")
				table.insert(tmpwash,"mintdam")
				table.insert(tmpwash,"maxtdam")				
    		elseif getwashinfo[ridx].attr == "minpdef" or getwashinfo[ridx].attr == "maxpdef" then
				table.insert(willwash,"minpdef")
				table.insert(willwash,"maxpdef")
				table.insert(tmpwash,"minpdef")
				table.insert(tmpwash,"maxpdef")				
    		elseif getwashinfo[ridx].attr == "minmdef" or getwashinfo[ridx].attr == "maxmdef" then
				table.insert(willwash,"minmdef")
				table.insert(willwash,"maxmdef")
				table.insert(tmpwash,"minmdef")
				table.insert(tmpwash,"maxmdef")
    		elseif getwashinfo[ridx].attr == "minmonsteratt" or getwashinfo[ridx].attr == "maxmonsteratt" then
				table.insert(willwash,"minmonsteratt")
				table.insert(willwash,"maxmonsteratt")
				table.insert(tmpwash,"minmonsteratt")
				table.insert(tmpwash,"maxmonsteratt")				
    		elseif getwashinfo[ridx].attr == "maxmonsterdef" or getwashinfo[ridx].attr == "minmonsterdef" then
				table.insert(willwash,"maxmonsterdef")
				table.insert(willwash,"minmonsterdef")
				table.insert(tmpwash,"maxmonsterdef")
				table.insert(tmpwash,"minmonsterdef")			
    		else
    			table.insert(willwash,getwashinfo[ridx].attr)
    			table.insert(tmpwash,getwashinfo[ridx].attr)
    		end
		--tnum = tnum +1
    		prenum = prenum + 1
    	end
			if prenum > washfinalcount then
				break
			end


	end
    --for k,v in pairs(willwash)do
	--	s_debugUser(uid," 洗练结果 ... RRRRRRRR : %s ,",v)
	--end

    for k,v in pairs(willwash) do
    	for i,j in pairs(getwashinfo) do
    		if v == j.attr then
    			local tmp = {}
    			tmp.attr = j.attr
    			tmp.minvalue = j.minvalue
    			tmp.maxvalue = j.maxvalue
    			tmp.final = j.final
    			tmp.key = j.key
    			--print("tmpppppp..."..tmp.attr.." >>>>> "..tmp.maxvalue.." >>>>> "..tmp.final.." >>>>> "..tmp.key)
    			table.insert(willwashdetail,tmp)

    		end
    	end
    end

	local sratetinfo = HorseWashRandomDataBase
	local ratemaxnum = 0
	local maxgetnum = 0
	for k,v in ipairs(sratetinfo) do
    	if v.randUp > ratemaxnum then
        	    ratemaxnum = v.randUp
    	end     
    	if v.rate > maxgetnum then
        		maxgetnum = v.rate
    	end              
	end                  
                     
	local ratewashtable = EquipHorsewashattr
	for k,v in pairs(ratewashtable) do
	    ratewashtable[""..k] = 0            
	end 


	local finalratebatle = getHorseratenumfromrand(ratewashtable,ratemaxnum,maxgetnum)

	for k,v in pairs(willwashdetail) do
		local rfinal,rret =math.modf((v.maxvalue * finalratebatle[""..v.attr])/ratemaxnum)
	 	  	 	local tmp = {}
    			tmp.attr = v.attr
    			tmp.minvalue = v.minvalue
    			tmp.maxvalue = v.maxvalue
    			tmp.final = rfinal
    			tmp.key = v.key
    			table.insert(finaldata,tmp)
				--print("attr : "..tmp.attr.." final "..tmp.final)
	    		--s_debugUser(uid,"结果 ... Attr : %s ,key ; %u , maxvalue : %u , final  %u",tmp.attr,tmp.key,tmp.maxvalue,tmp.final)
	end


	local washtypes = EquipHorsewashtype
	local configgrade = HorseWashGradeDataBaseConfig
	local powerinfo = EquipWashScoreDataBase
	local finalscore = 0
	local totalrate = 0.0
	local indexnum = 0
	local finalinfo = {}
	local washgrade = {}
	local washdata = newwashinfo

	local maxgrade = washdata.maxGrade
	if maxgrade ~=nil and maxgrade > 0 then
		for k,v in ipairs(configgrade)do
			if maxgrade == v["maxGrade"] then
				local tmp = {}
				tmp.grade = v.grade
				tmp.name = v.name
				tmp.score = v.score
				table.insert(washgrade,tmp)
			end
		end
	end
	table.sort(washgrade,function (a,b) return a.score < b.score end)

	for k,v in pairs(finaldata) do 
			local tmp = {}
			tmp.id = i
			tmp.attr = v.attr
			tmp.key = v.key
			tmp.final = v.final
			tmp.maxvalue = v.maxvalue
			tmp.rate = 0.0
			table.insert(finalinfo,tmp)
			indexnum = indexnum + 1
	end

	for k,v in ipairs(finalinfo) do    
		if v.maxvalue > 0 then 		
			local tmprate = 0
			if v.key >=1003 and v.key <= 1012 or v.key >= 1026 and v.key <=1029 then 
				tmprate = v.final * powerinfo[v.key].ratio * 0.5
			else
				tmprate = v.final * powerinfo[v.key].ratio
			end
			v.rate = tmprate
			totalrate = totalrate + tmprate
		end
	end
	
	local washlevelname= ""--品阶等级名称
	local washlevel = 0  --品阶等级
	finalscore = (totalrate / maxpower) * 10000 --10000是万份比固定值
	for k,v in ipairs(washgrade) do
		if finalscore > v["score"] then
		else
			washlevelname = v["name"]
			washlevel = v["grade"]
			break
		end		
	end

	s_debugUser(uid," 洗练结果...,washlevel : %u, finalscore : %u , totalpower ; %u",washlevel,finalscore,totalrate)
	--if washlevel >= 14 then
	--	local ntype = washlevelname
	--	local username = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	--	local armname = s_getItemValue(uid,equipid,-6)
	--	local spreadstr = "圣灵降世，万兽臣服。恭喜[#8]"..username.."[-]，功夫不负有心人，将[#14]"..armname.."[-]成功洗炼为[#14]"..ntype.."[-]"	
	--	s_worldInfo(spreadstr,ChatPos_Sys + ChatPos_ImportantDown,1)
	--end
		s_setItemValue(uid,equipid,1063,finalscore)
		
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type1,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type1))
--[[

    for k,v in pairs(willwashdetail) do
    	local rret,rfinal = editwashHorsetabledAddAttr(v.attr,v.minvalue,v.maxvalue,v.final,v.key)
    	if rret == true and  rfinal <= v.maxvalue then
    		local tmp = {}
    		tmp.attr = v.attr
    		tmp.minvalue = v.minvalue
    		tmp.maxvalue = v.maxvalue
    		tmp.final = rfinal
    		tmp.key = v.key
    		--print(" MMMMMMMMMMMMMMMMM "..tmp.key.." >>> ".." >>> "..tmp.final)
    		table.insert(finaldata,tmp)
    	end
    end
  ]] 
    local mytypett = EquipHorsewashtype
    local typeindex = Item_Attribute_Polished_Temp_Type1
    local typedata = Item_Attribute_Polished_Temp_Data1
	
	table.sort(finaldata, function(a,b) return a.key < b.key end) 
	if finaldata ~= nil then
			
    		for k,v in pairs(finaldata) do
				local tmpindex = mytypett[""..v.attr]
				s_setItemValue(uid,equipid,typeindex,tmpindex)
				s_setItemValue(uid,equipid,typedata,v.final)
				--s_debugUser(uid,"洗练结果 ...,%s , %u , %u , %u , %u %u",v.attr,v.key,typeindex,tmpindex,typedata,v.final)
				typeindex = typeindex + 1
				typedata = typedata + 1
			end
		s_sendEquipWashResult(uid,equipid,1,2)
	end
end
--替换洗练属性
function UserSaveSpecificEquipHorseAttr(uid,equipid)
  	s_debugUser(uid,"UserSaveSpecificEquipAttr".."equipid"..equipid)
	 local equbaseid = s_getitembaseid(uid,equipid)	
	 if equbaseid == nil then
		 s_debugUser(uid,"Baseid 未找到信息 ...")
			s_sysInfo(uid,"原装备为不可洗炼装备",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 s_debugUser(uid,"Baseid ... ".."equipid"..equbaseid)
	 end
		
	 local newwashinfo = HorseWashDataBaseConfig.query(equbaseid)
	 if newwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equipid)
	     s_sysInfo(uid,"此装备无法进行洗炼",ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 if newwashinfo.speed == nil then
		s_debugUser(uid,"此装备不是坐骑装备"..equipid)
		s_sysInfo(uid,"此装备不是坐骑装备",ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 local nowtypeanddata = {}

	local TempType1 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type1)	    
	--table.insert(nowtypeanddata,TempType1)
	local TempType2 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type2)	    
	--table.insert(nowtypeanddata,TempType2)
	local TempType3 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type3)	    
	--table.insert(nowtypeanddata,TempType3)
	local TempType4 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type4)	    
	--table.insert(nowtypeanddata,TempType4)
	local TempType5 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type5)	    
	--table.insert(nowtypeanddata,TempType5)
	local TempType6 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type6)	    
	--table.insert(nowtypeanddata,TempType6)
	local TempType7 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type7)	    
	--table.insert(nowtypeanddata,TempType7)
	local TempType8 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type8)	    
	--table.insert(nowtypeanddata,TempType8)
	local TempType9 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type9)	    
	--table.insert(nowtypeanddata,TempType9)
	local TempType10 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type10)	    
	--table.insert(nowtypeanddata,TempType10)
	local TempData1 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data1)	    
	--table.insert(nowtypeanddata,TempData1)
	local TempData2 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data2)	    
	--table.insert(nowtypeanddata,TempData2)
	local TempData3 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data3)	    
	--table.insert(nowtypeanddata,TempData3)
	local TempData4 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data4)	    
	--table.insert(nowtypeanddata,TempData4)
	local TempData5 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data5)	    
	--table.insert(nowtypeanddata,TempData5)
	local TempData6 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data6)	    
	--table.insert(nowtypeanddata,TempData6)
	local TempData7 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data7)	    
	--table.insert(nowtypeanddata,TempData7)
	local TempData8 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data8)	    
	--table.insert(nowtypeanddata,TempData8)
	local TempData9 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data9)	    
	--table.insert(nowtypeanddata,TempData9)
	local TempData10 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Data10)	    
	--table.insert(nowtypeanddata,TempData10)
	local tempscore = s_getItemValue(uid,equipid,Item_Attribute_Polished_TempScore)	    
	
	if TempData1 + TempData2 + TempData3 + TempData4 + TempData5 + TempData6 + TempData7 + TempData8 + TempData9 + TempData10 == 0 then
	    s_sysInfo(uid,"替换属性为空，不执行替换",ChatPos_Tips)
		return VALUE_FAIL
	end
	RessetEauipHorseAllAttrZero(uid,equipid)
	RessetEauipHorseBindAttrZero(uid,equipid);

	local washtypes = EquipHorsewashtype
	local configgrade = HorseWashGradeDataBaseConfig
	local finalscore = 0
	local totalrate = 0.0
	local indexnum = 0
	local finalinfo = {}
	local washgrade = {}
	local washdata = HorseWashDataBaseConfig.query(equbaseid)

	if washdata == nil then
    	s_sysInfo(uid,"不可洗炼装备，不执行替换",ChatPos_Tips)
		return VALUE_FAIL
	end
	local maxgrade = washdata.maxGrade
	if maxgrade ~=nil and maxgrade > 0 then
		for k,v in ipairs(configgrade)do
			if maxgrade == v["maxGrade"] then
				local tmp = {}
				tmp.grade = v.grade
				tmp.name = v.name
				tmp.score = v.score
				table.insert(washgrade,tmp)
			end
		end
	end
	table.sort(washgrade,function (a,b) return a.score < b.score end)

	
	local washlevelname= ""--品阶等级名称
	local washlevel = 0  --品阶等级
	--finalscore = (totalrate / indexnum) * 10000 --10000是万份比固定值
	finalscore = tempscore 
	for k,v in ipairs(washgrade) do
		if finalscore > v["score"] then
		else
			washlevelname = v["name"]
			washlevel = v["grade"]
			break
		end		
	end

	if washlevel >= 8 then
		local ntype = washlevelname
		local username = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local armname = s_getItemValue(uid,equipid,-6)
		local spreadstr = ""
		if washlevel <= 10 then
			spreadstr = "圣灵降世，万兽臣服。恭喜[#3]"..username.."[-]，功夫不负有心人，将[#14]"..armname.."[-]成功洗炼为[#4]"..ntype.."[-]"	
		end
		if washlevel >10 and washlevel <=13 then
			spreadstr = "圣灵降世，万兽臣服。恭喜[#3]"..username.."[-]，功夫不负有心人，将[#14]"..armname.."[-]成功洗炼为[#10]"..ntype.."[-]"	
		end
		if washlevel >13 and washlevel <=16 then
			spreadstr = "圣灵降世，万兽臣服。恭喜[#3]"..username.."[-]，功夫不负有心人，将[#14]"..armname.."[-]成功洗炼为[#5]"..ntype.."[-]"	
		end
		s_worldInfo(spreadstr,ChatPos_Sys + ChatPos_Important,1)
	end
   	s_setItemValue(uid,equipid,1062,tempscore)
	--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,1062,tempscore)

	if TempType1 > 0 then
    	s_setItemValue(uid,equipid,TempType1,TempData1)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType1,TempData1)
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type1,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type1))
	end
	if TempType2 > 0 then
    	s_setItemValue(uid,equipid,TempType2,TempData2)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType2,TempData2)
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type2,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type2))
	end
	if TempType3 > 0 then
    	s_setItemValue(uid,equipid,TempType3,TempData3)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType3,TempData3)
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type3,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type3))
	end
	if TempType4 > 0 then
    	s_setItemValue(uid,equipid,TempType4,TempData4)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType4,TempData4)
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type4,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type4))
	end
	if TempType5 > 0 then
    	s_setItemValue(uid,equipid,TempType5,TempData5)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType5,TempData5)
		--s_debugUser(uid," 洗练临时结果...,%u , %u , %u %u",uid,equipid,Item_Attribute_Polished_Temp_Type5,s_getItemValue(uid,equipid,Item_Attribute_Polished_Temp_Type5))
	end
	if TempType6 > 0 then
    	s_setItemValue(uid,equipid,TempType6,TempData6)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType6,TempData6)
	end
	if TempType7 > 0 then
    	s_setItemValue(uid,equipid,TempType7,TempData7)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType7,TempData7)
	end
	if TempType8 > 0 then
    	s_setItemValue(uid,equipid,TempType8,TempData8)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType8,TempData8)
	end
	if TempType9 > 0 then
    	s_setItemValue(uid,equipid,TempType9,TempData9)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType9,TempData9)
	end
	if TempType10 > 0 then
    	s_setItemValue(uid,equipid,TempType10,TempData10)
		--s_debugUser(uid,"洗练保存结果...,%u , %u , %u %u",uid,equipid,TempType10,TempData10)
	end
	ResetHorsebindTypeAndData(uid,equipid)
	s_sendEquipWashResult(uid,equipid,2,2)
end
--绑定洗练属性
function UserBindSpecificHorseEquipAttr(uid,equipid,bindtype)
    s_debugUser(uid,"UserBindSpecificEquipAttr equipid : %u , bindtype : %u ",equipid,bindtype)
    --s_debugUser(uid," UserBindSpecificEquipAttr bindcount "..bindcount.."bindtype "..bindtype.."bindtype1"..bindtype1.."bindtype2"..bindtype2.."bindtype3"..bindtype3.."bindtype4"..bindtype4.."bindtype5"..bindtype5.."bindtype6"..bindtype6)
	 
	 local equbaseid = s_getitembaseid(uid,equipid)	
	 if equbaseid == nil then
		 s_debugUser(uid," Baseid 未找到信息 ...")
			s_sysInfo(uid,"原装备为不可洗炼装备",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 s_debugUser(uid," Baseid ... ".."equipid"..equbaseid)
	 end
	 if bindtype < 1000 or bindtype > 1061 then
	    s_sysInfo(uid,"属性参数错误",ChatPos_Tips)	 	
		return VALUE_FAIL
	 end
	 local newwashinfo = HorseWashDataBaseConfig.query(equbaseid)
	 if newwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equipid)
	     s_sysInfo(uid,"此装备无法进行洗炼",ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 if newwashinfo.speed == nil then
		s_debugUser(uid,"此装备不是坐骑装备"..equipid)
		s_sysInfo(uid,"此装备不是坐骑装备",ChatPos_Tips)
	     return VALUE_FAIL
	 end
   	 local bindcount = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num)
	 local bindtype1 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type1)
	 local bindtype2 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type2)
	 local bindtype3 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type3)
	 local bindtype4 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type4)
	 local bindtype5 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type5)
	 local bindtype6 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type6)

	 if bindtype1 == bindtype and bindtype2 == bindtype and bindtype3 == bindtype and bindtype4 == bindtype and bindtype5 == bindtype and bindtype6 == bindtype then
	 	 --s_debugUser(uid,"未找到需要解绑的属性")
	    s_sysInfo(uid,"属性已经绑定了",ChatPos_Tips)
		return VALUE_FAIL
	 end
	 local emptytypet = {}
	 if bindtype1 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype1
	 	tmp.atype = Item_Attribute_Polished_Bind_Type1
	 	table.insert(emptytypet,tmp)
	 end
	 if bindtype2 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype2
	 	tmp.atype = Item_Attribute_Polished_Bind_Type2
	 	table.insert(emptytypet,tmp)
	 end
	 if bindtype3 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype3
	 	tmp.atype = Item_Attribute_Polished_Bind_Type3
	 	table.insert(emptytypet,tmp)
	 end
	 if bindtype4 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype4
	 	tmp.atype = Item_Attribute_Polished_Bind_Type4
	 	table.insert(emptytypet,tmp)
	 end
	 if bindtype5 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype5
	 	tmp.atype = Item_Attribute_Polished_Bind_Type5
	 	table.insert(emptytypet,tmp)
	 end
	 if bindtype6 == 0 then
	 	local tmp = {}
	 	tmp.isuse = 0
	 	tmp.index = bindtype6
	 	tmp.atype = Item_Attribute_Polished_Bind_Type6
	 	table.insert(emptytypet,tmp)
	 
	 end

	 if bindcount >= 3 then
	 		 --s_debugUser(uid,"绑定装备属性达到最大数量无法继续绑定")
	    s_sysInfo(uid,"绑定装备属性达到最大数量无法继续绑定",ChatPos_Tips)
		return VALUE_FAIL
	 end
	 if bindtype < 1000 or bindtype > 1061 then
	    s_sysInfo(uid,"绑定装备属性参数不正确",ChatPos_Tips)
		return VALUE_FAIL
	 end

	 if bindtype == bindtype1 or bindtype == bindtype2 or bindtype == bindtype3 or bindtype == bindtype4 or bindtype == bindtype5 or bindtype == bindtype6 then
	 		 --s_debugUser(uid,"装备属性已经绑定了，不需要继续绑定")
	    s_sysInfo(uid,"装备属性已经绑定了，不需要继续绑定",ChatPos_Tips)
		return VALUE_FAIL
	 end
	if bindtype == Item_Attribute_Polished_minpdam or bindtype == Item_Attribute_Polished_maxpdam then
			local isbind=false
			if bindtype == Item_Attribute_Polished_maxpdam then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
			end
		end
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_minmdam or bindtype == Item_Attribute_Polished_maxmdam then
			local isbind=false
			if bindtype == Item_Attribute_Polished_maxmdam then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
			end
		end
		s_sysInfo(uid,"绑定成功",ChatPos_Tips)
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_mintdam or bindtype == Item_Attribute_Polished_maxtdam then
			local isbind=false
			if bindtype == Item_Attribute_Polished_maxtdam then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
				
			end
		end    	
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_minpdef or bindtype == Item_Attribute_Polished_maxpdef then
			local isbind=false
			if bindtype == Item_Attribute_Polished_maxpdef then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
			end
		end
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_minmdef or bindtype == Item_Attribute_Polished_maxmdef then
			local isbind=false
			if bindtype == Item_Attribute_Polished_maxmdef then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
				
			end
		end
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_minmonsteratt or bindtype == Item_Attribute_Polished_maxmonsteratt then
			local isbind=false
			if bindtype == Item_Attribute_Polished_minmonsteratt then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
			end
		end
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
    elseif bindtype == Item_Attribute_Polished_minmonsterdef or bindtype == Item_Attribute_Polished_maxmonsterdef then
			local isbind=false
			if bindtype == Item_Attribute_Polished_minmonsterdef then
					bindtype = bindtype - 1
			end
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				break
			end
		end

		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype+1)
				break
			end
		end
		if isbind  then 
			s_sysInfo(uid,"绑定成功",ChatPos_Tips)
			s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
		end
   	else
			local isbind=false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 0 then
				v.isuse = 1
				isbind = true
				s_setItemValue(uid,equipid,v.atype,bindtype)
				s_sysInfo(uid,"绑定成功",ChatPos_Tips)
				break
			end
		end
	s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount+1)
   	end
	s_sendEquipWashResult(uid,equipid,3,2)
end
--解绑指定属性
function UserDeBindSpecificHorseEquipAttr(uid,equipid,bindtype)
    s_debugUser(uid,"UserDeBindSpecificEquipAttr equipid : %u , bindtype : %u ",equipid,bindtype)
     local bindcount = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num)
	 local bindtype1 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type1)
	 local bindtype2 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type2)
	 local bindtype3 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type3)
	 local bindtype4 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type4)
	 local bindtype5 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type5)
	 local bindtype6 = s_getItemValue(uid,equipid,Item_Attribute_Polished_Bind_Type6)
	 s_debugUser(uid,"UserDeBindSpecificEquipAttr bindcount-%u  bindtype-%u  bindtype1-%u bindtype2-%u bindtype3-%u bindtype4-%u bindtype5-%u bindtype6-%u ",bindcount,bindtype,bindtype1,bindtype2,bindtype3,bindtype4,bindtype5,bindtype6)
	 local equbaseid = s_getitembaseid(uid,equipid)	
	 if equbaseid == nil then
		 s_debugUser(uid," Baseid 未找到信息 ...")
			s_sysInfo(uid,"原装备为不可洗炼装备",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 s_debugUser(uid," Baseid ... ".."equipid"..equbaseid)
	 end
	 local newwashinfo = HorseWashConfig.query(equbaseid)
	 if newwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equipid)
	     s_sysInfo(uid,"此装备无法进行洗炼",ChatPos_Tips)
	     return VALUE_FAIL
	 end
	 if newwashinfo.speed == nil then
		s_debugUser(uid,"此装备不是坐骑装备"..equipid)
		s_sysInfo(uid,"此装备不是坐骑装备",ChatPos_Tips)
	 end
	 if bindcount == 0 then
	 		 --s_debugUser(uid,"装备无绑定属性")
	    s_sysInfo(uid,"装备无绑定属性",ChatPos_Tips)	 	
		return VALUE_FAIL
	 end

	 if bindtype < 1000 or bindtype > 1061 then
	    s_sysInfo(uid,"属性参数错误",ChatPos_Tips)	 	
		return VALUE_FAIL
	 end

	 if bindtype1 ~= bindtype and bindtype2 ~= bindtype and bindtype3 ~= bindtype and bindtype4 ~= bindtype and bindtype5 ~= bindtype and bindtype6 ~= bindtype then
	 	 --s_debugUser(uid,"未找到需要解绑的属性")
	    s_sysInfo(uid,"未找到需要解绑的属性",ChatPos_Tips)
		return VALUE_FAIL
	 end

	 local emptytypet = {}
	 if bindtype1 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype1
	 	tmp.atype = Item_Attribute_Polished_Bind_Type1
	 	table.insert(emptytypet,tmp)
	end
	if bindtype2 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype2
	 	tmp.atype = Item_Attribute_Polished_Bind_Type2
	 	table.insert(emptytypet,tmp)
	end
	if bindtype3 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype3
	 	tmp.atype = Item_Attribute_Polished_Bind_Type3
	 	table.insert(emptytypet,tmp)
	end
	if bindtype4 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype4
	 	tmp.atype = Item_Attribute_Polished_Bind_Type4
	 	table.insert(emptytypet,tmp)
	end
	if bindtype5 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype5
	 	tmp.atype = Item_Attribute_Polished_Bind_Type5
	 	table.insert(emptytypet,tmp)
	end
	if bindtype6 > 0 then
	 	local tmp = {}
	 	tmp.isuse = 1
	 	tmp.index = bindtype6
	 	tmp.atype = Item_Attribute_Polished_Bind_Type6
	 	table.insert(emptytypet,tmp)
	 end
	
	 --for k,v in pairs(emptytypet)do
	--	s_debugUser(uid," emptytypet...%u..%u",v.index,v.atype)
	-- end
	if bindtype == Item_Attribute_Polished_minpdam or bindtype == Item_Attribute_Polished_maxpdam then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minpdam  then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxpdam then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_minmdam or bindtype == Item_Attribute_Polished_maxmdam then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minmdam then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxmdam then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_mintdam or bindtype == Item_Attribute_Polished_maxtdam then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_mintdam then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxtdam then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_minpdef or bindtype == Item_Attribute_Polished_maxpdef then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minpdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxpdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_minmdef or bindtype == Item_Attribute_Polished_maxmdef then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minmdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxmdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_minmonsteratt or bindtype == Item_Attribute_Polished_maxmonsteratt then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minmonsteratt then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxmonsteratt then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
    elseif bindtype == Item_Attribute_Polished_minmonsterdef or bindtype == Item_Attribute_Polished_maxmonsterdef then
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == Item_Attribute_Polished_minmonsterdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
			if v.isuse == 1 and v.index == Item_Attribute_Polished_maxmonsterdef then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
			end
		end

		if debind then
		s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		s_debugUser(uid," 解绑成功...%u",bindtype)
		s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
		end 
   	else
		local debind = false
		for k,v in ipairs(emptytypet) do
			if v.isuse == 1 and v.index == bindtype then
				debind = true
				v.isuse=0
				s_setItemValue(uid,equipid,v.atype,0)
				s_sysInfo(uid,"解绑成功",ChatPos_Tips)
		 		s_debugUser(uid," 解绑成功...%u",bindtype)
				s_setItemValue(uid,equipid,Item_Attribute_Polished_Bind_Num,bindcount-1)
			end
		end
   	end
	s_sendEquipWashResult(uid,equipid,4,2)

end
--洗练属性继承
function UserReplaceSpecificHorseEquipAttr(uid,equipsrcid,equidecid)
    s_debugUser(uid,"UserReplaceSpecificEquipAttr ".."equipsrcid "..equipsrcid.."equipsrcid "..equidecid)
	 local srcequbaseid = s_getitembaseid(uid,equipsrcid)	
	 if srcequbaseid == nil then
		 s_debugUser(uid," Baseid 未找到信息 ...")
			s_sysInfo(uid,"原装备不可洗炼",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 s_debugUser(uid," Baseid ... ".."equipid"..srcequbaseid)
	 end
	 local decequbaseid = s_getitembaseid(uid,equidecid)	
	 if decequbaseid == nil then
		 s_debugUser(uid," Baseid 未找到信息 ...")
			s_sysInfo(uid,"目标为不可洗炼装备",ChatPos_Tips)
		 return VALUE_FAIL
	 else
		 s_debugUser(uid," Baseid ... ".."equipid"..decequbaseid)
	 end
	 
	 local srcnewwashinfo = HorseWashDataBaseConfig.query(srcequbaseid)
	 if srcnewwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equipsrcid)
	     s_sysInfo(uid,"此装备无法进行洗炼继承",ChatPos_Tips)
	     return VALUE_FAIL
 	 end
	 local decnewwashinfo = HorseWashDataBaseConfig.query(decequbaseid)
	 if decnewwashinfo == nil then
	     s_debugUser(uid,"未从数据表中获取到装备的相关信息...equipid="..equidecid)
	     s_sysInfo(uid,"此装备无法进行洗炼继承",ChatPos_Tips)
	     return VALUE_FAIL
 	 end
	
	 if srcnewwashinfo.speed == nil or decnewwashinfo.speed == nil then
		s_debugUser(uid,"源装备或者目标装备不是坐骑")
		s_sysInfo(uid,"源装备或者目标装备不是坐骑，无法继承",ChatPos_Tips)  
		return VALUE_FAIL
	 end
	

	local sraddhp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addhp)	
	local sraddsp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addsp)	
	local srminpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdam)	
	local srmaxpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdam)	
	local srminmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdam)	
	local srmaxmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdam)	
	local srmintdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mintdam)	
	local srmaxtdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxtdam)	
	local srminpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdef)	
	local srmaxpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdef)	
	local srminmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdef)	
	local srmaxmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdef)	
	local srluckyvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyvalue)	
	local srluckyper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyper)	
	local srluckydefvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydefvalue)	
	local srluckydef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydef)	
	local srpdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_pdefper)	
	local srmdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mdefper)	
	local srintervaldef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldef)	
	local srintervalvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalue)	
	local srintervaldam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldam)	
	local srintervalrecover = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalrecover)	
	local srintervalvalueaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalueaddper)	
	local srhpaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hpaddper)	
	local addhp = s_getItemValue(uid,equidecid,Item_Attribute_Polished_addhp)	
	local addsp = s_getItemValue(uid,equidecid,Item_Attribute_Polished_addsp)	
	local minpdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minpdam)	
	local maxpdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxpdam)	
	local minmdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minmdam)	
	local maxmdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxmdam)	
	local mintdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_mintdam)	
	local maxtdam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxtdam)	
	local minpdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minpdef)	
	local maxpdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxpdef)	
	local minmdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minmdef)	
	local maxmdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxmdef)	
	local luckyvalue = s_getItemValue(uid,equidecid,Item_Attribute_Polished_luckyvalue)	
	local luckyper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_luckyper)	
	local luckydefvalue = s_getItemValue(uid,equidecid,Item_Attribute_Polished_luckydefvalue)	
	local luckydef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_luckydef)	
	local pdefper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_pdefper)	
	local mdefper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_mdefper)	
	local intervaldef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_intervaldef)	
	local intervalvalue = s_getItemValue(uid,equidecid,Item_Attribute_Polished_intervalvalue)	
	local intervaldam = s_getItemValue(uid,equidecid,Item_Attribute_Polished_intervaldam)	
	local intervalrecover = s_getItemValue(uid,equidecid,Item_Attribute_Polished_intervalrecover)	
	local intervalvalueaddper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_intervalvalueaddper)	
	local hpaddper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_hpaddper)	
	local spaddper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_spaddper)	
	local minmonsteratt = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minmonsteratt)	
	local maxmonsteratt = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxmonsteratt)	
	local maxmonsterdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_maxmonsterdef)	
	local minmonsterdef = s_getItemValue(uid,equidecid,Item_Attribute_Polished_minmonsterdef)	
	local hurtper = s_getItemValue(uid,equidecid,Item_Attribute_Polished_hurtper)	
	local BindNum = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Num)	

	local Bind_Type1 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type1)	
	local Bind_Type2 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type2)
	local Bind_Type3 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type3)	 
	local Bind_Type4 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type4)	 
	local Bind_Type5 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type5)	 
	local Bind_Type6 = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Bind_Type6)	 
	local decSpeed = s_getItemValue(uid,equidecid,Item_Attribute_Polished_Horse_Speed)

   	if addhp > 0 or addsp > 0 or minpdam > 0 or maxpdam > 0 or minmdam > 0 or maxmdam > 0 or mintdam > 0 or maxtdam > 0 or minpdef > 0 or maxpdef > 0 or minmdef > 0 or maxmdef > 0 or luckyvalue > 0 or luckyper > 0 or luckydefvalue > 0 or luckydef > 0 or pdefper > 0 or mdefper > 0 or intervaldef > 0 or intervalvalue > 0 or intervalrecover > 0 or intervalvalueaddper > 0 or hpaddper > 0 or spaddper > 0 or minmonsteratt > 0 or maxmonsteratt > 0 or minmonsterdef > 0 or hurtper > 0 or BindNum > 0 or Bind_Type1 > 0 or Bind_Type2 > 0 or Bind_Type3 > 0 or decSpeed > 0 then
	
		s_sysInfo(uid,"目标装备属性不为空，不符合转移条件",ChatPos_Tips)
		return VALUE_FAIL
	end 

	local moneytype= srcnewwashinfo.transformType
	local moneycount = srcnewwashinfo.transformNum
	 if(s_checkMoneyByType(uid, moneytype, moneycount) ==0) then
		s_debugUser(uid,"继承洗练属性时，元宝不足")
		s_sysInfo(uid,"元宝不足，无法继承操作",ChatPos_Tips)
		return VALUE_FAIL
	 end

	 local ret = s_removeMoney(uid, moneytype,moneycount ,"洗练装备继承属性消耗元宝",AddItemAction_Advanced)
	 if ret == nil or ret == 0 then
			s_debugUser(uid, "装备洗练 继承 扣除元宝失败"..equipid)
			s_sysInfo(uid, "装备继承洗炼属性 扣除元宝失败", ChatPos_Tips)
	     return VALUE_FAIL
	 end

	local sraddhp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addhp)	
	local sraddsp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addsp)	
	local srminpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdam)	
	local srmaxpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdam)	
	local srminmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdam)	
	local srmaxmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdam)	
	local srmintdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mintdam)	
	local srmaxtdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxtdam)	
	local srminpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdef)	
	local srmaxpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdef)	
	local srminmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdef)	
	local srmaxmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdef)	
	local srluckyvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyvalue)	
	local srluckyper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyper)	
	local srluckydefvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydefvalue)	
	local srluckydef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydef)	
	local srpdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_pdefper)	
	local srmdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mdefper)	
	local srintervaldef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldef)	
	local srintervalvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalue)	
	local srintervaldam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldam)	
	local srintervalrecover = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalrecover)	
	local srintervalvalueaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalueaddper)	
	local srhpaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hpaddper)	
	local srspaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_spaddper)	
	local srminmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsteratt)	
	local srmaxmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsteratt)	
	local srmaxmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsterdef)	
	local srminmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsterdef)	
	local srhurtper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hurtper)	
	local srspeed = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_Horse_Speed)
	--设置新装备属性
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_addhp,sraddhp)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_addsp,sraddsp)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minpdam,srminpdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxpdam,srmaxpdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minmdam,srminmdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxmdam,srmaxmdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_mintdam,srmintdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxtdam,srmaxtdam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minpdef,srminpdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxpdef,srmaxpdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minmdef,srminmdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxmdef,srmaxmdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_luckyvalue,srluckyvalue)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_luckyper,srluckyper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_luckydefvalue,srluckydefvalue)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_luckydef,srluckydef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_pdefper,srpdefper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_mdefper,srmdefper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_intervaldef,srintervaldef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_intervalvalue,srintervalvalue)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_intervaldam,srintervaldam)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_intervalrecover,srintervalrecover)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_intervalvalueaddper,srintervalvalueaddper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_hpaddper,srhpaddper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_spaddper,srspaddper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minmonsteratt,srminmonsteratt)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxmonsteratt,srmaxmonsteratt)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_maxmonsterdef,srmaxmonsterdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_minmonsterdef,srminmonsterdef)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_hurtper,srhurtper)	
	s_setItemValue(uid,equidecid,Item_Attribute_Polished_Horse_Speed,srspeed)	

	--重置旧装备属性为0
	RessetEauipHorseAllAttrZero(uid,equipsrcid)
	ResetHorsebindTypeAndData(uid,equipsrcid)
	RessetEauipHorseBindAttrZero(uid,equipsrcid)
	s_sendEquipWashResult(uid,equidecid,5,2)
	s_sysInfo(uid,"洗炼继承完成",ChatPos_Tips)

end
--清除绑定属性1
function UserClearBindPolishSpecificHorseEquipAttr(uid,equipid)

  	s_debugUser(uid,"UserClearBindPolishHorseSpecificEquipAttr...equipid : "..equipid)
	 local equbaseid = s_getitembaseid(uid,equipid)	
	 if equbaseid == nil then
		 s_debugUser(uid," Baseid 未找到信息 ...")
		s_sysInfo(uid,"未找到装备信息",ChatPos_Tips)
		return VALUE_FAIL
	 else
		 s_debugUser(uid," Baseid ... equipid="..equbaseid)
		 ResetHorsebindTypeAndData(uid,equipid)
	 end

	s_sendEquipWashResult(uid,equipsrcid,6,2)

end


