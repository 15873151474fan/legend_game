--高级藏宝图
function checkTreasureAward(uid,thisid,targetid, number)
    local mapid = s_getItemValue(uid,thisid,Item_Attribute_PosMap)
    local x  = s_getItemValue(uid,thisid,Item_Attribute_PosX)
    local y = s_getItemValue(uid,thisid,Item_Attribute_PosY)
    local reward_type = s_getItemValue(uid,thisid,Item_Attribute_WB_Type)
    local reward_id   = s_getItemValue(uid,thisid,Item_Attribute_WB_Num)
    local reward_num  = 0
    s_debugUser(uid,"OnUser2208"..x.." "..y.." "..targetid..reward_type)
    if reward_type == 1 then
        reward_num  = s_getItemValue(uid,thisid,Item_Attribute_QQ_Num)
    end
    if mapid == nil or mapid == 0 or x == nil or y == nil or reward_type == nil or reward_id == nil then
        s_sysInfo(uid,"道具属性不对,不能使用",ChatPos_Tips)
        return VALUE_FAIL;
    end
    local user_map_id = s_getUserMapId(uid)
    if user_map_id ~= mapid then
        s_sysInfo(uid,"请在"..s_getMapName(mapid).."地图使用",ChatPos_Tips)
        return VALUE_FAIL;
    end
    local user_pos = s_getUserPos(uid)
    if  user_pos == nil then
        s_sysInfo(uid,"获取道具位置错误，无法使用",ChatPos_Tips)
        return VALUE_FAIL;
    end
    if user_pos.x ~= x and user_pos.y ~= y then
        s_sysInfo(uid,"请在当前地图:"..x..","..y.."处使用",ChatPos_Tips)
        return VALUE_FAIL;
    end

    return VALUE_OK
end

--进度条回调
function treasureAward(uid,thisid,reward_type,reward_id,reward_num)
	s_debugUser(uid,">>>>>>>>>>>>>>>进入藏宝图扣除道具失败:")
	s_debugUser(uid,">>>>>>>>>>>>>>>进入藏宝图扣除道具失败: reward_type = "..reward_type)
    if s_deleteItemByThisID(uid,thisid,1,"藏宝图奖励") ~= VALUE_OK then
        s_debugUser(uid,"扣除道具失败:"..thisid)
        return VALUE_FAIL
    end
        local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
        local user_map_id = s_getUserMapId(uid)
    --发对应的奖励
    if reward_type == 1 then
        --道具奖励
        local flag = 0;
        local unBindItem = {10001,10002,10003,10004,11201,11202,11203,11204,11205,11206,11207,150101,160101,160102,220001,230001,240001,250001,270101,270201,270301,270401,270501,270901}
        local unspreadItem = {3008,4001,5001,10001,10002,10003,10004,11201,11202,11203,11204,11205,11206,11207,150101,160101,160102,270501}
        for k,baseid in pairs(unBindItem) do
            if reward_id == baseid then
                flag = 1
                break
            end
        end
	s_debugUser(uid,">>>>>>>>>>>>>>>进入藏宝图扣除道具失败: flag = "..flag)
        local starget = 1
	if reward_id < 10328 and reward_id >10299 then
		flag = 1
	end
        if flag == 1 then
            local itemid = s_addItem(uid,reward_id,0,reward_num,0,"","藏宝图奖励")
	 	s_returnTreasureend(uid,starget)
        else
            local itemid = s_addItem(uid,reward_id,0,reward_num,0,"1-1","藏宝图奖励")
		s_returnTreasureend(uid,starget)
        end


			for k,v in pairs(unspreadItem) do
				if  v == reward_id then
					local itemName = s_getItemBaseValue(reward_id,5)
					s_worldInfo("恭喜[#3]"..name.."[-]在使用[#6]高级藏宝图[-]挖宝过程中,人品爆发,获得[#9]"..itemName.."[-]",ChatPos_Sys + ChatPos_Important )
					break
				end
			end

        --if itemid ~= nil and itemid ~= 0 and s_isEquip(reward_id) == VALUE_OK then
        --    if s_getItemBaseValue(reward_id,7) == 5 then
        --        local itemName = s_getItemBaseValue(reward_id,5)
        --        s_worldInfo("恭喜[#3]"..name.."[-]在挖宝过程中,人品爆发,获得[#9]"..itemName.."[-]",ChatPos_Sys + ChatPos_Important )
        --    end
        --end
    else
        --进入开启副本
        --开始创建npc
        local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
        local user_pos = s_getUserPos(uid)
        local copysceneid = 0
        --进入副本
        local recycletime = 10*60*1000
        local recycletimenouser = 10*60*1000
        local countryid = 3

        if reward_id == 220 then
            copysceneid = s_intoCopyCustomSingle(uid,1207,reward_id,6,46)
            s_worldInfo("[#3]"..name .. "[-]在[#2]"..s_getMapName(user_map_id).."("..user_pos.x..","..user_pos.y.. ")[-]挖宝时打破了[#9]藏宝山洞[-]的封印，高级技能书和神秘怪物隐藏其中，勇士速速前往挑战，豪取丰厚奖励！",ChatPos_Important + ChatPos_Sys)
        else
            copysceneid = s_intoCopyCustomSingle(uid,1208,reward_id,3,48)
            s_worldInfo("[#3]"..name .. "[-]在[#2]"..s_getMapName(user_map_id).."("..user_pos.x..","..user_pos.y.. ")[-]挖宝时打破了[#9]藏宝山洞[-]的封印，高级技能书和神秘怪物隐藏其中，勇士速速前往挑战，豪取丰厚奖励！",ChatPos_Important + ChatPos_Sys)
        end
        local npcid = s_sysSummon(315,cid,user_pos.x,user_pos.y,100,1)
        s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*60*1000)
        s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
        s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_COPYSCENE_ID,copysceneid)
        s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_COPYSCENE_MAPID,reward_id)
        s_addState(SCENE_ENTRY_NPC,npcid,SceneEntry_God)
        if masterid == uid then
            TreasureCopyHistory[uid] = copysceneid;
        end
        s_sysInfo(uid,"使用藏宝图成功",ChatPos_Tips)
        return VALUE_OK
    end
end
