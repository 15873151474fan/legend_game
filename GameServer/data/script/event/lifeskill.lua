--存矿石和药材
function OnStoreStoneDrug(uid)
	local msg = string.format([[请将欲存入的矿石、药材放入如下界面中]],RoleTaskInfo30002:getObjectName(uid,3))
	--ShowTaskPack(uid,"收集装备",msg,"确定","RoleTaskInfo30002:recycEquip($1,$2,$3,$4)" )
	ShowNinePack(uid,"存入",msg,"确定","CheckLifeSkillMaterial($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)")
end

function CheckLifeSkillMaterial(uid, item1, item2, item3, item4, item5, item6, item7, item8, item9)
	local itemlist = {}
	if item1 ~= 0 then table.insert(itemlist, item1) end
	if item2 ~= 0 then table.insert(itemlist, item2) end
	if item3 ~= 0 then table.insert(itemlist, item3) end
	if item4 ~= 0 then table.insert(itemlist, item4) end
	if item5 ~= 0 then table.insert(itemlist, item5) end
	if item6 ~= 0 then table.insert(itemlist, item6) end
	if item7 ~= 0 then table.insert(itemlist, item7) end
	if item8 ~= 0 then table.insert(itemlist, item8) end
	if item9 ~= 0 then table.insert(itemlist, item9) end

	for i = 1,table.getn(itemlist) do
		local thisid = itemlist[i]
		local level = s_getItemValue(uid,thisid,Item_Attribute_Level)
		local baseid = s_getitembaseid(uid,thisid)
		if baseid ~= 27112 and baseid ~= 55167 and baseid ~= 55168 and
			baseid ~= 27113 and baseid ~= 55169 and baseid ~= 55170 then
			s_sysInfo(uid,"有道具不在矿石、药材之列中，请重新筛选放入")
			return
		end
		local num = s_getItemValue(uid,thisid,Item_Data_Num)
		if s_deleteItemByThisID(uid,thisid,num,"存入生活技能道具") ~= VALUE_OK then
			return
		else
			--增加计数
			if baseid == 27112 then
				if level == 2 then
					num = 5*num
				elseif level == 3 then
					baseid = 55167
					num = 3*num
				elseif level == 4 then
					baseid = 55167
					num = 15*num
				elseif level == 5 then
					baseid = 55168
					num = 15*num
				end
			elseif baseid == 27113 then
				if level == 2 then
					num = 5*num
				elseif level == 3 then
					baseid = 55169
					num = 3*num
				elseif level == 4 then
					baseid = 55169
					num = 15*num
				elseif level == 5 then
					baseid = 55170
					num = 15*num
				end
			end
			if baseid == 27112 then s_setVar(uid,14,4,s_getVar(uid,14,4)+num) end
			if baseid == 55167 then s_setVar(uid,14,5,s_getVar(uid,14,5)+num) end
			if baseid == 55168 then s_setVar(uid,14,6,s_getVar(uid,14,6)+num) end
			if baseid == 27113 then s_setVar(uid,14,7,s_getVar(uid,14,7)+num) end
			if baseid == 55169 then s_setVar(uid,14,8,s_getVar(uid,14,8)+num) end
			if baseid == 55170 then s_setVar(uid,14,9,s_getVar(uid,14,9)+num) end
		end
	end
	s_sendLifeSkillInfo(uid,1)
end
