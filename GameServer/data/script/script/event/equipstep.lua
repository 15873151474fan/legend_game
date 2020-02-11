--魔神秘典、玄印、宝石进阶(btype-->要升级的装备类型)
function OnRequestAssisEquipStep(uid,btype,itemid)
	s_debugUser(uid,"护盾值 ".."itemid="..itemid.."   btype="..btype)
        if itemid == 0 then  --0说明是还没有物品，直接发送新的道具
            local curnum,medalbm
            if btype == 0 then --宝石
                curnum = s_getVar(uid,140,1)
                medalbm = DiamonUpDataBase[130001]
                print_table(medalbm)
                tips = "宝石碎片不足"
            elseif btype == 1 then --五行珠
                curnum = s_getVar(uid,140,2)
                medalbm = PearlUpDataBase[140001]
                tips = "五行石不足"
	    elseif btype == 5 then --护盾
                curnum = s_getVar(uid,140,61)
                medalbm = ShieldUpDataBase[141001]
                tips = "护盾不足"
            elseif btype == 2 then --玉佩
                local profession =  s_getValue(0,uid,VALUE_TYPE_PROFESSION)
                local jadeid = 120001
                if profession == Profession_Gunman then
                    jadeid = 120101
                elseif profession == Profession_Freeman then
                    jadeid = 120201
                end
                curnum = s_getVar(uid,140,3)
                medalbm = JadeUpDataBase[jadeid]
                tips = "玉石碎片不足"
            elseif btype == 3 then --勋章
                curnum = s_getVar(uid,140,4)
                medalbm = MedalUpDataBase[80001]
                tips = "荣誉积分不足"
            end
            if medalbm == nil then
                s_sysInfo(uid,"请求非法，已做记录")
                return VALUE_FAIL
            end
            if curnum <  medalbm.needpoint then
                s_sysInfo(uid,tips,ChatPos_Tips,ChatPos_Tips)
                return VALUE_FAIL
            end
            if medalbm.needmoney ~= 0 then
                local gold = s_getMoney(uid,MoneyType_MoneyTicket)   --这儿因为 金钱还没做，暂时用一种，后面加上之后这统一修改
                if gold < medalbm.needmoney then
                    s_sysInfo(uid,"银两不足",ChatPos_Tips)
                    return VALUE_FAIL
                end
            end
            --条件检测完成，开始扣钱发物品
            if s_removeMoney(uid,MoneyType_MoneyTicket,medalbm.needmoney,"宝石升级扣除") ~= VALUE_OK then -- 金币类型后续记得修改
                s_sysInfo(uid, "银两不足无法升级",ChatPos_Tips);
                return VALUE_FAIL
            end
            if btype == 0 then -- 宝石
                s_setVar(uid,140,1,curnum - medalbm.needpoint)
            elseif btype == 1 then -- 五行珠
                s_setVar(uid,140,2,curnum - medalbm.needpoint)
            elseif btype == 2 then --玉佩
                s_setVar(uid,140,3,curnum - medalbm.needpoint)
            elseif btype == 3 then --勋章
                s_setVar(uid,140,4,curnum - medalbm.needpoint)
            elseif btype == 5 then --护盾
                s_setVar(uid,140,61,curnum - medalbm.needpoint)
	    end
            s_addItem(uid,medalbm.id,3,1,0,"1-1","装备进阶获得",1)
            --发奖励
            --s_addItem(uid,medalbm.reward_item1,3,medalbm.reward_item_num1,0,"1-1","装备进阶获得")
            --s_addItem(uid,medalbm.reward_item2,3,medalbm.reward_item_num2,0,"1-1","装备进阶获得")
			local	uepushingbm = nil
			
			if btype == 2 then
				uepushingbm = EmailPushDataBase.query(1000,60)
			elseif btype == 1 then
				uepushingbm = EmailPushDataBase.query(1000,65)
			end
			if uepushingbm ~= nil then
				local key = uepushingbm.ID
				local subject = uepushingbm.maintype
				s_sysMail(uid,"",key,0,0,"",0,subject)
				s_setVar(uid,250,level,1)	
			end

	    s_debugUser(uid,"护盾0 medalbm="..medalbm.id)
            return medalbm.id

        else
            local baseid = s_getitembaseid(uid,itemid)
            s_debug("baseid="..baseid.."itemid="..itemid)
            if baseid == nil or itemid == 0 then
                s_sysInfo(uid,"无效的目标道具",ChatPos_Tips)
                return VALUE_FAIL
            end
            local tips = ""
            local curnum,medalbm
            s_debug("baseid=%d,type=%d",baseid,btype)
            if btype == 0 then --宝石
                curnum = s_getVar(uid,140,1)
                medalbm = DiamonUpDataBase[baseid + 1]
                print_table(medalbm)
                tips = "宝石碎片不足"
            elseif btype == 1 then --五行珠
                curnum = s_getVar(uid,140,2)
                medalbm = PearlUpDataBase[baseid + 1]
                tips = "五行石不足"
            elseif btype == 2 then --玉佩
                curnum = s_getVar(uid,140,3)
                medalbm = JadeUpDataBase[baseid + 1]
                tips = "玉石碎片不足"
            elseif btype == 3 then --勋章
                curnum = s_getVar(uid,140,4)
                medalbm = MedalUpDataBase[baseid + 1]
                tips = "荣誉积分不足"
            elseif btype == 5 then --护盾
		curnum = s_getVar(uid,140,61)
		medalbm = ShieldUpDataBase[baseid + 1]
		tips = "荣誉积分不足"
	    end
            if medalbm == nil then
                s_sysInfo(uid,"已经升到最高等级，无需再升",ChatPos_Tips)
                return VALUE_FAIL
            end
            if curnum <  medalbm.needpoint then
                s_sysInfo(uid,tips,ChatPos_Tips)
                return VALUE_FAIL
            end
            if medalbm.needmoney ~= 0 then
                local gold = s_getMoney(uid,MoneyType_MoneyTicket)   --这儿因为 金钱还没做，暂时用一种，后面加上之后这统一修改
                if gold < medalbm.needmoney then
                    s_sysInfo(uid,"银两不足",ChatPos_Tips)
                    return VALUE_FAIL
                end
            end
            --条件检测完成，开始扣钱发物品
            if s_removeMoney(uid,MoneyType_MoneyTicket,medalbm.needmoney,"宝石升级扣除") ~= VALUE_OK then -- 金币类型后续记得修改
                s_sysInfo(uid, "银两不足无法升级",ChatPos_Tips);
                return VALUE_FAIL
            end
            if btype == 0 then -- 宝石
                s_setVar(uid,140,1,curnum - medalbm.needpoint)
            elseif btype == 1 then -- 五行珠
                s_setVar(uid,140,2,curnum - medalbm.needpoint)
            elseif btype == 2 then --玉佩
                s_setVar(uid,140,3,curnum - medalbm.needpoint)
            elseif btype == 3 then --勋章
                s_setVar(uid,140,4,curnum - medalbm.needpoint)
	    elseif btype == 5 then --护盾
		s_setVar(uid,140,61,curnum - medalbm.needpoint)
            end
            if s_copyItemInheritData(uid,itemid,medalbm.id) ~= VALUE_OK then
                return VALUE_FAIL;
            end
            --发奖励
            --s_addItem(uid,medalbm.reward_item1,3,medalbm.reward_item_num1,0,"1-1","装备进阶获得")
            --s_addItem(uid,medalbm.reward_item2,3,medalbm.reward_item_num2,0,"1-1","装备进阶获得")
	    s_debugUser(uid,"护盾 medalbm="..medalbm.id)
            return medalbm.id
        end
