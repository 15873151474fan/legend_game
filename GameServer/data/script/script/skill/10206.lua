--残像闪烁(作废)
function OnUseSkill_10206(level,etype1,eid1,etype2,eid2)
	local adjust = {{0,-1},{1,-1},{1,0},{1,1},{0,1},{-1,1},{-1,0},{-1,-1},{0,0}}
	local dir = s_getValue(etype1,eid1,VALUE_TYPE_DIR)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)

	x1 = x1 + adjust[dir][1] * 8
	y1 = y1 + adjust[dir][2] * 8

	s_goto(etype1,eid1,x1,y1,2)
	ShowAttack(10206,etype1,eid1,etype2,eid2)
end
