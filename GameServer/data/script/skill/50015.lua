--踢球
function OnUseSkill_50015(level,etype1,eid1,etype2,eid2)
	baseid = s_getValue(etype2,eid2,VALUE_TYPE_BASE_ID)
	if baseid == 22720 or baseid == 22721 or baseid == 22722 or baseid == 22723 or baseid == 22724 then
		BeatBackMove(etype1,eid1,etype2,eid2,math.random(3,8),SCENE_ENTRY_NPC)
	else
		s_messageBox(eid1,"没有选中足球");
	end
	ShowAttack(50015,etype1,eid1,etype2,eid2)
end
function BeatBackMove(etype1,eid1,etype2,eid2,step,gtype)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)

	local dst = math.floor(math.sqrt((x1-x2)^2 + (y1-y2)^2))
	if dst == 0 then dst = 1 end
	local x = step / dst * (x2 - x1) + x2
	local y = step / dst * (y2 - y1) + y2
	if s_getVar(eid1,117,1) ~= 0 then
		if x2 == 69 and x < 69 and y2 < 136 and y2 > 126 and s_getVar(eid1,117,1) == 1 then
			FootBallWin(etype1,eid1,etype2,eid2)
			return
		elseif x2 == 172 and x > 172 and y2 < 136 and y2 > 126 and s_getVar(eid1,117,1) == 1 then
			FootBallWin(etype1,eid1,etype2,eid2)
			return
		else
			if x < 69 then
				x = 69
				--s_worldInfo("到位了0", ChatPos_Honor)
			end
			if x > 172 then
				x = 172
				--s_worldInfo("到位了1", ChatPos_Honor)
			end
			if y < 98 then
				y = 98
			end
			if y > 166 then
				y = 166
			end
		end
	end
	if x < 67 then
		x = 67
	end
	if x > 174 then
		x = 174
	end
	if y < 98 then
		y = 98
	end
	if y > 166 then
		y = 166
	end

	s_move(SCENE_ENTRY_NPC,eid2,x,y,math.random(3,6))
end
function FootBallWin(etype1,eid1,etype2,eid2)
	local name = s_getValue(SCENE_ENTRY_PLAYER,eid1,VALUE_TYPE_NAME)
	local text = ""
	if s_getVar(eid1,117,1) == 1 then
		text = "红方"
	elseif s_getVar(eid1,117,1) == 2 then
		text = "蓝方"
	end
	s_addVar(eid1,117,2,s_getVar(eid1,117,2) + 1)
	s_worldInfo("<p><n color=GXColorBlueSky>" .. text .. "的</n><q buttonid=6005 ownerid=" .. eid1 .. ">" .. name .. "</q><n color=GXColorBlueSky>进了第" .. s_getVar(eid1,117,2) .. "个球！</n></p>",ChatPos_Sys + ChatPos_Honor)
	print("进球了")
	s_goto(SCENE_ENTRY_NPC,eid2,120,132)
end
