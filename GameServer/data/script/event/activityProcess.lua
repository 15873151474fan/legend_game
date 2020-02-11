--夺宝战发送兑换奖励列表
function sendDiamonPointList(uid)
    local num = 0
    local list = {}
    for k,v in pairs(DiamondPointDataBase) do 
        if type(v) ~= 'function' then
            num = num+1;
            table.insert(list,v.itemid)
            table.insert(list,v.num)
            table.insert(list,v.needpoint)
        end
    end
    s_sendDiamondItemList(uid,num,list)
end

--夺宝战积分兑换
function requestPointExchange(uid,itemid,num)
    local itemdata = DiamondPointDataBase.query(itemid)
    if itemdata == nil  then
        s_sysInfo(uid,"请求不存在的物品")
        return;
    end
    if num > s_getItemMaxnum(itemid) then
        s_sysInfo(uid,"请不要非法操作")
        return;
    end
    if itemdata.needpoint * num > s_getVar(uid,163,1) then
        s_sysInfo(uid,"积分不够，不能兑换")
        return;
    end
    s_setVar(uid,163,1,s_getVar(uid,163,1) - itemdata.needpoint * num)
    s_addItem(uid,itemdata.itemid,0,itemdata.num * num,0,"1-1","宝石战场积分兑换")
    s_sysInfo(uid,"兑换成功")
end

