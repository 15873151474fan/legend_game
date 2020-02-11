--神兵魔武的属性提升
ItemShenbing = {
	attribute = {
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 90等级段
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 100等级段
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 110等级段
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 120等级段
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 130等级段
		{
			--防御、攻击、生命、随机低值、随机高值
			hat = {10000,0,0,5,10},			--头部
			cloth = {10000,0,10000,5,10},		--护甲
			medal = {0,10000,0,5,10},		--勋章
			glove = {10000,0,0,5,10},		--护腕
			ring = {0,10000,0,5,10},		--戒指
			belt = {10000,0,0,5,10},		--腰带
			shoes = {10000,0,0,5,10},		--鞋子
			necklace = {0,10000,0,5,10},	--项链
			under = {10000,0,0,5,10},		--内衣
			soldier = {0,10000,0,5,10},		--战士武器
			master = {0,10000,0,5,10},		--刺客武器
			assassin = {0,10000,0,5,10},	--法师武器
			minister = {0,10000,0,5,10},	--牧师武器
		},-- 140等级段
	}
}

function ItemShenbing:buildAttribute(uid,itemid)
	local needlevel = s_getItemValue(uid,itemid,Item_Base_NeedLevel)
	local itemtype = s_getItemValue(uid,itemid,Item_Base_Type)
	local def = 0
	local dam = 0
	local maxhp = 0
	if itemtype == ItemType_ShenbingHat then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].hat[4],self.attribute[math.floor(needlevel/10)-8].hat[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].hat[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].hat[4],self.attribute[math.floor(needlevel/10)-8].hat[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].hat[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].hat[4],self.attribute[math.floor(needlevel/10)-8].hat[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].hat[3]*rand/100)
	elseif itemtype == ItemType_ShenbingClothP then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[3]*rand/100)
	elseif itemtype == ItemType_ShenbingClothM then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].cloth[4],self.attribute[math.floor(needlevel/10)-8].cloth[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].cloth[3]*rand/100)
	elseif itemtype == ItemType_ShenbingMedal then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].medal[4],self.attribute[math.floor(needlevel/10)-8].medal[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].medal[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].medal[4],self.attribute[math.floor(needlevel/10)-8].medal[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].medal[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].medal[4],self.attribute[math.floor(needlevel/10)-8].medal[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].medal[3]*rand/100)
	elseif itemtype == ItemType_ShenbingGlove then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].glove[4],self.attribute[math.floor(needlevel/10)-8].glove[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].glove[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].glove[4],self.attribute[math.floor(needlevel/10)-8].glove[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].glove[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].glove[4],self.attribute[math.floor(needlevel/10)-8].glove[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].glove[3]*rand/100)
	elseif itemtype == ItemType_ShenbingRing then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].ring[4],self.attribute[math.floor(needlevel/10)-8].ring[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].ring[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].ring[4],self.attribute[math.floor(needlevel/10)-8].ring[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].ring[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].ring[4],self.attribute[math.floor(needlevel/10)-8].ring[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].ring[3]*rand/100)
	elseif itemtype == ItemType_ShenbingBelt then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].belt[4],self.attribute[math.floor(needlevel/10)-8].belt[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].belt[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].belt[4],self.attribute[math.floor(needlevel/10)-8].belt[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].belt[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].belt[4],self.attribute[math.floor(needlevel/10)-8].belt[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].belt[3]*rand/100)
	elseif itemtype == ItemType_ShenbingShoes then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].shoes[4],self.attribute[math.floor(needlevel/10)-8].shoes[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].shoes[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].shoes[4],self.attribute[math.floor(needlevel/10)-8].shoes[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].shoes[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].shoes[4],self.attribute[math.floor(needlevel/10)-8].shoes[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].shoes[3]*rand/100)
	elseif itemtype == ItemType_ShenbingNecklace then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].necklace[4],self.attribute[math.floor(needlevel/10)-8].necklace[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].necklace[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].necklace[4],self.attribute[math.floor(needlevel/10)-8].necklace[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].necklace[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].necklace[4],self.attribute[math.floor(needlevel/10)-8].necklace[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].necklace[3]*rand/100)
	elseif itemtype == ItemType_ShenbingUnder then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].under[4],self.attribute[math.floor(needlevel/10)-8].under[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].under[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].under[4],self.attribute[math.floor(needlevel/10)-8].under[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].under[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].under[4],self.attribute[math.floor(needlevel/10)-8].under[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].under[3]*rand/100)
	elseif itemtype == ItemType_ShenbingSoldier then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].soldier[4],self.attribute[math.floor(needlevel/10)-8].soldier[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].soldier[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].soldier[4],self.attribute[math.floor(needlevel/10)-8].soldier[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].soldier[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].soldier[4],self.attribute[math.floor(needlevel/10)-8].soldier[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].soldier[3]*rand/100)
	elseif itemtype == ItemType_ShenbingMaster then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].master[4],self.attribute[math.floor(needlevel/10)-8].master[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].master[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].master[4],self.attribute[math.floor(needlevel/10)-8].master[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].master[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].master[4],self.attribute[math.floor(needlevel/10)-8].master[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].master[3]*rand/100)
	elseif itemtype == ItemType_ShenbingAssassin then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].assassin[4],self.attribute[math.floor(needlevel/10)-8].assassin[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].assassin[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].master[4],self.attribute[math.floor(needlevel/10)-8].master[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].assassin[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].master[4],self.attribute[math.floor(needlevel/10)-8].master[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].assassin[3]*rand/100)
	elseif itemtype == ItemType_ShenbingMinister then
		local rand =
			math.random(self.attribute[math.floor(needlevel/10)-8].minister[4],self.attribute[math.floor(needlevel/10)-8].minister[5])
		def = math.floor(self.attribute[math.floor(needlevel/10)-8].minister[1]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].minister[4],self.attribute[math.floor(needlevel/10)-8].minister[5])
		dam = math.floor(self.attribute[math.floor(needlevel/10)-8].minister[2]*rand/100)
		rand = math.random(self.attribute[math.floor(needlevel/10)-8].minister[4],self.attribute[math.floor(needlevel/10)-8].minister[5])
		maxhp = math.floor(self.attribute[math.floor(needlevel/10)-8].minister[3]*rand/100)
	else
		return
	end
	s_setItemValue(uid,itemid,Item_Attribute_Shenbing_PerDef,def)
	s_setItemValue(uid,itemid,Item_Attribute_Shenbing_PerDam,dam)
	s_setItemValue(uid,itemid,Item_Attribute_Shenbing_PerMaxhp,maxhp)
	local rand = math.random(Item_Attribute_Shenbing_Liliang,Item_Attribute_Shenbing_Jingshen)
	s_setItemValue(uid,itemid,rand,5)
end
