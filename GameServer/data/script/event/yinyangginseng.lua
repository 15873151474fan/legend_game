--摇钱树任务处理
function EventYinYangGinSeng(eventid,value1,value2,value3)
	--生成阴阳妖参npc
	if 1 then return end
	s_debug("阴阳参活动 >>> eventid %u,value1 %u,value2 %u,vlaue3 %u",eventid,value1,value2,value3)
	if value3 == 1 then
		local sceneid = HashSceneID(3,2)
		local posx = 55
		local posy = 63
		local baseid = 185
		--local baseid = 5704
		local npcid = s_sysSummon(baseid,sceneid,posx,posy,100,1)
	--	s_debug("阴阳妖参NPC >>>>>>>>>>>>> value3 %u, sceneid %u, baseid %u, posx %u,posy %u",value3,sceneid,baseid,posx,posy)
		if npcid == nil then
			s_error("阴阳妖参 NPC 生成错误 baseid [%u] sceneid [%u] posx [%u] posy [%u]",baseid,sceneid,posx,posy)
			return 0
		end
		s_setValue(SCENE_ENTRY_NPC,VALUE_TYPE,48 * 60 * 59)
	end
	if value3 == 2 then
		local sceneid = HashSceneID(3,2)
		local posx = 55
		local posy = 63
		local baseid = 185
		if next(s_getNpcByBaseID(sceneid,baseid)) ~= nil then
			local npcid =  s_clearNPCByBaseId(sceneid,baseid)
		--	s_debug("阴阳妖参删除NPC >>>>>>>>>>>>> value3 %u, sceneid %u, baseid %u, posx %u,posy %u",value3,sceneid,baseid,posx,posy)
			if npcid == RT_FAIL then
				s_error("阴阳妖参删除 NPC 错误 baseid [%u] sceneid [%u] posx [%u] posy [%u]",baseid,sceneid,posx,posy)
				return  0
			end
		end
	end
	return 1
end

function YinYangGinsengTaskGraw(uid,mapid,posx,posy,thisid)
	s_debug("阴阳妖参任务进行 uid %u, mapid %u, posx %u,posy %u,thisid %u",uid,mapid,posx,posy,thisid)
	--种植任务
	if 1 then return end

	local areainfo = ginsengareaDataBase
	local rewardinfo = ginsengRewardDataBase
	if areainfo == nil or rewardinfo == nil then
		s_error("阴阳妖参地图或奖品表配置读取失败 !!!")
		return
	end

	if 0 == s_getItemValue(uid,thisid,-2) then
		sys_info(uid,"阴阳妖参活动道具错误",ChatPos_Tips)
		s_debug("阴阳妖参无法获得道具的baseid uid %u ",uid)
		return VALUE_FAIL
	end
	local finalarea = {}
	local finalreward = {}
	local finalrewardstr = ""

	for k,v in ipairs(areainfo) do
		if posx >= v.MinX and posx <= v.MaxX and posy >= v.MinY and posy <= v.MaxY and mapid == v.mapid then
			table.insert(finalarea,v)
		end
	end

	math.randomseed((os.time() %10) * posx)
	local ratenum = math.random(1,1000000) --配置表中最大值

	math.randomseed((os.time() %100) * posx * posy)
	local rewardrate = math.random(1,1000000) --配置表中最大值
	local rewardlevel = 0
	local rewardid = 0
	local itemlist = nil
	local rewardnum = 0
	local rewardidandnum = {}
	if next(finalarea) == nil then
		s_sysInfo(uid,"您种植的地图或坐标位置不符合要求",ChatPos_Tips)
		s_debug("阴阳妖参地图及坐标不合法 mapid %u uid %u x %u y %u",mapid,uid,posx,posy)
		return VALUE_FAIL
	else
		if 0 <  ratenum and ratenum <=finalarea[1].rank1pro then
			rewardlevel = 1
		end
		if finalarea[1].rank1pro < ratenum and ratenum <=finalarea[1].rank2pro then
			rewardlevel = 2
		end
		if finalarea[1].rank2pro < ratenum and ratenum <=finalarea[1].rank3pro then
			rewardlevel = 3
		end
		if finalarea[1].rank3pro < ratenum and ratenum <=finalarea[1].rank4pro then
			rewardlevel = 4
		end
		if rewardlevel == 0 then
			rewardlevel = 1
		end
	end

	for k,v in ipairs(rewardinfo) do
		if v.rank == rewardlevel then
			table.insert(finalreward,v)
		end
	end
	if finalreward == nil then
		s_debug("阴阳妖参未根据奖励级别找到奖励信息 rewardlevel = %u",rewardlevel)
	else
		for k,v in ipairs(finalreward) do
			if rewardrate <= v.pro then
				rewardid = v.id
				finalrewardstr = v.award
			end
		end
	end

	local id1,id2,id3,id4,id5,id6,id7,id8,id9,id10,num1,num2,num3,num4,num5,num6,num7,num8,num9,num10=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	if finalrewardstr ~= nil then
		if s_deleteItemByThisID(uid,thisid,1,"妖参种植") ~= VALUE_OK then
			s_debug("背包中阴阳妖参活动道具删除失败 uid %u",uid)
			sys_info(uid,"阴阳妖参活动道具使用错误",ChatPos_Tips)
			return VALUE_FAIL
		else
			--s_setVar(uid,169,4,2);
			--s_setVar(uid,169,5,xxx);
			s_debug("奖励内容 : %s",finalrewardstr)
			itemlist = loadstring("return " .. finalrewardstr)()
			if itemlist == nil or #itemlist == 0  then
				s_debug("奖励内容解析失败 >>>> %u ",uid)
				return VALUE_FAIL
			else
				for i,item in ipairs(itemlist) do
					local tmp = {}
					if item[3] ~= 0 then
						--s_addItem(uid,item[1],item[2],item[3],item[4],item[5],"阴阳妖参任务奖励",0,AddItemAction_Task_Add)
						local tmp  = {}
						tmp.id = item[1]
						tmp.num = item[3]
						s_debug("奖励内容解析baseid %u num %d ",item[1],item[3])
						table.insert(rewardidandnum,tmp)
						rewardnum = rewardnum + 1
					end
				end

				for k,v in ipairs(rewardidandnum) do
					if k ==1 then
						id1 = v.id
						num1 = v.num
					elseif k == 2 then
						id2 = v.id
						num2 = v.num
					elseif k == 3 then
						id3 =v.id
						num3 = v.num
					elseif k == 4 then
						id4 = v.id
						num4 = v.num
					elseif k == 5 then
						id5 = v.id
						num5 = v.num
					elseif k == 6 then
						id6 = v.id
						num6 = v.num
					elseif k == 7 then
						id7 = v.id
						num7 = v.num
					elseif k == 8 then
						id8 = v.id
						num8 = v.num
					elseif k == 9 then
						id9 = v.id
						num9 = v.num
					elseif k == 10 then
						id10 = v.id
						num10 = v.num
					end
				end
				GetRewardWithMail(uid,finalrewardstr,"阴阳妖参任务奖励",1,false,AddItemAction_Task)
				s_sendGinsengInfo(uid,1,rewardlevel,rewardnum,id1,num1,id2,num2,id3,num3,id4,num4,id5,num5,id6,num6,id7,num7,id8,num8,id9,num9,id10,num10)
				s_refreshDayTaskNum(uid,1901,s_getVar(uid,169,1))
			end

		end
	end


    --if(s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 1 ) then
    --    s_sysInfo(uid,"请先升到55级再来接取",ChatPos_Tips)
    --    return;
    --end
    --是否是任务第一次玩,第一次玩不扣次数
    --local bfirst = 0;

