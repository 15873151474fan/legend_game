--守塔副本
-- 1-xx变量说明
defencetower_begin_time           = 1;        --活动开始时间
defencetower_over_time_182                = 2;        --活动结束时间
defencetower_monster_current      = 3;   --怪物当前波数
defencetower_monster_total        = 4;    --怪物总共波数
defencetower_monter_current_index = 5; --当前波数刷怪的下标
defencetower_first_time           = 6;        --初始化时间，一般是玩家刚进入时间
defencetower_isbegin              = 7;        --是否开始刷怪
defencetower_next_time            = 8;        --下一次刷怪时间
defencetower_beging               = 9;       --是否刷怪中
defencetower_is_over              = 10;      --是否已结束
defencetower_recycle_over         = 11;      --回收倒计时,胜利或失败的缓冲时间，然后清理玩家出副本
defencetower_shudo_over		  = 12;		--是否已结束
--2 --xx玩家所获得的积分


CopySceneInfo_182 =
{
	--初始化副本的操作
	initcopy =
	{
        action =
        {
            --{s_copySummonNpc,{7500,1,25,12,103,1}},
        },
	},
    --最大容纳人数
    maxplayernum = 5,
    --怪物波数刷新时间
    monster_refresh_time = 60,
    --路线怪物
    --route1_monster = {[1]={8300},[2]={8301},[3]={}    ,[4]={8302},[5]={8303},[6]={}    ,[7]={8304},[8]={8305},[9]={}    ,[10]={8306},[11]={8307},[12]={}    ,[13]={8308},[14]={8309},[15]={}    ,},
    --route2_monster = {[1]={8330},[2]={8331},[3]={8501},[4]={8332},[5]={8333},[6]={8502},[7]={8334},[8]={8335},[9]={8503},[10]={8336},[11]={8337},[12]={8504},[13]={8338},[14]={8339},[15]={8505},},
    --route3_monster = {[1]={8360},[2]={8361},[3]={}    ,[4]={8362},[5]={8363},[6]={}    ,[7]={8364},[8]={8365},[9]={}    ,[10]={8366},[11]={8367},[12]={}    ,[13]={8368},[14]={8369},[15]={}    ,},

    route1_monster = {[1]={8310},[2]={8311},[3]={}    ,[4]={8312},[5]={8313},[6]={}    ,[7]={8314},[8]={8315},[9]={}    ,[10]={8316},[11]={8317},[12]={}    ,[13]={8318},[14]={8319},[15]={}    ,},
    route2_monster = {[1]={8340},[2]={8341},[3]={8506},[4]={8342},[5]={8343},[6]={8507},[7]={8344},[8]={8345},[9]={8508},[10]={8346},[11]={8347},[12]={8509},[13]={8348},[14]={8349},[15]={8510},},
    route3_monster = {[1]={8370},[2]={8371},[3]={}    ,[4]={8372},[5]={8373},[6]={}    ,[7]={8374},[8]={8375},[9]={}    ,[10]={8376},[11]={8377},[12]={}    ,[13]={8378},[14]={8379},[15]={}    ,},

    --route1_monster = {[1]={8320},[2]={8321},[3]={}    ,[4]={8322},[5]={8323},[6]={}    ,[7]={8324},[8]={8325},[9]={}    ,[10]={8326},[11]={8327},[12]={}    ,[13]={8328},[14]={8329},[15]={}    ,},
    --route2_monster = {[1]={8350},[2]={8351},[3]={8511},[4]={8352},[5]={8353},[6]={8512},[7]={8354},[8]={8355},[9]={8513},[10]={8356},[11]={8357},[12]={8514},[13]={8358},[14]={8359},[15]={8515},},
    --route3_monster = {[1]={8380},[2]={8381},[3]={}    ,[4]={8382},[5]={8383},[6]={}    ,[7]={8384},[8]={8385},[9]={}    ,[10]={8386},[11]={8387},[12]={}    ,[13]={8388},[14]={8389},[15]={}    ,},

    --每条线路怪物出生点
    route1_new_pos = {3,3},
    route2_new_pos = {49,2},
    route3_new_pos = {48,27},
    guardNpcId   = 8402,
    --每个怪物的积分
    --monster_point = {[8300]={3},[8330]={3},[8360]={3},[8301]={3},[8331]={3},[8361]={3},[8302]={4},[8332]={4},[8362]={4},[8303]={4},[8335]={4}},
    monster_point = {[8300]={3},[8330]={3},[8360]={3},[8301]={3},[8331]={3},[8361]={3},[8501]={175},[8302]={4},[8332]={4},[8362]={4},[8303]={4},[8333]={4},[8363]={4},[8363]={4},[8502]={250},
                    [8304]={5},[8534]={5},[8364]={5},[8505]={5},[8535]={5},[8565]={5},[8503]={325},[8306]={6},[8336]={6},[8366]={6},[8307]={7},[8337]={6},[8367]={6},[8504]={400},[8308]={8},
                    [8338]={8},[8368]={8},[8309]={8},[8339]={8},[8369]={8},[8505]={475},[8310]={5},[8340]={5},[8370]={5},[8311]={5},[8341]={5},[8371]={5},[8506]={350},[8312]={7},[8342]={7},
                    [8372]={7},[8313]={8},[8343]={8},[8373]={8},[8507]={500},[8314]={10},[8344]={10},[8374]={10},[8315]={10},[8345]={10},[8375]={10},[8508]={650},[8316]={12},[8346]={12},
                    [8376]={12},[8317]={13},[8347]={13},[8377]={13},[8509]={800},[8318]={15},[8348]={15},[8378]={15},[8319]={15},[8349]={15},[8379]={15},[8510]={950},[8320]={7},[8350]={7},
                    [8380]={7},[8321]={8},[8351]={8},[8381]={8},[8511]={560},[8322]={11},[8352]={11},[8382]={11},[8323]={12},[8353]={12},[8383]={12},[8512]={800},[8324]={15},[8354]={15},
                    [8384]={15},[8325]={16},[8355]={16},[8385]={16},[8513]={1040},[8326]={19},[8356]={19},[8386]={19},[8327]={20},[8357]={20},[8387]={20},[8514]={1280},[8328]={23},[8358]={23},
                    [8388]={23},[8327]={24},[8359]={24},[8389]={24},[8515]={1520},[8305]={5},[8334]={5},[8334]={5},[8335]={5},[8365]={5}},
}


