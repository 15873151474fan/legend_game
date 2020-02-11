--群雄夺宝获得宝箱减速%30
function OnHoldBuff_10001(level,etype,eid)
	s_addValue(etype,eid,VALUE_TYPE_SPEED_SUB_PER,5000)
end

function OnLoopBuffEvent_3Sec_10001(level,etype,eid,time,value)
    --随机奖励道具
    local randnum = math.random(1,1000000)
    if randnum <= 735296 then
        s_addItem(eid,19000,0,18888,0,"1-1","群雄夺宝3秒钟随机奖励",0,1001)
    elseif randnum > 735296 and randnum <= 980394 then
        s_addItem(eid,19003,0,1,0,"1-1","群雄夺宝3秒钟随机奖励",0,1001)
    elseif randnum > 980394 and randnum <= 990197 then
        s_addItem(eid,10076,0,1,0,"1-1","群雄夺宝3秒钟随机奖励",0,1001)
    elseif randnum > 990197 and randnum <= 1000000 then
        s_addItem(eid,10077,0,1,0,"1-1","群雄夺宝3秒钟随机奖励",0,1001)
    end

    --qunxiongduobaoRandomReward(eid)
	s_refreshExp(eid, 26888, ExpType_OptionalTask, 0)
    s_refreshIncExp(eid,0 ,ExpType_OptionalTask,0 )
end