end

--称号进阶(byte->类型，暂时只有一种类型,titleid->称号id)
function OnRequestAssisTitleStep(uid,btype,titleid)
    s_debugUser(uid,"OnRequestAssisTitleStep ".."type="..btype.."   titleid="..titleid)
    local profession =  s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
    local titlebm = nil;
    if titleid == 0 then
        local curtile = 0;
        if profession == Profession_Soldier then
            curtile = 1;
        elseif profession == Profession_Gunman then
            curtile = 11;
        else
            curtile = 21;
        end
        titlebm = TitleUpDataBase.query(profession,curtile)
    else
        if s_isTitle(SCENE_ENTRY_PLAYER,uid,titleid) == 0 then
            s_sysInfo(uid, "请不要非法操作",ChatPos_Tips);
            return VALUE_FAIL
        end
        titlebm = TitleUpDataBase.query(profession,titleid)
    end
    if titlebm == nil then
        s_sysInfo(uid, "请求非法",ChatPos_Tips);
        return VALUE_FAIL
    end

    if titlebm.nextid  == 0 then
        s_sysInfo(uid, "已达到最高级",ChatPos_Tips);
        return VALUE_FAIL
    end

    --获得的等级不是0，则取下一级的经验
    if titleid ~= 0 then
        titlebm = TitleUpDataBase.query(profession,titlebm.nextid)
        if titlebm == nil then
            s_debugUser(uid,"OnRequestAssisTitleStep titlebm == nil")
            return VALUE_FAIL
        end
    end

    if s_getVar(uid,140,5) < titlebm.needpoint then
        s_sysInfo(uid, "历练值不够，不能兑换",ChatPos_Tips);
        return VALUE_FAIL
    end

    if titleid > 0 then
        if  s_delTitle(SCENE_ENTRY_PLAYER,uid,titleid) ~= 1 then
            s_sysInfo(uid, "升级称号失败，请稍后再试",ChatPos_Tips);
            return VALUE_FAIL
        end
    end

    s_setVar(uid,140,5,s_getVar(uid,140,5) - titlebm.needpoint)
    s_addTitle(SCENE_ENTRY_PLAYER,uid,titlebm.needmoney)

    return titlebm.needmoney
