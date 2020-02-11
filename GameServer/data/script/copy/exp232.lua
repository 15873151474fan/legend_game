--经验副本
defencetower_begin_time           = 1;        --活动开始时间
defencetower_over_time                = 2;        --活动结束时间
defencetower_monster_current      = 3;   --怪物当前波数
defencetower_monster_total        = 4;    --怪物总共波数
defencetower_beging               = 5;       --是否刷怪中
defencetower_is_over              = 6;      --是否已结束
defencetower_recycle_over         = 7;      --回收倒计时,胜利或失败的缓冲时间，然后清理玩家出副本
defencetower_issend               = 8;  --是否已经发送过奖励
defencetower_leave_time		  = 9;

CopySceneInfo_232 =
{
        --初始化副本的操作
        initcopy =
        {
        action =
        {
            --{s_copySummonNpc,{7500,1,25,12,103,1}},
        },
        },
    --路线怪物
    --route1_monster = {[1]={8300},[2]={8301},[3]={}    ,[4]={8302},[5]={8303},[6]={}    ,[7]={8304},[8]={8305},[9]={}    ,[10]={8306},[11]={8307},[12]={}    ,[13]={8308},[14]={8309},[15]={}    ,},
    --route2_monster = {[1]={8330},[2]={8331},[3]={8501},[4]={8332},[5]={8333},[6]={8502},[7]={8334},[8]={8335},[9]={8503},[10]={8336},[11]={8337},[12]={8504},[13]={8338},[14]={8339},[15]={8505},},
    --route3_monster = {[1]={8360},[2]={8361},[3]={}    ,[4]={8362},[5]={8363},[6]={}    ,[7]={8364},[8]={8365},[9]={}    ,[10]={8366},[11]={8367},[12]={}    ,[13]={8368},[14]={8369},[15]={}    ,},

    route1_monster = {[1]={22010},[2]={22014},[3]={22018},[4]={22022},[5]={22026},[6]={22030},[7]={22034},},
    route2_monster = {[1]={22011},[2]={22015},[3]={22019},[4]={22023},[5]={22027},[6]={22031},[7]={22035},},
    route3_monster = {[1]={22012},[2]={22016},[3]={22020},[4]={22024},[5]={22028},[6]={22032},[7]={22036},},
    route4_monster = {[1]={22013},[2]={22017},[3]={22021},[4]={22025},[5]={22029},[6]={22033},[7]={22037},},

    --route1_monster = {[1]={8320},[2]={8321},[3]={}    ,[4]={8322},[5]={8323},[6]={}    ,[7]={8324},[8]={8325},[9]={}    ,[10]={8326},[11]={8327},[12]={}    ,[13]={8328},[14]={8329},[15]={}    ,},
    --route2_monster = {[1]={8350},[2]={8351},[3]={8511},[4]={8352},[5]={8353},[6]={8512},[7]={8354},[8]={8355},[9]={8513},[10]={8356},[11]={8357},[12]={8514},[13]={8358},[14]={8359},[15]={8515},},
    --route3_monster = {[1]={8380},[2]={8381},[3]={}    ,[4]={8382},[5]={8383},[6]={}    ,[7]={8384},[8]={8385},[9]={}    ,[10]={8386},[11]={8387},[12]={}    ,[13]={8388},[14]={8389},[15]={}    ,},

    --每条线路怪物出生点
    route1_new_pos = {23,11},
    route2_new_pos = {30,15},
    route3_new_pos = {23,21},
    route4_new_pos = {15,16},
	npc_pos = {[22100]={23,15},[22101]={24,15},[22102]={24,16},[22103]={24,17},[22104]={23,17},[22105]={22,17},[22106]={22,16},[22107]={22,15},[22108]={23,15},[22109]={24,15},[22110]={24,16},[22111]={24,17},[22112]={23,17},[22113]={22,17},[22114]={22,16},[22115]={22,15},[22116]={23,15},[22117]={24,15},[22118]={24,16},[22119]={24,17},[22120]={23,17},[22121]={22,17},[22122]={22,16},[22123]={22,15}}
}

