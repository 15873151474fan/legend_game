--合成材料
--targetid 目标道具thisid total 合成总次数 success 成功次数
function OnComposeMaterialEvent(uid,targetid,total,success)
	local baseid = s_getItemValue(uid,targetid,Item_Base_ID)
	--药材
	if baseid == 27113 then
		if success > 0 then
			AddRoleTaskOperate(uid,10283)
		end
	elseif baseid == 27112 then
		if success > 0 then
			AddRoleTaskOperate(uid,10293)
		end
	end
	AddRoleTaskOperate(uid,4141)
	AddRoleTaskOperate(uid,4181)
end
--装备合成
function OnComposeEquipEvent(uid,equipid)
	local empty = s_getEmptyBagGridCount(uid)
	if empty == nil or empty == 0 then
		s_sysInfo(uid, "背包空间不足,请清理背包", ChatPos_Tips)
		return 0
	end

	local ecb = EquipComposeDataBase.query(equipid)
	if equipid == 0 or ecb == nil then
		s_error("装备合成找不到配置项, uid="..uid..",baseid="..equipid)
		return 0
	end

	if ecb.rebirthnum < 20 and s_getRebirthLevel(uid) < ecb.rebirthnum then
		s_debugUser(uid, "装备合成,飞升等级不足,baseid="..equipid)
		s_sysInfo(uid, "转生等级不足", ChatPos_Tips)
		return 0
	end

	if ecb.profession ~= 0 and s_getCharBaseValue(uid, CharBase_Type) ~= ecb.profession then
		s_debugUser(uid, "装备合成,职业不符,baseid="..equipid)
		s_sysInfo(uid, "职业不符", ChatPos_Tips)
		return 0
	end

	if ecb.sex ~= 0 and s_getCharBaseValue(uid, CharBase_Sex) ~= ecb.sex then
		s_debugUser(uid, "装备合成,性别不符,baseid="..equipid)
		s_sysInfo(uid, "性别不符", ChatPos_Tips)
		return 0
	end

	local msg = "货币不足"
	if ecb.mtype == MoneyType_MoneyTicket then
		msg = "银两不足"
	elseif ecb.mtype == MoneyType_Money then
		msg = "绑定元宝不足"
	elseif ecb.mtype == MoneyType_Gold then
		msg = "元宝不足,请前往充值"
	end

	if s_checkMoneyByType(uid, ecb.mtype, ecb.mnum) == 0 then
		s_debugUser(uid, "装备合成,"..msg..",baseid="..equipid)
		s_sysInfo(uid, msg, ChatPos_Tips)
		return 0
	end

	--装备材料
	local delmater = {}
	local ret = getComposeEquipMaterial(uid, ecb.material, ecb.maternum, delmater)
	if ret == nil or ret == 0 then
		s_debugUser(uid, "装备合成,材料不足, baseid="..equipid)
		s_sysInfo(uid, "装备合成材料不足", ChatPos_Tips)
		return 0
	end

	--装备合成
	local delequip = {}
	ret = getComposeEquipItem(uid, ecb, delequip)
	if ret == nil or ret == 0 then
		s_debugUser(uid, "合成不足, baseid="..equipid)
		s_sysInfo(uid, "合成材料不足", ChatPos_Tips)
		return 0
	end

	--最大强化等级
	local maxstrengthen = 0
	for k, v in ipairs(delequip) do
		if v.strengthen > maxstrengthen then
			maxstrengthen = v.strengthen
		end
	end

	for i, m in ipairs(delmater) do
		table.insert(delequip, m)
	end

	local delthisid = 0
	local newequipthisid = 0
	local eqscore = 0
	for k,v in pairs(delequip) do
		if v.qwthisid ~= nil then
			if s_getItemValue(uid,v.qwthisid,Item_Attribute_Polished_TotalScore) ~= nil and s_getItemValue(uid,v.qwthisid,Item_Attribute_Polished_TotalScore) > eqscore then
			delthisid = v.qwthisid
			eqscore = s_getItemValue(uid,v.qwthisid,Item_Attribute_Polished_TotalScore)
			end
		end
	end
	local  sraddhp ,sraddsp ,srminpdam ,srmaxpdam ,srminmdam ,
	srmaxmdam ,srmintdam ,srmaxtdam ,srminpdef ,srmaxpdef ,
	srminmdef ,srmaxmdef ,srluckyvalue ,srluckyper ,srluckydefvalue ,
	srluckydef ,srpdefper ,srmdefper ,srintervaldef ,srintervalvalue ,
	srintervaldam ,srintervalrecover ,srintervalvalueaddper ,srhpaddper ,srspaddper ,
	srminmonsteratt ,srmaxmonsteratt ,srmaxmonsterdef ,srminmonsterdef ,srhurtper,srspeed,srtotalscore
	local equipsrcid = delthisid
	if equipsrcid > 0 then
		sraddhp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addhp)
		sraddsp = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_addsp)
		srminpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdam)
		srmaxpdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdam)
		srminmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdam)
		srmaxmdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdam)
		srmintdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mintdam)
		srmaxtdam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxtdam)
		srminpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minpdef)
		srmaxpdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxpdef)
		srminmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmdef)
		srmaxmdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmdef)
		srluckyvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyvalue)
		srluckyper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckyper)
		srluckydefvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydefvalue)
		srluckydef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_luckydef)
		srpdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_pdefper)
		srmdefper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_mdefper)
		srintervaldef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldef)
		srintervalvalue = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalue)
		srintervaldam = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervaldam)
		srintervalrecover = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalrecover)
		srintervalvalueaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_intervalvalueaddper)
		srhpaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hpaddper)
		srspaddper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_spaddper)
		srminmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsteratt)
		srmaxmonsteratt = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsteratt)
		srmaxmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_maxmonsterdef)
		srminmonsterdef = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_minmonsterdef)
		srhurtper = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_hurtper)
		srspeed = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_Horse_Speed)
		srtotalscore = s_getItemValue(uid,equipsrcid,Item_Attribute_Polished_TotalScore)
	end

	-- 删除道具
	local additem = {}
	local flag = 0
	for k, v in ipairs(delequip) do
		ret = s_deleteItemByThisID(uid, v.qwthisid, v.num, "装备合成删除")
		if ret == nil or ret == 0 then
			flag = 1
			break
		end
		local msg = "装备合成删除道具,baseid="..v.baseid..",num="..v.num..",strengthe="..v.strengthen..",bind="..v.bind
		s_debugUser(uid, msg)
		table.insert(additem, v)
	end
	--扣除道具失败
	if flag == 1 then
		composeEquipFail(uid, additem, equipid)
		return 0
	end

	--扣除货币
	ret = s_removeMoney(uid, ecb.mtype, ecb.mnum, "装备合成扣除货币", AddItemAction_EquipCompose)
	if ret == nil or ret == 0 then
		composeEquipFail(uid, additem, equipid)
		return 0
	end

	if equipid >= 10159 and equipid <= 10160 then
		s_addItem(uid, equipid, 3, 1, maxstrengthen, "1-1", "装备合成成功获得道具", 0, AddItemAction_EquipCompose)
		s_debugUser(uid, "装备合成成功, baseid="..equipid)
		return 1
	end
	local equbaseid = equipid
	local newwashinfo = EquipWashDataBase.query(equbaseid)
	local powerinfo = EquipWashScoreDataBase
	if newwashinfo == nil or powerinfo == nil then
		s_debugUser(uid, "装备合成未找到配置表")
		return 0
	end
	local maxpower = newwashinfo.maxPower
	local totalpower = 0
	local ftotalscore = 0
	for i=1001,1030,1 do
		local tmprate = 0
		if i >= 1003 and i <= 1012 or i >= 1026 and i <=1029 then
			tmprate = s_getItemValue(uid,equipsrcid,i)  * powerinfo[i].ratio * 0.5
		else
			tmprate = s_getItemValue(uid,equipsrcid,i)* powerinfo[i].ratio
		end
		totalpower = totalpower + tmprate
	end
		totalpower = totalpower + s_getItemValue(uid,equipsrcid,1061)
	if maxpower > 0 then
		ftotalscore = math.ceil((totalpower / maxpower) * 10000)
	end
	if ftotalscore > 10000 then
		ftotalscore = 10000
	end

	newequipthisid = s_addItem(uid, equipid, 3, 1, maxstrengthen, "1-1", "装备合成成功获得道具", 0, AddItemAction_EquipCompose)
	s_debugUser(uid, "装备合成成功, baseid="..equipid)
	if newequipthisid > 0 then
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_addhp,sraddhp)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_addsp,sraddsp)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minpdam,srminpdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxpdam,srmaxpdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmdam,srminmdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmdam,srmaxmdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_mintdam,srmintdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxtdam,srmaxtdam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minpdef,srminpdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxpdef,srmaxpdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmdef,srminmdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmdef,srmaxmdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckyvalue,srluckyvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckyper,srluckyper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckydefvalue,srluckydefvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_luckydef,srluckydef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_pdefper,srpdefper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_mdefper,srmdefper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervaldef,srintervaldef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalvalue,srintervalvalue)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervaldam,srintervaldam)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalrecover,srintervalrecover)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_intervalvalueaddper,srintervalvalueaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_hpaddper,srhpaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_spaddper,srspaddper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmonsteratt,srminmonsteratt)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmonsteratt,srmaxmonsteratt)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_maxmonsterdef,srmaxmonsterdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_minmonsterdef,srminmonsterdef)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_hurtper,srhurtper)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_Horse_Speed,srspeed)
		s_setItemValue(uid,newequipthisid,Item_Attribute_Polished_TotalScore,ftotalscore)
	end
	return 1