end

function UserLevelCompare(uid, userlevel, level)
	local needlevel = level
	if needlevel > 1000 then
		needlevel = needlevel - 1000
		local userrebirth = s_getRebirthLevel(uid)
		return userrebirth >= needlevel
	end
	return userlevel >= needlevel
end

function OnRequestAssisShieldStep(uid,btype,itemid)
    s_debugUser(uid,"OnRequestAssisTitleStep ".."itemid="..itemid.."   btype="..btype)
    if itemid == 0 then  --0说明是还没有物品，直接发送新的道具
        --return VALUE_FAIL
	local medalbm,curnum
	curnum = s_getVar(uid,140,61)
        medalbm = ShieldUpDataBase[141001]
	s_debug("curnum="..curnum.."medalbm.id="..medalbm.id)
	tips = "护盾碎片不足"
	if medalbm == nil then
                s_sysInfo(uid,"请求非法，已做记录")
                return VALUE_FAIL
        end
	if curnum <  medalbm.needpoint then
                s_sysInfo(uid,tips,ChatPos_Tips,ChatPos_Tips)
                return VALUE_FAIL
        end
	s_setVar(uid,140,61,curnum - medalbm.needpoint)
        local userlevel = s_getUserLevel(uid) --玩家等级
	s_debug("curnum="..curnum.."medalbm.id="..medalbm.id)
	if UserLevelCompare(uid, userlevel, medalbm.level) then
        	return medalbm.id
	else
		return VALUE_FAIL	
	end
    --elseif itemid == 1 then
	
    else
        local baseid = s_getitembaseid(uid,itemid)
            s_debug("baseid="..baseid.."itemid="..itemid)
            if baseid == nil or itemid == 0 then
                s_sysInfo(uid,"无效的目标道具",ChatPos_Tips)
                return VALUE_FAIL
            end
            local tips = ""
            local curnum,medalbm
            s_debug("baseid=%d,type=%d",baseid,btype)

            curnum = s_getVar(uid,140,61)
            medalbm = ShieldUpDataBase[baseid + 1]
	    local userlevel = s_getUserLevel(uid) --玩家等级
            tips = "五行石不足"
    	   s_debug("curnum1="..curnum.."medalbm.level="..medalbm.level)
            if medalbm == nil then
                s_sysInfo(uid,"已经升到最高等级，无需再升",ChatPos_Tips)
                return VALUE_FAIL
            end
            if curnum <  medalbm.needpoint then
                s_sysInfo(uid,tips,ChatPos_Tips)
                return VALUE_FAIL
            end
            if medalbm.needmoney ~= 0 then
                local gold = s_getMoney(uid,MoneyType_MoneyTicket)   --这儿因为 金钱还没做，暂时用一种，后面加上之后这统一修改
                if gold < medalbm.needmoney then
                    s_sysInfo(uid,"银两不足",ChatPos_Tips)
                    return VALUE_FAIL
                end
            end
            --条件检测完成，开始扣钱发物品
            if s_removeMoney(uid,MoneyType_MoneyTicket,medalbm.needmoney,"宝石升级扣除") ~= VALUE_OK then -- 金币类型后续记得修改
                s_sysInfo(uid, "银两不足无法升级",ChatPos_Tips);
                return VALUE_FAIL
            end
	    if UserLevelCompare(uid, userlevel, medalbm.level) then
            	s_setVar(uid,140,61,curnum - medalbm.needpoint)
	    else
		return VALUE_FAIL
	    end
            if s_copyItemInheritData(uid,itemid,medalbm.id) ~= VALUE_OK then
                return VALUE_FAIL;
            end
	    s_debug("curnum="..curnum.."medalbm.id="..medalbm.id)
            return medalbm.id
    end