function CopySceneInfo_232:InitCopyScene(cid)
        s_setSceneVar(cid,1,defencetower_over_time,s_getCurTime(TIME_ALLSECONDS) + 900)
    --
    s_setSceneVar(cid,1,defencetower_first_time,3)
    s_setSceneVar(cid,1,defencetower_leave_time,3)
	
		local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
		for i = 1,table.getn(list), 2 do --清理NPC
			local baseid = s_getValue(SCENE_ENTRY_NPC,list[i+1],VALUE_TYPE_BASE_ID)
			s_debug("打印-----------"..baseid)
    		end
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, 910000000)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, 910000000)
end

function CopySceneInfo_232:ClearNpc(cid)
    --清空npc
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    for i = 1,table.getn(list), 2 do --清理NPC
        s_clearNpc(list[i+1])
    end
end
--[[function sendExpCopyRewardInfo(uid,mapid)
	local bakinfo = ExpDungeonDataBase.query(s_getVar(uid,470,1)+1)
	if s_getVar(uid,470,2) == 1 then
		return 
	end
	if uid == 0 then
		return 
	end
	if bakinfo == nil then
		return 
	end
	if mapid == 241 then
		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp1,bakinfo.expStone)
	elseif mapid == 242 then
		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp2,bakinfo.expStone)
	elseif mapid == 243 then
		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp3,bakinfo.expStone)
	elseif mapid == 244 then
		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp4,bakinfo.expStone)
	elseif mapid == 245 then
		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp5,bakinfo.expStone)
	end
	s_setVar(uid,476,1,1)
end--]]
function OnLoopCopyScene_1Sec_232(ctype,cid)
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    --检测活动时间结束
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	if list == 0 then
		CopySceneInfo_232:ClearNpc(cid)
		s_clearCopy(cid)
	end
        local uid = 0
        for i = 1,table.getn(list), 2 do
                if list[i] == SCENE_ENTRY_PLAYER then
                        uid = list[i+1]
                end
        end
	if s_getVar(uid,476,1) == 1 then
		CopySceneInfo_232:ClearNpc(cid)
	end
        if s_getVar(uid,470,2) == 1 then
			--local tm = s_getSceneVar(cid,1,defencetower_leave_time)
			--if tm ~= 0 then
			--	s_copyInfo(cid,"离开副本倒计时:" ..tm,ChatPos_Tips)
			--end
			--s_setSceneVar(cid,1,defencetower_leave_time,tm-1)
			--if tm == 0 then
                		CopySceneInfo_232:ClearNpc(cid)
                		s_clearCopy(cid)
			--end
        end
        if curtime == s_getSceneVar(cid,1,defencetower_over_time) and s_getSceneVar(cid,1,defencetower_is_over) == 0 then
                s_setSceneVar(cid,1,defencetower_is_over,1)
