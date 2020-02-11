--玩家获得物品事件
function OnGetItemEvent(uid,baseid,itemid)
	if GetItemEventTable == nil or GetItemEventTable[baseid] == nil then
		return
	end
	for i =1 , table.getn(GetItemEventTable[baseid]) do
		local fun = GetItemEventTable[baseid][i]
		if type(fun) == "function" then
			fun(uid,itemid)
		elseif type(fun) == "string" then
			local call = StringToFunction(fun)
			if call ~= nil then
				call(uid,baseid,itemid)
			end
		end
	end
end

function RegisterGetItemEvent(itembaseid,callback)
	if GetItemEventTable == nil then
		GetItemEventTable = {}
	end
	if GetItemEventTable[itembaseid] == nil then
		GetItemEventTable[itembaseid] = {}
	end
	table.insert(GetItemEventTable[itembaseid],callback)
	return VALUE_OK
end

--移动物品事件
function OnMoveItemEvent(ptype, uid, baseid, itemid)
	if MoveItemEventTable == nil or MoveItemEventTable[baseid] == nil then
		return
	end

	for i = 1, table.getn(MoveItemEventTable[baseid]) do
		local fun = MoveItemEventTable[baseid][i]
		if type(fun) == "function" then
			fun(ptype, uid, baseid)
		elseif type(fun) == "string" then
			local call = StringToFunction(fun)
			if call ~= nil then
				call(ptype, uid, baseid, itemid)
			end
		end
	end
end

function RegisterMoveItemEvent(itembaseid,callback)
	if MoveItemEventTable == nil then
		MoveItemEventTable = {}
	end
	if MoveItemEventTable[itembaseid] == nil then
		MoveItemEventTable[itembaseid] = {}
	end
	table.insert(MoveItemEventTable[itembaseid],callback)
	return VALUE_OK
end

--神戒表
GodRingTable =
{
	{50701,50702,50703,50704,50705,50706,50707,50708},
	{50801,50802,50803,50804,50805,50806,50807,50808},
	{50901,50902,50903,50904,50905,50906,50907,50908},
}

function GetGodRingItem(uid, baseid, itemid)
	s_debug(""..uid.."获得"..baseid)
	local base = 0
	if baseid >= 50700 and baseid < 50800 then
		base = 50700
	elseif baseid >= 50800 and baseid < 50900 then
		base = 50800
	elseif baseid >= 50900 and baseid < 51000 then
		base = 50900
	end

	if base == nil or base == 0 then
		s_debug("神戒道具配置错误"..baseid)
		return
	end

	if s_openServiceDay() <= 7 then
		s_setVar(uid, 158, enumServerSportType_GodRing, baseid % base)
	end
end

for k,baselist in ipairs(GodRingTable) do
	for i, v in ipairs(baselist) do
		RegisterGetItemEvent(v,"GetGodRingItem($1,$2,$3)")
	end
end

--圣兽遗宝
JiZiItemTable = {260001,260002,260003,260004,260005,260006,260007,260008}

--主背包中增加上述道具时
function GetJiZiItem(uid, baseid, itemid)
	s_getJiZiItemEvent(uid, baseid, enumPaySubType_JiZiActivity)
end

function MoveJiZiItem(ptype, uid, baseid, itemid)
	if ptype == PACKAGETYPE_MAIN then
		s_getJiZiItemEvent(uid, baseid, enumPaySubType_JiZiActivity)
	end
end

for k,v in ipairs(JiZiItemTable) do
	RegisterGetItemEvent(v, "GetJiZiItem($1,$2,$3)")
	RegisterMoveItemEvent(v, "MoveJiZiItem($1,$2,$3,$4)")
end