end

function composeEquipFail(uid, additem, equipid)
	for i, m in ipairs(additem) do
		local msg = "装备合成失败返回道具,baseid="..m.baseid..",num="..m.num..",strengthe="..m.strengthen..",bind="..m.bind
		s_debugUser(uid, msg)
		if m.bind == 1 then
			s_addItem(uid, m.baseid, 3, m.num, m.strengthen, "1-1", "装备合成失败返回道具", 0, AddItemAction_EquipCompose);
		else
			s_addItem(uid, m.baseid, 3, m.num, m.strengthen, "1-0", "装备合成失败返回道具", 0, AddItemAction_EquipCompose);
		end
	end
end

--合成材料判断
function getComposeEquipMaterial(uid, material, maternum, delmater)
	if material == 0 or maternum == 0 then
		return 1
	end
	local itemlist = s_getItemListByBaseID(uid, material, PACKAGETYPE_MAIN)
	if itemlist == nil or table.getn(itemlist) == 0 then
		return 0
	end

	local materTable = {}
	local total = 0
	for i, v in ipairs(itemlist) do
		local temp = {}
		temp.qwthisid = v
		temp.baseid = material
		temp.num = s_getItemValue(uid, v, -8)
		temp.strengthen = s_getItemValue(uid, v, Item_Attribute_StrengthenLv)
		temp.bind = s_getItemValue(uid, v, Item_Attribute_Bind)
		table.insert(materTable, temp)
		total = total + temp.num
	end

	if table.getn(materTable) == 0 then
		return 0
	end

	if total < maternum then
		return 0
	end

	table.sort(materTable, function(a, b) return a.bind > b.bind end)
	local lastAllCnt = 0 --之前总数
	for i, v in ipairs(materTable) do
		if v.num + lastAllCnt >= maternum then
			if maternum > lastAllCnt then
				v.num = maternum - lastAllCnt
				table.insert(delmater, v)
				break
			end
		else
			table.insert(delmater, v)
			lastAllCnt = lastAllCnt + v.num
		end
	end

	return 1