--副本创建初始化
function CopySceneInfo_182:InitCopyScene(cid)
	s_setSceneVar(cid,1,defencetower_over_time_182,s_getCurTime(TIME_ALLSECONDS) + 1080)
    --
    s_setSceneVar(cid,1,defencetower_first_time,10)

    local npcid = s_sysSummon(self.guardNpcId, cid, 24, 14, 100, 1)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, 910000000)
    --s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, 910000000)
    s_debug("npcid===="..npcid)
end
--玩家死亡
function CopySceneInfo_182:OnPlayerDie(cid,uid,murder,dtype)

    --ReturnUserHome(uid,"CopySceneInfo_182:OnPlayerDie")
end

--销毁副本
function CopySceneInfo_182:FinalCopyScene(cid)

end

--1秒钟循环
function OnLoopCopyScene_1Sec_182(ctype,cid)
    local curtime = s_getCurTime(TIME_ALLSECONDS)

    --检测活动时间结束
	local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
    --怪物大于200个，副本失败
    if   monstercount > 200 and s_getSceneVar(cid,1,defencetower_shudo_over) == 0 then
        --活动已结束
        s_copyInfo(cid,"保护图腾失败",ChatPos_Tips)
        s_setSceneVar(cid,1,defencetower_shudo_over,1)
        s_setSceneVar(cid,1,defencetower_recycle_over,20)
        s_sendCopyCustomTime(cid,1,2)
        CopySceneInfo_182:ClearNpc(cid)
    end
    --已经失败了，给个倒计时然后清理副本
    if s_getSceneVar(cid,1,defencetower_shudo_over) == 1 then
        local overtime = s_getSceneVar(cid,1,defencetower_recycle_over)
        if overtime  > 0 then
            s_setSceneVar(cid,1,defencetower_recycle_over,overtime - 1)
            s_copyInfo(cid,"副本回收倒计时:" ..overtime,ChatPos_Tips)
            return;
        end
        s_clearCopy(cid)
        --清空npc
        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
        for i = 1,table.getn(list), 2 do --清理NPC
            s_clearNpc(list[i+1])
        end
    end

    --准备时间
    if s_getSceneVar(cid,1,defencetower_first_time) > 0 then
        local curtime = s_getSceneVar(cid,1,defencetower_first_time)
        s_copyInfo(cid,"开始倒计时:" ..curtime,ChatPos_Tips)
        s_setSceneVar(cid,1,defencetower_first_time,curtime-1)
        if curtime  == 1 then
            s_setSceneVar(cid,1,defencetower_isbegin,1)
        end
    end
    --开始刷怪
    if s_getSceneVar(cid,1,defencetower_isbegin) == 1  and s_getSceneVar(cid,1,defencetower_shudo_over) == 0 then
        if s_getSceneVar(cid,1,defencetower_monster_current) == 0 then
            s_setSceneVar(cid,1,defencetower_monster_current,1)
        end
        CopySceneInfo_182:beginRefreshMonster(s_getSceneVar(cid,1,defencetower_monster_current),cid)
        s_debug("开始刷怪,当前波数:"..s_getSceneVar(cid,1,defencetower_monster_current))
    end

    --检测是否进行下一波刷怪
    if s_getSceneVar(cid,1,defencetower_next_time) ~= 0 then
        s_debug("检测下一波:81还有秒数:"..s_getSceneVar(cid,1,defencetower_next_time) - curtime)
		s_debug("场景id "..cid)
        if curtime >= s_getSceneVar(cid,1,defencetower_next_time) then
            local current = (s_getSceneVar(cid,1,defencetower_monster_current) + 1)
			s_debug("波数..."..current)
            --大于15波说明已经结束了
            if current > 15 then
                s_setSceneVar(cid,1,defencetower_shudo_over,1)
                s_setSceneVar(cid,1,defencetower_recycle_over,20)
                s_copyInfo(cid,"保护图腾成功",ChatPos_Tips)
                s_sendCopyCustomTime(cid,2,2)
                return;
            end
            s_setSceneVar(cid,1,defencetower_monster_current,current)
            s_setSceneVar(cid,1,defencetower_isbegin,1)
            s_setSceneVar(cid,1,defencetower_next_time,0)
        end
    end