--		s_debug("奖励波数--------"..s_getVar(uid,470,1))
		if s_getSceneVar(cid,1,defencetower_issend) == 0 then
			local bakinfo = ExpDungeonDataBase.query(s_getVar(uid,470,1)+1)
			if uid == 0 then
				return 
			end
        		if bakinfo == nil then
				return
        		else
                		s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp1,bakinfo.expStone)
        		end
                		CopySceneInfo_232:ClearNpc(cid)
			s_setSceneVar(cid,1,defencetower_issend,1)
		end
        end
    --准备时间
    if s_getSceneVar(cid,1,defencetower_first_time) > 0 and s_getVar(uid,476,1) == 0 then
        local curtime = s_getSceneVar(cid,1,defencetower_first_time)
        s_copyInfo(cid,"开始倒计时:" ..curtime,ChatPos_Tips)
        s_setSceneVar(cid,1,defencetower_first_time,curtime-1)
        if curtime  == 1 then
            s_setSceneVar(cid,1,defencetower_isbegin,1)
	    s_setSceneVar(cid,1,defencetower_first_time,0)
        end
    end
    --开始刷怪
    if s_getSceneVar(cid,1,defencetower_isbegin) == 1 and s_getSceneVar(cid,1,defencetower_is_over) == 0 and s_getSceneVar(cid,1,defencetower_monster_current) <= 5 and curtime < s_getSceneVar(cid,1,defencetower_over_time) and s_getVar(uid,476,1) == 0 then
        if s_getSceneVar(cid,1,defencetower_monster_current) == 0 then
            s_setSceneVar(cid,1,defencetower_monster_current,1)
        end
        CopySceneInfo_232:beginRefreshMonster(s_getSceneVar(cid,1,defencetower_monster_current),cid)
           s_setVar(uid,470,1,s_getSceneVar(cid,1,defencetower_monster_current)-1)  --已经打了几波 
        s_debug("开始刷怪,当前波数:"..s_getSceneVar(cid,1,defencetower_monster_current))
    end

    local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
    if monstercount == 0 and s_getSceneVar(cid,1,defencetower_monster_current) ~= 0 and s_getSceneVar(cid,1,defencetower_monster_current) <= 5 and curtime < s_getSceneVar(cid,1,defencetower_over_time) then
            local current = (s_getSceneVar(cid,1,defencetower_monster_current) + 1)
                        s_debug("波数..."..current)
			if uid ~= 0 and s_getVar(uid,476,1) == 0 then
				s_sendCopyCustomTime(cid,s_getVar(uid,470,1)+1,5)
			end
            if current > 5 then
		s_debug("停止刷新")
		if(s_getVar(uid,470,1) == 4) then
			s_setVar(uid,470,1,5)
		end
		s_setSceneVar(cid,1,defencetower_is_over,1)
		if s_getSceneVar(cid,1,defencetower_issend) == 0 and s_getVar(uid,476,1) == 0 then
                	local bakinfo = ExpDungeonDataBase.query(s_getVar(uid,470,1)+1)
--			s_debug("----------发送奖励"..bakinfo.exp.."-------"..bakinfo.loseExp)
	if uid == 0 then
		return 
	end
        if bakinfo == nil then
		return 
        else
                s_sendClientExpreward(uid,bakinfo.exp,bakinfo.loseExp1,bakinfo.expStone)
		--s_addDailyTargetTime(uid, enumDailySubTargetType_CopySceneExp, 1)
		s_debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进了材料副本每日目标")
        end
			s_setSceneVar(cid,1,defencetower_issend,1)
                		CopySceneInfo_232:ClearNpc(cid)
		end
	    end
            	s_setSceneVar(cid,1,defencetower_monster_current,current)
            	s_setSceneVar(cid,1,defencetower_isbegin,1)
    end
    --检测是否进行下一波刷怪

end
--玩家复活
function CopySceneInfo_232:OnPlayerRelive(uid, rtype)
        if rtype == 3 or rtype == 4 then
                s_goto(SCENE_ENTRY_PLAYER,uid,11,21)
        end
