--////////////////////////////////////////////////////////////////
--////一些杂项的数据配置的定义
--///////////////////////////////////////////////////////////////

--需要检查在npc附近的操作定义
CheckNearNpc =
{
	--{optype,{npc list}}
	{id = 1,op = NearNpcOperate_Store,npc = {116}},
	{id = 2, op = NearNpcOperate_Auction,npc = {1}},
}
function CheckNeedNearNpc(uid,op)
	local i;
	for i = 1, table.getn(CheckNearNpc) do
		if op == CheckNearNpc[i].op then
			local j;
			for j = 1,table.getn(CheckNearNpc[i].npc) do
				if s_checkNearNpc(uid,CheckNearNpc[i].npc[j]) == VALUE_OK then
					return VALUE_OK
				end
			end
		end
	end
	return VALUE_FAIL
end
