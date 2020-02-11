function checkAwardTreasure(uid,dwid)
    --奖励为藏宝图道具
    s_setVar(uid, 168, 3,s_getVar(uid, 168, 3) + 1)
    if dwid >= 2101 and dwid <= 2149 then
        if s_getVar(uid, 168, 1) == 0 then
            s_setVar(uid, 168, 1, s_getVar(uid, 168, 3))
        elseif s_getVar(uid, 168, 2) == 0 then
            s_setVar(uid, 168, 2, s_getVar(uid, 168, 3))
        end
    end

    --打开奖励 设置藏宝图保底命中
    local temp = dwid
    local value1 = s_getVar(uid,168,1)
    local value2 = s_getVar(uid,168,2)
    local value3 = s_getVar(uid,168,3)

    if dwid < 2101 or dwid > 2149 then
        local rebirth_level = s_getRebirthLevel(uid)
        local level = s_getUserLevel(uid)
        if level >= 81 or rebirth_level >= 1000 then
            for _, v in pairs (TreasureConfigDataBase) do
                if type(v) ~= "function" then
                    if v.levelDown >= 81 or v.levelUp >= 1000 then
                        local rlevelUp = v.levelUp % 1000
                        local rlevelDown = 0
                        temp = 2249

                        if v.levelDown > 1000 then
                            rlevelDown = v.levelDown % 1000
                        end

                        if  rlevelUp >= rebirth_level  and rlevelDown <= rebirth_level  then
                            temp = v.dwID
                            break
                        end
                    end
                end
            end
        else
            for _, v in pairs (TreasureConfigDataBase) do
                if type(v) ~= "function" then
                    if v.levelUp < 81  then
                        if v.levelUp >= level and v.levelDown <= level  then
                            temp = v.dwID
                            break
                        end
                    end
                end
            end
        end

        if value2 == 0  then
            if value1 == 0 and value3 == 3 then
                s_setVar(uid, 168, 1, s_getVar(uid, 168, 3))
                return temp
            end

            if value1 == 1 and value3 == 5 then
                s_setVar(uid, 168, 2, s_getVar(uid, 168, 3))
                return temp
            end

            if value1 == 2 and value3 == 5 then
                s_setVar(uid, 168, 2, s_getVar(uid, 168, 3))
                return temp
            end

            if value1 == 3 and value3 == 5 then
                s_setVar(uid, 168, 2, s_getVar(uid, 168, 3))
                return temp
            end

            if value1 == 4 and value3 == 5 then
                s_setVar(uid, 168, 2, s_getVar(uid, 168, 3))
                return temp
            end
        end
    end


    --清零
    if value3 >= 5 then
        s_setVar(uid,168,1,0)
        s_setVar(uid,168,2,0)
        s_setVar(uid,168,3,0)
    end

    return dwid
end

--请求合成普通藏宝图
function addTreasure(uid,dwid)
    local treasure = TreasureConfigDataBase.query(dwid);

    if treasure == nil then
        s_debugUser(uid,"合成普通藏宝图时未找到配表")
        return false;
    end
    --开始取奖励

    local randnum = math.random(1, 1000000)
    local result = {};
    local base = 0;
    local index = 1;
    local bfind = false;
    for _,v in pairs(treasure) do
        --判断是否是奖励字段
        local _,ret = string.find(v,":")
        if ret ~= nil then
            result = splitstring(v,":")
            if result == v then
                return false;
            end

            --是否在概率内
            if randnum >= tonumber(result[1]) and randnum <= tonumber(result[2]) then
                bfind = true;
                break;
            end

            index = index + 1
        end
    end

    if bfind  == false then
        s_debugUser(uid,"未匹配到概率")
        return false;
    end
        s_debugUser(uid,"奖励道具id"..treasure.dwID)
    --开始获得道具,并写入属性
    local thisid = s_addItem(uid,treasure.dwID,0,1,0,"1-1","合成普通藏宝图")
    if thisid ~= nil or thisid ~= 0 then
        --地图id
        s_setItemValue(uid,thisid,Item_Attribute_PosMap,treasure.mapId)
        --坐标x
        s_setItemValue(uid,thisid,Item_Attribute_PosX,treasure.x)
        --坐标y
        s_setItemValue(uid,thisid,Item_Attribute_PosY,treasure.y)
        --奖励类
        s_setItemValue(uid,thisid,Item_Attribute_WB_Type,tonumber(result[3]))
        --奖励值
        s_setItemValue(uid,thisid,Item_Attribute_WB_Num,tonumber(result[4]))
        --如果是道具还有数量
        if tonumber(result[3]) == 1 then
            s_setItemValue(uid,thisid,Item_Attribute_QQ_Num,tonumber(result[5]))
        end
    end
    return true;