end

function OnRequestBenefit(uid,itemThisId1,itemThisId2,itemThisId3,itemThisId4)
	local slevel = 0
	local baseid1 = s_getitembaseid(uid,itemThisId1) -- 神石	
	local baseid2 = s_getitembaseid(uid,itemThisId2) --护盾
	local baseid3 = s_getitembaseid(uid,itemThisId3) --护符
	local baseid4 = s_getitembaseid(uid,itemThisId4) --龙珠
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性11 = "..baseid1)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性22 = "..baseid2)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性33 = "..baseid3)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性44 = "..baseid4)
	if baseid1 == 0 and baseid1 == nil and baseid2 == 0 and baseid2 == nil and baseid3 == 0 and baseid3 == nil and baseid4 == 0 and baseid4 == nil	then
		return VALUE_FAIL
	end
	local medalbm1 = 0
	local medalbm2 = 0
	local medalbm3 = 0
	local medalbm4 = 0
	slevel = s_getVar(uid,140,132)
	local medalbm = TreasureBenefitDataBase[slevel + 1]
	if medalbm == nil then
                --s_sysInfo(uid,"已经升到最高等级，无需再升",ChatPos_Tips)
                return VALUE_FAIL
        end
	baseid1 = baseid1 - 130000
	baseid2 = baseid2 - 141000
	local profession =  s_getValue(0,uid,VALUE_TYPE_PROFESSION)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性44 profession  = "..profession)
	local sjade = 120000
        if profession == Profession_Gunman then --法师
        	sjade = 120100
        elseif profession == Profession_Freeman then --道士
                sjade = 120200
        end
	baseid3 = baseid3 - sjade	
	baseid4 = baseid4 - 140000
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性1 = "..baseid1)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性2 = "..baseid2)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性3 = "..baseid3)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性4 = "..baseid4)
	if baseid3 >= medalbm.amuletLevel and baseid2 >= medalbm.shieldLevel and baseid1 >= medalbm.stoneLevel and baseid4 >= medalbm.dragonballLevel then
		--[[
		s_addValue(0,uid,VALUE_TYPE_MAXHP_ADD_BASE,medalbm.maxhp)
    		s_addValue(0,uid,VALUE_TYPE_PDAM,medalbm.pdam)
    		s_addValue(0,uid,VALUE_TYPE_PMAXDAM,medalbm.pmaxdam)
    		s_addValue(0,uid,VALUE_TYPE_MDAM,medalbm.mdam)
    		s_addValue(0,uid,VALUE_TYPE_MMAXDAM,medalbm.mmaxdam)
    		s_addValue(0,uid,VALUE_TYPE_TDAM,medalbm.tdam)
    		s_addValue(0,uid,VALUE_TYPE_TMAXDAM,medalbm.tmaxdam)
    		s_addValue(0,uid,VALUE_TYPE_PDEF,medalbm.pdef)
    		s_addValue(0,uid,VALUE_TYPE_PMAXDEF,medalbm.pmaxdef)
    		s_addValue(0,uid,VALUE_TYPE_MDEF,medalbm.mdef)
    		s_addValue(0,uid,VALUE_TYPE_MMAXDEF,medalbm.mmaxdef)
    		s_addValue(0,uid,VALUE_TYPE_LUCKYDEF,medalbm.luckyvalue)
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物加属性1 = "..medalbm.maxhp..medalbm.pdam..medalbm.pmaxdam..medalbm.mdam..medalbm.mmaxdam..medalbm.tdam..medalbm.tmaxdam..medalbm.pdef..medalbm.pmaxdef..medalbm.mdef..medalbm.mmaxdef..medalbm.luckyvalue)]]--	
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物互利生效")
		s_setVar(uid,140,132,slevel + 1)
		slevel = slevel + 1
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物互利生效 slevel ="..slevel)
		return slevel
	else
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>宝物互利生效 slevel ="..slevel)
		return VALUE_FAIL
	end
end
