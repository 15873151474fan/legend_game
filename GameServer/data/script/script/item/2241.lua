--高级藏宝图
function OnUseItemEvent_2241(uid,thisid,targetid, number)
    if checkTreasureAward(uid,thisid,targetid,number) ~= VALUE_OK then
        return false
    end
    local mapid = s_getItemValue(uid,thisid,Item_Attribute_PosMap)
    local x  = s_getItemValue(uid,thisid,Item_Attribute_PosX)
    local y = s_getItemValue(uid,thisid,Item_Attribute_PosY)
    local reward_type = s_getItemValue(uid,thisid,Item_Attribute_WB_Type)
    local reward_id   = s_getItemValue(uid,thisid,Item_Attribute_WB_Num)
    local reward_num  = s_getItemValue(uid,thisid,Item_Attribute_QQ_Num)

	s_showbar(uid,3000,"OnUseItemEvent_2241_Callback($1,"..thisid..","..reward_type..","..reward_id..","..reward_num..")",UninterruptActionType_Treasure,VALUE_OK)


    return VALUE_OK
end

--进度条回调
function OnUseItemEvent_2241_Callback(uid,thisid,reward_type,reward_id,reward_num)
    treasureAward(uid,thisid,reward_type,reward_id,reward_num)
end