end

--3秒钟循环
function OnLoopCopyScene_3Sec_182(ctype,cid)
    local begintime = s_getSceneVar(cid,1,defencetower_begin_time)
	local monstercount = s_getCopyEntryCount(cid, SCENE_ENTRY_NPC)
    local curtime = s_getCurTime(TIME_ALLSECONDS)


    --检测活动时间结束
    if curtime >= s_getSceneVar(cid,1,defencetower_over_time_182) and s_getSceneVar(cid,1,defencetower_shudo_over) == 0 then
        --时间到了，npc还活着说明已经结束了
        if s_isNpcDead(cid,8402) == VALUE_FAIL then
            s_setSceneVar(cid,1,defencetower_shudo_over,1)
            s_setSceneVar(cid,1,defencetower_recycle_over,20)
            s_copyInfo(cid,"保护图腾成功",ChatPos_Tips)
            s_sendCopyCustomTime(cid,2,2)
            CopySceneInfo_182:ClearNpc(cid)
        end
        --活动已结束
        return;
    end

    s_debug("3sec begintime="..math.abs(begintime - curtime).."count="..monstercount)
    --不等于0说明已经开始了
    if  begintime  ~= 0 then
        --没有怪物后，下一波时间大于10时重置时间
        if monstercount == 0 and (s_getSceneVar(cid,1,defencetower_next_time) - curtime) > 10 then
            s_setSceneVar(cid,1,defencetower_next_time,curtime + 10)
            s_setSceneVar(cid,1,defencetower_begin_time,0)
            s_setSceneVar(cid,1,defencetower_beging,0)

            --通知客户端下波剩余时间
            s_sendCopyCustomTime(cid,10,3)
            s_debug("设置下一波开始时间.....1")
            return;
        end

    end

end