end


--请求合成高级藏宝图
function addAdvTreasure(uid)
    local rebirth_level = s_getRebirthLevel(uid)
    local level = s_getUserLevel(uid)
    local treasure = nil

    if  rebirth_level > 0 or level >= 81 then
        for k,v in pairs (TreasureRandomDataBase) do
            if type(v) ~= "function" then
                if v.levelUp > 1000 and v.mapType == 2 then
                    local rebithlevel = v.levelUp % 1000;
                    local rebithlevelDown = 0

                    if v.levelDown > 1000 then
                        local rebithlevelDown = v.levelDown % 1000;
                    end

                    if rebirth_level >= rebithlevelDown and rebirth_level <=  rebithlevel then
                        local randnumT = math.random(v.mapDown,v.mapUp)
                        treasure = AdvTreasureConfigDataBase.query(randnumT);
                         break;
                    end
                    if next(v) == nil then
                        treasure = AdvTreasureConfigDataBase.query(2249);
                        break;
                    end
                end
            end
        end
    else
        for k,v in pairs (TreasureRandomDataBase) do
            if type(v) ~= "function" then
                if level >= v.levelDown and level <=  v.levelUp and v.mapType == 2 then
                    local randnumT = math.random(v.mapDown,v.mapUp)
                    treasure = AdvTreasureConfigDataBase.query(randnumT)
                    break;
                end
                if next(v) == nil then
                    treasure = AdvTreasureConfigDataBase.query(math.random(v.mapDown,v.mapUp))
                    break;
                end
            end
        end
    end
    if treasure == nil then
        s_debugUser(uid,"合成高级藏宝图时未找到配表")
        return false;
    end
    local thisid = s_addItem(uid,treasure.dwID,0,1,0,"1-1","合成高级藏宝图")
    --开始取奖励
--[[
    local randnum = math.random(1, 1000000)
    local result = {};
    local base = 0;
    local index = 1;
    local bfind = false;
    --reward of high treasure
    for _,v in pairs(treasure) do
        --判断是否是奖励字段
        local _,ret = string.find(v,":")
        if ret ~= nil then
            result = splitstring(v,":")
            s_debugUser(uid,"9")
            if result == v then
                return false;
            end

            --是否在概率内
            if randnum >= tonumber(result[1]) and randnum <= tonumber(result[2]) then
                bfind = true;
                break;
            end

            index = index + 1
        end
    end

    if bfind  == false then
        s_debugUser(uid,"未匹配到概率")
        return false;
    end
    for _,v in pairs (result) do
        s_trace('>>>>>>>>>>>>>>>>>>'..result[_])
    end
    s_debugUser(uid,"获得奖励道具"..treasure.dwID)

    --开始获得道具,并写入属性
    local thisid = s_addItem(uid,treasure.dwID,0,1,0,"1-1","合成高级藏宝图")
    if thisid ~= nil or thisid ~= 0 then
        --地图id
        s_setItemValue(uid,thisid,Item_Attribute_PosMap,treasure.mapId)
        --坐标x
        s_setItemValue(uid,thisid,Item_Attribute_PosX,treasure.x)
        --坐标y
        s_setItemValue(uid,thisid,Item_Attribute_PosY,treasure.y)
        --奖励类型
        s_setItemValue(uid,thisid,Item_Attribute_WB_Type,tonumber(result[3]))
        --奖励值
        s_setItemValue(uid,thisid,Item_Attribute_WB_Num,tonumber(result[4]))
        --如果是道具还有数量
        if tonumber(result[3]) == 1 then
            s_setItemValue(uid,thisid,Item_Attribute_QQ_Num,tonumber(result[5]))
        end
    end
    return true;
	]]
end

