--榴弹火炮
function OnUseSkill_10401(level,etype1,eid1,etype2,eid2)
	local hurt = {14,20,28,44,61,81,120,162,221,280,340,401,519,640,771,
		905,1106,1317,1522,1723,2042,2385,2731,3075,3426,3762,4104,4446,4789,5106,5422}

	local percent = { 15,15,15,16,16,16,17,17,18,18,19,19,19,19,19,20}

	--[[
	local blv10404 = s_getbufflevel(etype1,eid1,10404)
	if blv10404 ~= 0 then
	local hit = percent[blv10404]
	if math.random(1,100) <= hit then
	BeatBack(etype1,eid1,etype2,eid2,2,3)
	end
	end
	]]

	local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	if etype2 == SCENE_ENTRY_PLAYER then
		damage = damage + hurt[level]
	else
		damage = damage + hurt[level] * 1.5
	end

	MagicAttack(10401,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end