--刷怪函数(curnumber-->当前第几波)
function CopySceneInfo_182:beginRefreshMonster(curnumber,cid)
    s_debug("beginRefreshMonster..curnumber="..curnumber)
    --大于15波不再刷
    if curnumber > 15 then
        return;
    end
    --通知客户端当前波数
    s_sendCopyCustomTime(cid,curnumber,1)
    --通知客户端剩余时间
    local curtime = s_getCurTime(TIME_ALLSECONDS)
    s_setSceneVar(cid,1,defencetower_next_time,curtime + 60)
    s_sendCopyCustomTime(cid,60,3)
    --第一路线怪(每次刷20只)
    if  self.route1_monster[curnumber] ~= nil then
        --for i=1,table.getn(self.route1_monster[curnumber]),1 do
        local npcbaseid = self.route1_monster[curnumber][1]
        if npcbaseid ~= nil  then
            for i=1,20,1 do
                s_sysSummon(npcbaseid,cid,self.route1_new_pos[1],self.route1_new_pos[2],1063,1)
            end
        end
    end
    --第二路线怪
    if  self.route2_monster[curnumber] ~= nil then
        --如果是第三波只刷一只
        local npcbaseid=self.route2_monster[curnumber][1]
        if curnumber % 3 == 0 and npcbaseid ~= nil then
            s_sysSummon(npcbaseid,cid,self.route2_new_pos[1],self.route2_new_pos[2],1063,1)
        else
            --for i=1,table.getn(self.route2_monster[curnumber]),1 do
            if npcbaseid ~= nil  then
                for i=1,20,1 do
                    s_sysSummon(npcbaseid,cid,self.route2_new_pos[1],self.route2_new_pos[2],1063,1)
                end
            end

        end
    end
    --第三路线
    if self.route3_monster[curnumber] ~= nil  then
        --for i=1,table.getn(self.route3_monster),1 do
        local npcbaseid=self.route3_monster[curnumber][1]
        if  npcbaseid ~= nil then
            for i=1,20,1 do
                s_sysSummon(npcbaseid,cid,self.route3_new_pos[1],self.route3_new_pos[2],1063,1)
            end
        end
    end
    --不再进行刷怪，等待其它地方触发
    s_setSceneVar(cid,1,defencetower_isbegin,0)
    s_setSceneVar(cid,1,defencetower_begin_time,s_getCurTime(TIME_ALLSECONDS))
    s_setSceneVar(cid,1,defencetower_beging,1)
end

--玩家进入副本提示
function CopySceneInfo_182:OnPlayerIntoCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)

    local overtime = s_getSceneVar(cid,1,defencetower_over_time_182) - s_getCurTime(TIME_ALLSECONDS)
    s_sendCopyTime(cid,overtime);
    --通知客户端当前波数
    local curnumber = s_getSceneVar(cid,1,defencetower_monster_current)
    s_sendCopyCustomTime(cid,curnumber,1)

    --有任务情况下不扣次数
	local taskProcess = s_getTaskValue(uid, 1135, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        local curnum = s_getField(uid,UserVar_CTeamTimes2)
        if curnum > 0 then
            s_subField(uid, UserVar_CTeamTimes2, 1)
        end
    end

end

--玩家离开副本
function CopySceneInfo_182:OnPlayerLeaveCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)

    --完成主线任务
	local taskProcess = s_getTaskValue(uid, 1135, TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
        AddRoleTaskOperate(uid,1135)
    end
    -- 刷新副本任务次数显示
    RefreshCopyDailyInfo(uid)
end

--怪物死后掉出宝箱
function CopySceneInfo_182:dead_7500(userid,npcid)
    local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
    local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
    s_addSceneItem(1002,1,cid,posx,posy,0,"1-1")
end

function CopySceneInfo_182:dead8300_8515(cid,npcthisid)
    s_copyInfo(cid,"获得积分:100",ChatPos_Tips)

    --打死怪后给所有的副本内的玩家增加积分
    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    for i = 1,table.getn(list), 2 do
        if list[i] == SCENE_ENTRY_PLAYER then
           s_setVar(list[i+1],167,1,s_getVar(list[i+1],167,1) + 100)   --这儿的100先随便填写，到时候读取策划填的值就可以了
        end
    end

    --通知客户端获得的积分
    s_sendCopyCustomTime(cid,100,2)
end

--此函数回调成功说明失败了，因为守护图腾已经被击败
function CopySceneInfo_182:dead_8401(cid,npcthisid)
    s_copyInfo(cid,"保护图腾失败",ChatPos_Tips)
    s_setSceneVar(cid,1,defencetower_shudo_over,1)
    s_setSceneVar(cid,1,defencetower_recycle_over,20)
    s_sendCopyCustomTime(cid,1,2)
    CopySceneInfo_181:ClearNpc(cid)
end

--清空npc
function CopySceneInfo_182:ClearNpc(cid)
    --清空npc
    local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
    for i = 1,table.getn(list), 2 do --清理NPC
        s_clearNpc(list[i+1])
    end
end

--玩家复活
function CopySceneInfo_182:OnPlayerRelive(uid, rtype)
	if rtype == 3 or rtype == 4 then
		s_goto(SCENE_ENTRY_PLAYER,uid,11,21)
	end
end

--小怪死亡回调
function CopySceneInfo_182:CopySceneInfo_182_monster_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
    local point = 0
    if self.monster_point[baseid] ~= nil then
        point = self.monster_point[baseid][1]
    end
    if point == 0 then
        return;
    end
    s_copyInfo(cid,"获得积分:"..point,ChatPos_Honor)
    --打死怪后给所有的副本内的玩家增加积分
    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    local num = 0;
    local vlist = {}
    for i = 1,table.getn(list), 2 do
        if list[i] == SCENE_ENTRY_PLAYER then
           --给玩家增加副本积分
           s_setVar(list[i+1],290,4,s_getVar(list[i+1],290,4) + point)
           --这儿只作记录用
           s_setSceneVar(cid,2,list[i+1],s_getSceneVar(cid,2,list[i+1])+point)
           table.insert(vlist,list[i+1]);
           table.insert(vlist,s_getSceneVar(cid,2,list[i+1]));
           num = num + 1;
        end
    end

	local ctype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_TYPE)
	s_sendCopyVar(ctype, cid,0,num,vlist)
