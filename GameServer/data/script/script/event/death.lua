--===================================================
--lostItem(userid,packtype,percent,minnum,maxnum,hat)
--===================================================
function OnPlayerDeathEvent(userid,dtype,new_user_buf)
	---死亡掉落
	local murdertype = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MURDER_TYPE)
	local murderid = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MURDER_ID)
    --被怪物杀死不掉装备
	if murderid == 0 or murderid == nil or murdertype == SCENE_ENTRY_NPC then
		return
	end

	local goodvalue = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_GOODVALUE)
--	if goodvalue == 0 then
--		return
--	end
	--测试开关，0：关闭，1开启全掉落

		local alldrop = 0
		if alldrop == 1 then
			s_lostItemAll(userid,PACKAGETYPE_EQUIP,100,1,1,0,murderid)	--神装
			s_lostItemAll(userid,PACKAGETYPE_EQUIP,100,1,1,1,murderid)	--战装
			s_lostItemAll(userid,PACKAGETYPE_MAIN,100,1,1,0,murderid)
		end	

	
	
	
	local i=math.random(1,10000);
	local j=math.random(1,10000);
--    if goodvalue > 0 then
		if i < 500 then
			if	j < 1500 then
				s_lostItem(userid,PACKAGETYPE_EQUIP,100,1,1,0,murderid)
			elseif j < 5000 then
				s_lostItem(userid,PACKAGETYPE_EQUIP,100,1,1,1,murderid)--最后一个参数(1:普通装备，2：神装)
			else
--			if	j < 1500 then
--			s_debug("333333333333")
--				s_lostItem(userid,PACKAGETYPE_EQUIP,100,1,1,0,murderid)
--			elseif j < 5000 then
--			s_debug("444444444444")
--				s_lostItem(userid,PACKAGETYPE_EQUIP,100,1,1,1,murderid)--最后一个参数(1:普通装备，2：神装)
--			else
--			s_debug("5555555555555")
				s_lostItem(userid,PACKAGETYPE_MAIN,100,1,1,0,murderid)
			end
		end
--	end
	--[[
	local murderhomeland = s_getValue(SCENE_ENTRY_PLAYER,murderhomeland,VALUE_TYPE_HOMELAND)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_HOMELAND)
	if murdertype == SCENE_ENTRY_PLAYER then
	if murderhomeland ~= homeland then
	s_sysInfo(murderid,"101,78 = " .. s_getVar(murderid,101,78))
	s_sysInfo(murderid,"process = " .. s_getTaskValue(murderid,s_getVar(murderid,101,78),TaskValue_Process))
	if s_getVar(murderid,101,78) / 10 == 5010 and s_getTaskValue(murderid,s_getVar(murderid,101,78),TaskValue_Process) == TaskProcess_Doing then
	AddRoleTaskOperate(murderid,s_getVar(murderid,101,78))
	end
	end
	end
	]]

	--掉落镖车物资
	--local rand = math.random(1,100)
	--if rand <= 50 then
		--local list = s_dropItem(userid, 31488, 0, 0, 0, "死亡掉落")
		--if list ~= nil then
			--for i=1, table.getn(list), 1 do
				--local owner = s_getItemValue(0,list[i],Item_Attribute_Guard_Owner)
				--if owner == nil then owner = 0 end
				--s_setSceneItemValue(list[i],2,4)
				--s_setSceneItemValue(list[i],3,owner)
				--s_refreshSceneItem(list[i],2);
			--end
		--end
	--end
	--local rand1 = math.random(1,100)
	--if rand1 <= 50 then
		--list = s_dropItem(userid, 31489, 0, 0, 0, "死亡掉落")
		--if list ~= nil then
			--for i=1, table.getn(list), 1 do
				--local owner = s_getItemValue(0,list[i],Item_Attribute_Guard_Owner)
				--if owner == nil then owner = 0 end
				--s_setSceneItemValue(list[i],2,4)
				--s_setSceneItemValue(list[i],3,owner)
				--s_refreshSceneItem(list[i]);
			--end
		--end
	--end
	--list = s_dropItem(userid, 31548, 0, 0, 0, "死亡掉落")
	--if list ~= nil then
		--for i=1, table.getn(list), 1 do
			--local owner = s_getItemValue(0,list[i],Item_Attribute_Guard_Owner)
			--if owner == nil then owner = 0 end
			--s_setSceneItemValue(list[i],2,4)
			--s_setSceneItemValue(list[i],3,owner)
			--s_refreshSceneItem(list[i]);
		--end
	--end

	----特定BOSS杀人后回血
	--if murdertype == SCENE_ENTRY_NPC then
		--local baseid = s_getValue(SCENE_ENTRY_NPC,murderid,VALUE_TYPE_BASE_ID)
		--if baseid ~= nil and baseid >= 20001 and baseid <= 20010 then
			--local addhp = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MAXHP)
			--s_addValue(SCENE_ENTRY_NPC,murderid,VALUE_TYPE_HP,addhp)
		--end
	--end
	--if new_user_buf == 1 then
		--local buflevel = s_getbufflevel(SCENE_ENTRY_PLAYER,userid,124);
		--if(buflevel >= 1) then
			--s_removebuff(SCENE_ENTRY_PLAYER,userid,124)
		--end
		--s_addbuff(SCENE_ENTRY_PLAYER,userid,124,buflevel + 1,60)
	--end
end

