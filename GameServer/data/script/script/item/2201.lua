--高级藏宝图
function OnUseItemEvent_2201(uid,thisid,targetid, number)
	local treasure = AdvTreasureConfigDataBase.query(targetid)
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
    local mapid = treasure.mapID
    local x = treasure.x
    local y = treasure.y
    local reward_type = tonumber(result[3])
    local reward_id  = tonumber(result[4])
	local reward_num = 0
	if reward_type == 1 then
		reward_num  = tonumber(result[5])
	end
--	s_showbar(uid,3000,"OnUseItemEvent_2201_Callback($1,"..thisid..","..reward_type..","..reward_id..","..reward_num..")",UninterruptActionType_Treasure,1,0,1)
	s_showbar(uid,3000,"OnUseItemEvent_2201_Callback($1,"..thisid..","..reward_type..","..reward_id..","..reward_num..")",UninterruptActionType_Treasure,1)

    return VALUE_OK

end

--进度条回调
function OnUseItemEvent_2201_Callback(uid,thisid,reward_type,reward_id,reward_num)
    treasureAward(uid,thisid,reward_type,reward_id,reward_num)
end