end


--boss死亡回调
function CopySceneInfo_182:CopySceneInfo_182_boss_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
    local point = 0
    if self.monster_point[baseid] ~= nil then
        point = self.monster_point[baseid][1]
    end
    if point == 0 then
        return;
    end
    s_copyInfo(cid,"获得积分:"..point,ChatPos_Honor)
    --打死怪后给所有的副本内的玩家增加积分
    local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
    local num = 0;
    local vlist = {}
    for i = 1,table.getn(list), 2 do
        if list[i] == SCENE_ENTRY_PLAYER then
           --给玩家增加副本积分
           s_setVar(list[i+1],290,4,s_getVar(list[i+1],290,4) + point)
           --这儿只作记录用
           s_setSceneVar(cid,2,list[i+1],s_getSceneVar(cid,2,list[i+1])+point)
           table.insert(vlist,list[i+1]);
           table.insert(vlist,s_getSceneVar(cid,2,list[i+1]));
           num = num + 1;
        end
    end

	local ctype = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_TYPE)
	s_sendCopyVar(ctype, cid,0,num,vlist)
end


--守护图腾死亡回调
function CopySceneInfo_182_guard_death_callback(uid,npcid)
	local cid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SCENE_ID)
    s_debug("图腾被杀死了")
    s_copyInfo(cid,"保护图腾失败",ChatPos_Tips)
    s_setSceneVar(cid,1,defencetower_shudo_over,1)
    s_setSceneVar(cid,1,defencetower_recycle_over,20)
    s_sendCopyCustomTime(cid,1,2)
end

--守护图腾死亡事件
RegisterCopyNpcDeadEvent(8402,182,0,"CopySceneInfo_182:dead_8401($1,$2)")
--普通怪物死亡事件

for i=0,9 do
    RegisterMyNpcDeadEvent(8310+i,"CopySceneInfo_182:CopySceneInfo_182_monster_death_callback($1,$2)")
    RegisterMyNpcDeadEvent(8340+i,"CopySceneInfo_182:CopySceneInfo_182_monster_death_callback($1,$2)")
    RegisterMyNpcDeadEvent(8370+i,"CopySceneInfo_182:CopySceneInfo_182_monster_death_callback($1,$2)")
    --boss回调
    if i < 5 then
        RegisterMyNpcDeadEvent(8506+i,"CopySceneInfo_182:CopySceneInfo_182_boss_death_callback($1,$2)")
    end
end



--下面的不用了，副本的只能相同类型只能有一个回调,还没找到批量的方法
--RegisterCopyNpcDeadEvent(8330,181,181,"CopySceneInfo_182:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8360,181,181,"CopySceneInfo_182:dead8300_8515($1,$2)")
--RegisterCopyNpcDeadEvent(8331,181,181,"CopySceneInfo_182:dead8300_8515($1,$2)")
