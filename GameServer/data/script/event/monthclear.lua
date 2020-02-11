function monthclear(uid)
	s_setVar(uid,16,1,0)			--签到奖励
end
function investmentclear(uid)
	s_setVar(uid,169,74,0)
	s_setVar(uid,169,75,0)
end
function clantaskclear(uid)
	for i=40001,40046,1 do
		s_removeAllTaskMaterial(uid,i)
		s_delTask(uid,i)
	end
end



--离线找回每日统计
function dailyofflinecalc(uid)
	local daynum = s_getCurTime(12)
	local clearday = s_getVar(uid,169,149) 
	s_trace(uid.."==dailyofflinecalc..clearday="..clearday.."..daynum="..daynum)
	if daynum > clearday and daynum - clearday >1 then
		dailyofflinestatusclear(uid)
	end
	for i=127,136,1 do
		s_setVar(uid,169,i,0)
	end
	
	s_setVar(uid,169,127,s_getVar(uid,169,107))
	s_setVar(uid,169,128,s_getVar(uid,169,123))
	s_setVar(uid,169,129,s_getVar(uid,169,124))
	s_setVar(uid,169,130,s_getVar(uid,169,125))
	s_setVar(uid,169,131,s_getVar(uid,169,126))

	s_setVar(uid,169,132,s_getVar(uid,169,108))
	s_setVar(uid,169,133,s_getVar(uid,169,109))
	s_setVar(uid,169,134,s_getVar(uid,169,110))
	s_setVar(uid,169,135,s_getVar(uid,169,111))
	s_setVar(uid,169,136,s_getVar(uid,169,112))
	dailyofflinestatusclear(uid)
	s_setVar(uid,169,149,daynum)
end



-- 增加每日额外清理
function dailyofflinestatusclear(uid)
	s_trace(uid.."==dailyofflinestatusclear")
	for i=102,126,1 do
		s_setVar(uid,169,i,0)
	end
	s_setVar(uid,169,151,0)
   local rebirthnum = s_getRebirthLevel(uid)
   local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
   local level1 = FindBackDataBase.query(1).lev 
   local level2 = FindBackDataBase.query(2).lev  
   local level3 = FindBackDataBase.query(3).lev  
   local level4 = FindBackDataBase.query(4).lev  
   local level5 = FindBackDataBase.query(5).lev  
   local level6 = FindBackDataBase.query(6).lev  
   local level7 = FindBackDataBase.query(7).lev  
   local level8 = FindBackDataBase.query(8).lev  
   local level9 = FindBackDataBase.query(9).lev  
   --local level10 = FindBackDataBase.query(10).lev 
	--s_trace(uid.."dailyofflinestatusclear=="..level1.."=="..level2.."=="..level3.."=="..level4.."=="..level5.."=="..level6.."=="..level7.."=="..level8.."=="..level9.."=="..level10)
	s_trace(uid.."dailyofflinestatusclear=="..level1.."=="..level2.."=="..level3.."=="..level4.."=="..level5.."=="..level6.."=="..level7.."=="..level8.."=="..level9)
    if level >= level1 then
		s_setVar(uid,169,107,5)	--经验副本1
		s_setVar(uid,169,141,0)
	else
		s_setVar(uid,169,141,1)
	end
	if level >= level2 then
		s_setVar(uid,169,123,5)
	end
	if level >= level3 then
		s_setVar(uid,169,124,5)
	end
	if level4 > 1000 and rebirthnum >= level4 - 1000 then
		s_setVar(uid,169,125,5)
	end
	if level5 > 1000 and  rebirthnum >= level5 - 1000 then
		s_setVar(uid,169,126,5)
	end
	
	if level >= level6 then
		s_setVar(uid,169,108,10) --佣兵任务次数
		s_setVar(uid,169,142,0)
	else
		s_setVar(uid,169,142,1)
	end
	if level >= level7 then
		s_setVar(uid,169,109,3)	 --守卫中都	
		s_setVar(uid,169,143,0)
	else
		s_setVar(uid,169,143,1)
	end
	if level >= level8 then
		s_setVar(uid,169,110,10) --竞技场
		s_setVar(uid,169,144,0)
	else
		s_setVar(uid,169,144,1)
	end
	if level >= level9 and s_getClanID(uid) > 0 then
		s_setVar(uid,169,111,10) --宗门任务
		s_setVar(uid,169,145,0)
	else
		s_setVar(uid,169,145,1)
	end
	--[[if level >= level10 and s_getVar(uid,169,93)>0 then
		s_setVar(uid,169,112,s_getVar(uid,169,93)) -- 爬塔
		s_setVar(uid,169,146,0)
	else
		s_setVar(uid,169,146,1)
	end]]
end