end
--[[
--领取奖励
function sendExpReward(uid,itemid,exp)
        local num = s_getVar(uid,470,1)
	if itemid ~= 0 then
        	s_addItem(uid,itemid,0,1,0,"1-1","经验副本奖励")
	end
        s_refreshExp(uid,exp,32,0)
        s_setVar(uid,470,2,1)
        s_setVar(uid,470,1,0)
        s_copyInfo(uid,"领取经验副本奖励成功")
end
--]]
--召唤守卫
function CopySceneInfo_232:RefreshNpc(typeid,cid,uid)
	s_debug("召唤兽为")
	if typeid == 4 then
		s_getVar(uid,474,1)
		s_sendZhaohuanSuc(uid,s_getVar(uid,474,1))
	end
        if typeid == 1 then
                local num = 0
                local tab = {}
                local nulltab = {}
                for i=1,24,1 do
                local flag = 0
                        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
                         for k = 1,table.getn(list), 2 do --清理NPC
				local baseid = s_getValue(SCENE_ENTRY_NPC,list[k+1],VALUE_TYPE_BASE_ID)
                                 if baseid == 22099+i then
                                        num = num + 1
                                        flag = 1
                                end
                        end
                        if flag ~= 1 then
                                table.insert(nulltab,22099+i)
                        end
                end
                if num == 8 then
                        s_copyInfo(cid,"守卫已放满，无法继续放置守卫",ChatPos_Tips)
                        return
                else
                        table.sort(nulltab)
                        if s_getVar(uid,474,1) >= 10 then
                                s_copyInfo(cid,"副本免费召唤次数已经用完",ChatPos_Tips)
				return 
                        end
                        local npcid = s_sysSummon(nulltab[1],cid,self.npc_pos[nulltab[1]][1],self.npc_pos[nulltab[1]][2],1006,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
			s_debug("iiiiiii"..self.npc_pos[nulltab[1]][1].."0000000"..self.npc_pos[nulltab[1]][2])
                        s_setVar(uid,474,1,s_getVar(uid,474,1)+1)
                        s_sendZhaohuanSuc(uid,s_getVar(uid,474,1))
                end
        elseif typeid == 2 then
                local num = 0
                local nulltab = {}
		local super = {}
                local reset = {}
		local tab = {}
                local flag = 0
                local num2 = 0
                for i=1,24,1 do
                local flag = 0
                        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
                         for k = 1,table.getn(list), 2 do --清理NPC
				local baseid = s_getValue(SCENE_ENTRY_NPC,list[k+1],VALUE_TYPE_BASE_ID)
                                 if baseid == 22099+i then
					num = num + 1
                                        flag = 1
					if baseid <= 22107 then
                                                table.insert(reset,list[k+1])
                                        end
                                        if baseid > 22107 then
                                                num2 = num2 + 1
                                        end
                                                table.insert(tab,baseid)
                                end
                        end
			if flag ~= 1 and i+22099 > 22107 and i+22099 <= 22115 then
                                s_debug("super")
                                table.insert(super,i+22099)
                        end
                        if flag ~= 1 and i <= 22107 then
						s_debug("nulltab")
                                table.insert(nulltab,22099+i)
                        end
                end
                if num2 == 8 then
                        s_copyInfo(cid,"守卫已放满，无法继续放置守卫",ChatPos_Tips)
                        return
                elseif num < 8 then
                        table.sort(nulltab)
			
			for i=#tab,1,-1 do 
				local f = 0
				for k=#nulltab,1,-1 do
					if k ~= 0 and i ~= 0 then
					if self.npc_pos[nulltab[k]][1] == self.npc_pos[tab[i]][1] and self.npc_pos[nulltab[k]][2] == self.npc_pos[tab[i]][2] then
						s_debug("id"..k)
						table.remove(nulltab,k)
					end
					end
				end
			end
			table.sort(nulltab)
                	local npcid = s_sysSummon(super[1],cid,self.npc_pos[nulltab[1]][1],self.npc_pos[nulltab[1]][2],1006,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
			s_removeMoney(uid,MoneyType_Money,10,"召唤守卫扣除")
                elseif num == 8 and num2 < 8 then
                        table.sort(reset)
			local baseid = s_getValue(SCENE_ENTRY_NPC,reset[1],VALUE_TYPE_BASE_ID)
                        s_clearNpc(reset[1])
			table.sort(super)
			s_debug("-------uuuuu"..self.npc_pos[baseid][1].."ooooooooo"..self.npc_pos[baseid][2])
			local npcid = s_sysSummon(super[1],cid,self.npc_pos[baseid][1],self.npc_pos[baseid][2],1006,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
			s_removeMoney(uid,MoneyType_Money,10,"召唤守卫扣除")
		end
        elseif typeid == 3 then
                local num = 0
                local nulltab = {}
		local super = {}
		local reset = {}
		local tab = {}
                local num2 = 0
                local num3 = 0
                for i=1,24,1 do
                	local flag = 0
                        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
                         for k = 1,table.getn(list), 2 do --清理NPC
				local baseid = s_getValue(SCENE_ENTRY_NPC,list[k+1],VALUE_TYPE_BASE_ID)
                                 if baseid == 22099+i then
                                        num = num + 1
					if baseid <= 22115 then
						table.insert(reset,list[k+1])
					end
                                        flag = 1
                                        if baseid > 22107 then
                                                num2 = num2 + 1
                                        end
                                        if baseid > 22115 then
                                                num3 = num3 + 1
                                        end
						table.insert(tab,baseid)
                                end
                        end
			if flag ~= 1 and i+22099 > 22115 then
				s_debug("super")
				table.insert(super,i+22099)
			end
                        if flag ~= 1 and i+22099 <= 22115 then
				s_debug("nulltab")
                                table.insert(nulltab,i+22099)
                        end
                end
                if num3 == 8 then
                        s_copyInfo(cid,"守卫已放满，无法继续放置守卫",ChatPos_Tips)
                        return
                end
                if num < 8 then
                        table.sort(nulltab)
			for i=#tab,1,-1 do 
				local f = 0
				for k=#nulltab,1,-1 do
					if k ~= 0 and i ~= 0 then
					if self.npc_pos[nulltab[k]][1] == self.npc_pos[tab[i]][1] and self.npc_pos[nulltab[k]][2] == self.npc_pos[tab[i]][2] then
						s_debug("id"..k)
						table.remove(nulltab,k)
					end
					end
				end
			end
			table.sort(nulltab)
                        local npcid = s_sysSummon(super[1],cid,self.npc_pos[nulltab[1]][1],self.npc_pos[nulltab[1]][2],1006,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
			s_debug("iiiiiii"..self.npc_pos[nulltab[1]][1].."0000000"..self.npc_pos[nulltab[1]][2])
			s_removeMoney(uid,MoneyType_Gold,10,"召唤守卫扣除")
                elseif num == 8 and num3 < 8 then
			table.sort(reset)
			local baseid = s_getValue(SCENE_ENTRY_NPC,reset[1],VALUE_TYPE_BASE_ID)
			s_clearNpc(reset[1])
			table.sort(super)
			s_debug("-------uuuuu"..self.npc_pos[baseid][1].."ooooooooo"..self.npc_pos[baseid][2])
                        local npcid = s_sysSummon(super[1],cid,self.npc_pos[baseid][1],self.npc_pos[baseid][2],1006,1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
			s_removeMoney(uid,MoneyType_Gold,10,"召唤守卫扣除")
		end
        end
	local swnum = 0
	local plist = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
	for k = 1,table.getn(plist), 2 do
            local baseid = s_getValue(SCENE_ENTRY_NPC,plist[k+1],VALUE_TYPE_BASE_ID)
            if baseid >= 22100 and baseid <= 22123 then
                swnum = swnum + 1;
            end
        end
        s_sendCopyCustomTime(cid,swnum,6)
end

--玩家进入副本提示
function CopySceneInfo_232:OnPlayerIntoCopyScene(cid,uid)
	s_addDailyTargetTime(uid, enumDailySubTargetType_CopySceneExp, 1)
        local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
        local uid = 0
        for i = 1,table.getn(list), 2 do
                if list[i] == SCENE_ENTRY_PLAYER then
                        uid = list[i+1]
                end
        end
        s_setVar(uid,470,2,0)
	s_setVar(uid,470,1,0)
        s_setVar(uid,474,1,0)
	s_setVar(uid,476,1,0)
        s_setVar(uid,473,1,s_getVar(uid,473,1)+1)
	RefreshCopyDailyInfo(uid)
    local overtime = s_getSceneVar(cid,1,defencetower_over_time) - s_getCurTime(TIME_ALLSECONDS)
    s_sendCopyTime(cid,overtime);
    --通知客户端当前波数
    local curnumber = s_getSceneVar(cid,1,defencetower_monster_current)
    s_sendCopyCustomTime(cid,curnumber,1)
    s_sendCopyCustomTime(cid,5,4)
    s_sendCopyCustomTime(cid,2,8)
    s_setVar(uid,470,3,1)
--        for i=1,8,1 do
--		local n = 22099+i 
  --              local npcid = s_sysSummon(n, cid, self.npc_pos[n][1] , self.npc_pos[n][2], 1006, 1)
--		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
  --      end
end

--刷怪函数(curnumber-->当前第几波)
function CopySceneInfo_232:beginRefreshMonster(curnumber,cid)
    s_debug("beginRefreshMonster..curnumber="..curnumber)
    --大于15波不再刷
    if curnumber > 5 then
        return;
    end
    --通知客户端当前波数
    s_sendCopyCustomTime(cid,curnumber,1)
    --第一路线怪(每次刷20只)
    if  self.route1_monster[curnumber] ~= nil then
        --for i=1,table.getn(self.route1_monster[curnumber]),1 do
        local npcbaseid = self.route1_monster[curnumber][1]
        if npcbaseid ~= nil  then
            for i=1,10,1 do
                s_sysSummon(npcbaseid,cid,self.route1_new_pos[1],self.route1_new_pos[2],1063,1)
            end
        end
    end
    --第二路线怪
    if  self.route2_monster[curnumber] ~= nil then
        --如果是第三波只刷一只
        local npcbaseid=self.route2_monster[curnumber][1]
            --for i=1,table.getn(self.route2_monster[curnumber]),1 do
            if npcbaseid ~= nil  then
                for i=1,10,1 do
                    s_sysSummon(npcbaseid,cid,self.route2_new_pos[1],self.route2_new_pos[2],1063,1)
                end
            end

    end
    --第三路线
    if self.route3_monster[curnumber] ~= nil  then
        --for i=1,table.getn(self.route3_monster),1 do
        local npcbaseid=self.route3_monster[curnumber][1]
        if  npcbaseid ~= nil then
            for i=1,10,1 do
                s_sysSummon(npcbaseid,cid,self.route3_new_pos[1],self.route3_new_pos[2],1063,1)
            end
        end
    end
    --第四路线
    if self.route4_monster[curnumber] ~= nil  then
        --for i=1,table.getn(self.route3_monster),1 do
        local npcbaseid=self.route4_monster[curnumber][1]
        if (curnumber % 3 == 0 or curnumber % 4 == 0 or curnumber % 5 == 0 or curnumber % 6 == 0 or curnumber % 7 == 0) and npcbaseid ~= nil then
            s_sysSummon(npcbaseid,cid,self.route4_new_pos[1],self.route4_new_pos[2],1063,1)
        else
        	if  npcbaseid ~= nil then
            		for i=1,10,1 do
                	s_sysSummon(npcbaseid,cid,self.route4_new_pos[1],self.route4_new_pos[2],1063,1)
            		end
        	end
	end
    end

    --不再进行刷怪，等待其它地方触发
    s_setSceneVar(cid,1,defencetower_isbegin,0)
    s_setSceneVar(cid,1,defencetower_beging,1)
end

function CopySceneInfo_232:dead(cid,npcid)
        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
        local num = 0
        for k = 1,table.getn(list), 2 do
            local baseid = s_getValue(SCENE_ENTRY_NPC,list[k+1],VALUE_TYPE_BASE_ID)
            if baseid >= 22100 and baseid <= 22123 then
                num = num + 1;
            end
        end
        s_sendCopyCustomTime(cid,num-1,6)
end

--首位死亡注册事件
for i=0,24 do
   local id = 22100 + i
   RegisterCopyNpcDeadEvent(22100+i,232,0,"CopySceneInfo_232:dead($1,$2)")
end
