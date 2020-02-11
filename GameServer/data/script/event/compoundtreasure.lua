--请求合成高级藏宝图
function RequestCompoundTreasure(uid)
    if s_getAutoPackSpace(uid) < 1 then
        s_sysInfo(uid,"您的背包已满,请清理背包",ChatPos_Tips)
        return false
    end
--    local needItem = {10402,10403,10404,10405,10406}
    local needItem = {10402,10403,10404}
    for k,baseid in pairs(needItem) do
        if s_checkItem(uid,baseid,1) ~= VALUE_OK then
            local name = s_getItemBaseValue(baseid,5)
            s_sysInfo(uid,"缺少"..name..",无法合成")
            return false;
        end
    end
    for k,baseid in pairs(needItem) do
        if s_deleteItemByBaseID(uid,baseid,1,"合成高级藏宝图扣除") ~= VALUE_OK then
            local name = s_getItemBaseValue(baseid,5)
            s_debugUser(uid,"合成高级藏宝图时扣除"..baseid.."失败")
            s_sysInfo(uid,"扣除"..name.."失败,无法合成")
            return false;
        end
    end


    local rebirth_level = s_getRebirthLevel(uid)
    local level = s_getUserLevel(uid)
    local treasure = nil

    if  rebirth_level > 0 or level >= 81 then
        for k,v in pairs (TreasureRandomDataBase) do
            if type(v) ~= "function" and v.levelUp > 1000 and v.mapType == 2 then
--                if v.levelUp > 1000 and v.mapType == 2 then
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
--                end
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
	s_trace("藏宝图thisid"..thisid)
    --开始取奖励

--[[    local randnum = math.random(1, 1000000)
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
]]--
    return true;
end