end

function getComposeEquipItem(uid, ecb, delequip)
	local cntTable = {}
	for i = 1, 5 do
		local srcItemStr = "srcItemId"..i
		if ecb[srcItemStr] ~= 0 then
			local cnt = cntTable[ecb[srcItemStr]] or 0
			cntTable[ecb[srcItemStr]] = cnt + 1
		end
	end

	local itemlist = {}
	local totalcnt = {}
	for k, v in pairs(cntTable) do
		s_debugUser(uid, "装备合成所需道具数量,baseid="..k..",num="..v)
		if v > 0 then
			local item = s_getItemListByBaseID(uid, k, PACKAGETYPE_MAIN)
			if item == nil or table.getn(item) == 0 then
				s_debugUser(uid, "装备合成时,背包中没有相应的道具1 baseid="..k)
				return 0
			end
			local imTable = {}
			local total = 0
			for i, m in ipairs(item) do
				local temp = {}
				temp.qwthisid = m
				temp.baseid = k
				temp.num = s_getItemValue(uid, m, -8)
				temp.strengthen = s_getItemValue(uid, m, Item_Attribute_StrengthenLv)
				temp.bind = s_getItemValue(uid, m, Item_Attribute_Bind)
				table.insert(imTable, temp)
				total = total + temp.num
			end
			table.sort(imTable, function(a,b) if a.bind > b.bind then return true elseif a.bind == b.bind and a.strengthen < b.strengthen then return true end end)
			itemlist[k] = imTable
			totalcnt[k] = total
		end
	end

	for k, v in pairs(cntTable) do
		if v > 0 then
			local itemTable = itemlist[k] or {}
			local total = totalcnt[k] or 0
			if table.getn(itemTable) == 0  then
				s_debugUser(uid, "装备合成时,背包中没有相应的道具2 baseid="..k)
				return 0
			end

			if total < v then
				s_debugUser(uid, "装备合成道具baseid="..k.."不足")
				return 0
			end

			local lastAllCnt = 0 --之前总数
			for i, m in ipairs(itemTable) do
				if m.num + lastAllCnt >= v then
					if v > lastAllCnt then
						m.num = v - lastAllCnt
						table.insert(delequip, m)
						break
					end
				else
					table.insert(delequip, m)
					lastAllCnt = lastAllCnt + m.num
				end
			end
		end
	end

	return 1
end

--生命储存仪
function OnRebuildLifeStoneEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,4313)
	end
end
--装备精炼
function OnRebuildEquipBaseAttrEvent(uid,targetid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1586)
	end
end
--装备重绑
function OnRebuildEquipBindAttrEvent(uid,targetid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1654)
	end
end
--装备打孔
function OnRebuildEquipHoleEvent(uid,targetid)
	AddRoleTaskOperate(uid,1764)
end
--装备镶嵌
function OnEquipInlayEvent(uid,targetid)
	AddRoleTaskOperate(uid,1765)
end
--装备五行修改
function OnModifyFivePropertyEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1587)
	end
end
--装备养成
function OnEquipGrowUpEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1766)
	end
end
--装备升级
function OnEquipLevelUpEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1767)
	end
end
--修改灵魂
function OnEquipSoulModifyEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1768)
	end
end
--修改孔激活属性
function OnEquipHoleModifyEvent(uid,success)
	if success > 0 then
		AddRoleTaskOperate(uid,1770)
	end
end