end

function GetYinYangGinsengTask(uid)
	if 1 then return end
	s_debug("GetYinYangGinsengTask uid %u",uid)
	local week = s_getCurTime(5)
	if week == 0 or week == 6 then
	else
        s_sysInfo(uid,"活动还没有开启!!!",ChatPos_Tips)
        return
	end
    if s_getVar(uid,169,1) >= 3  then
        s_sysInfo(uid,"今天已经完成3次阴阳妖参任务啦，还有更多精彩内容等着你哦",ChatPos_Tips)
        return
    end
	if s_getItemNumByBaseID(uid,1101,0) > 0 then
        s_sysInfo(uid,"背包中存在任务道具 ！！",ChatPos_Tips)
		--s_debug("阴阳妖参任务背包中任务物品数量 : %u ",uid)
        return
	end
	local itemid = s_addItem(uid,1101,0,1,0,"1-1","接取阴阳妖参任务获得道具",0,AddItemAction_Task_Add)
	if itemid ~= nil then
		s_setVar(uid,169,1,s_getVar(uid,169,1) + 1);
		s_setVar(uid,169,4,1)
		s_setVar(uid,169,5,0)
		s_sysInfo(uid,"任务阴阳妖参接取成功 !!! ",ChatPos_Tips)
		s_debug("阴阳妖参任务添加物品 id %u",itemid)
		return
	else
		s_sysInfo(uid,"任务接取失败",ChatPos_Tips)
		s_debug("阴阳妖参任务接取失败 uid %u",uid)
        return
	end
end

function GetYinYangGinsengDailyInfo(uid, outvec)
	if outvec == nil then return end
	local week = s_getCurTime(5)
	if week == 0 or week == 6 then
	--taskid
	table.insert(outvec, 1901)
	--dayeNum
	table.insert(outvec, 3)
	--dayNoneNum
	table.insert(outvec, s_getVar(uid,169,1))
	--weekNum
	table.insert(outvec, 0)
	--WeekDoneNum
	table.insert(outvec, 0)
	end
end

