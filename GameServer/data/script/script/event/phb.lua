--排行榜奖励发放
function OnPhbPresentEvent(uid,typeid,order)
--[[	local worldlevel = s_getWorldLevel()
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local year = s_getCurTime(TIME_CURYEARS)+1900
	--巅峰战力榜--
	if typeid == 12 then
		if order == 1 then
			s_sysMail(uid,"巅峰战斗力排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26200,1,"1-1")
			s_debugUser(uid,"巅峰战力第一名奖励")
			s_sysInfo(uid,"<p><n>您的战斗力排行本服第一，获得了道具“战力第一”。使用后可获得重击、致命、忽视加成3%的buff。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--周魅力榜（男）--
	elseif typeid == 16 then
		local charmvalue = s_getField(uid,UserVar_WeekCharm)
		if order == 1 then
			s_sysMail(uid,"周魅力榜（男）排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55138,1,"1-1")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第一。所以获得了我们送上的白马王子称号。</n></p>",ChatPos_Sys + ChatPos_Important)
			s_debugUser(uid,"周魅力男第一名奖励")
		elseif order == 2 then
			s_sysMail(uid,"周魅力榜（男）排行第二奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55139,1,"1-1")
			s_debugUser(uid,"周魅力男第二名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第二。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3 then
			s_sysMail(uid,"周魅力榜（男）排行第三奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55139,1,"1-1")
			s_debugUser(uid,"周魅力男第三名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第三。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 4 then
			s_sysMail(uid,"周魅力榜（男）排行第四奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55140,1,"1-1")
			s_debugUser(uid,"周魅力男第四名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第四。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 5 then
			s_sysMail(uid,"周魅力榜（男）排行第五奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55140,1,"1-1")
			s_debugUser(uid,"周魅力男第五名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第五。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 6 then
			s_sysMail(uid,"周魅力榜（男）排行第六奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55140,1,"1-1")
			s_debugUser(uid,"周魅力男第六名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周绅士魅力榜上排名第六。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)

		end
		--周魅力榜（女）--
	elseif typeid == 15 then
		local charmvalue = s_getField(uid,UserVar_WeekCharm)
		if order == 1  then
			s_sysMail(uid,"周魅力榜（女）排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55141,1,"1-1")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第一。所以获得了我们送上的魅力公主称号。</n></p>",ChatPos_Sys + ChatPos_Important)
			s_debugUser(uid,"周魔力女第一名奖励")
		elseif order == 2 then
			s_sysMail(uid,"周魅力榜（女）排行第二奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55142,1,"1-1")
			s_debugUser(uid,"周魅力女第二名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第二。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3 then
			s_sysMail(uid,"周魅力榜（女）排行第三奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55142,1,"1-1")
			s_debugUser(uid,"周魅力女第三名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第三。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 4 then
			s_sysMail(uid,"周魅力榜（女）排行第四奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55143,1,"1-1")
			s_debugUser(uid,"周魅力女第四名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第四。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 5 then
			s_sysMail(uid,"周魅力榜（女）排行第五奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55143,1,"1-1")
			s_debugUser(uid,"周魅力女第五名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第五。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 6 then
			s_sysMail(uid,"周魅力榜（女）排行第六奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55143,1,"1-1")
			s_debugUser(uid,"周魅力女第六名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周淑女魅力榜上排名第六。所以获得了我们送上的荣誉奖励。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--战士战力榜--
	elseif typeid == 17 then
		if order == 1 then
			s_sysMail(uid,"战士战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55125,1,"1-1")
			s_debugUser(uid,"战士战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周战士战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--刺客战力榜--
	elseif typeid == 18 then
		if order == 1 then
			s_sysMail(uid,"刺客战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55126,1,"1-1")
			s_debugUser(uid,"刺客战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周刺客战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--枪手战力榜--
	elseif typeid == 19 then
		if order == 1 then
			s_sysMail(uid,"枪手战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55127,1,"1-1")
			s_debugUser(uid,"枪手战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周枪手战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--魔炮战力榜--
	elseif typeid == 20 then
		if order == 1 then
			s_sysMail(uid,"魔炮战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55128,1,"1-1")
			s_debugUser(uid,"魔炮战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周魔炮战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--法师战力榜--
	elseif typeid == 21 then
		if order == 1 then
			s_sysMail(uid,"法师战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55130,1,"1-1")
			s_debugUser(uid,"法师战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周法师战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--牧师战力榜--
	elseif typeid == 22 then
		if order == 1 then
			s_sysMail(uid,"牧师战力榜排行第一奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55129,1,"1-1")
			s_debugUser(uid,"牧师战力第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周牧师战斗力排名第一。所以获得了我们送上的特殊称号。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--周狂飙榜--
	elseif typeid == 8 then
		if order == 1  then
			s_sysMail(uid,"周狂飙榜第一名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,100,"1-1")
			s_debugUser(uid,"狂飙榜第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周狂飙榜上排名第一。所以获得了我们送上的100个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 2  then
			s_sysMail(uid,"周狂飙榜第二名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,50,"1-1")
			s_debugUser(uid,"狂飙榜第二名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周狂飙榜上排名第二。所以获得了我们送上的50个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3  then
			s_sysMail(uid,"周狂飙榜第三名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,30,"1-1")
			s_debugUser(uid,"狂飙榜第三名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周狂飙榜上排名第三。所以获得了我们送上的30个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 4 and order <= 10  then
			s_sysMail(uid,"周狂飙榜第四至十名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,10,"1-1")
			s_debugUser(uid,"狂飙榜第四至十名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周狂飙榜上排名第四至十名。所以获得了我们送上的10个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--周答题榜--
	elseif typeid == 28 then
		if order == 1  then
			s_sysMail(uid,"周答题榜第一名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,100,"1-1")
			s_debugUser(uid,"答题榜第一名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周答题榜上排名第一。所以获得了我们送上的100个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 2  then
			s_sysMail(uid,"周答题榜第二名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,50,"1-1")
			s_debugUser(uid,"答题榜第二名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周答题榜上排名第二。所以获得了我们送上的50个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3  then
			s_sysMail(uid,"周答题榜第三名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,30,"1-1")
			s_debugUser(uid,"答题榜第三名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周答题榜上排名第三。所以获得了我们送上的30个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 4 and order <= 10  then
			s_sysMail(uid,"周答题榜第四至十名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,26102,10,"1-1")
			s_debugUser(uid,"答题榜第四至十名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，因为您本周答题榜上排名第四至十名。所以获得了我们送上的10个幸运宝石。</n></p>",ChatPos_Sys + ChatPos_Important)
		end

		--国家战斗力排行榜--
	elseif typeid == 56 then
		if order == 1 then
			s_sysMail(uid,"天之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55136,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"天之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"天之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 57 then
		if order == 1 then
			s_sysMail(uid,"火之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55133,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"火之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"火之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 58 then
		if order == 1 then
			s_sysMail(uid,"水之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55132,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"水之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"水之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 59 then
		if order == 1 then
			s_sysMail(uid,"沙之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55134,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"沙之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"沙之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 60 then
		if order == 1 then
			s_sysMail(uid,"风之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55131,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"风之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"风之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 61 then
		if order == 1 then
			s_sysMail(uid,"花之国国家战斗力周排行第1名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55135,1,"1-1")
		end
		if order <= 30  then
			if worldlevel ~= 1 then
				s_sysMail(uid,"花之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			else
				s_sysMail(uid,"花之国国家战斗力周排行前30名奖励！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,27108,300,"1-1")
				s_debugUser(uid,"国家战斗力前30名奖励")
				s_sysInfo(uid,"<p><n>恭喜您，因为您本周国家战斗力排名前30名。所以获得了我们送上的升级宝石300枚。</n></p>",ChatPos_Sys + ChatPos_Important)
			end
		end
	elseif typeid == 72 then
		if order >= 1 and order <= 10  then
			s_sysMail(uid,"坐骑资质排行榜前10名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,35305,1,"1-1,3-604800")
			s_debugUser(uid,"坐骑榜前10名")
			s_sysInfo(uid,"<p><n>恭喜您，获得坐骑资质排行榜第10名。所以获得了我们送上的专属坐骑时装兑换券。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--战宠综合评分排行榜--
	elseif typeid == 74 then
		if order >= 1 and order <= 10  then
			s_sysMail(uid,"战宠综合评分排行榜前10名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,42018,1,"1-1,3-604800")
			s_debugUser(uid,"战宠榜前10名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，获得战宠综合评分排行榜前10名。所以获得了我们送上的稀有Boss宠物幻化道具。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--侍宠综合评分排行榜--
	elseif typeid == 75 then
		if order >= 1 and order <= 10  then
			s_sysMail(uid,"侍宠综合评分排行榜前10名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,42019,1,"1-1,3-604800")
			s_debugUser(uid,"侍宠榜前10名奖励")
			s_sysInfo(uid,"<p><n>恭喜您，获得侍宠综合评分排行榜前10名。所以获得了我们送上的稀有Boss宠物幻化道具。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
		--周充值排行榜--
	elseif typeid == 79 then
		if month == 5 and mday == 5 then
		if order == 1 then
		s_sysMail(uid,"周充值排行榜第1名！五一活动特殊奖励！",0,32240,1,"1-1")
		elseif order == 2 then
		s_sysMail(uid,"周充值排行榜第2名！五一活动特殊奖励！",0,32239,3,"1-1")
		elseif order == 3 then
		s_sysMail(uid,"周充值排行榜第3名！五一活动特殊奖励！",0,32239,2,"1-1")
		end
		end
		if year == 2015 and month == 7 and mday >= 14 and mday <= 26 then
			if	s_getVar(uid,1,15) >= 1000000 then
				if order == 1  then
					s_sysMail(uid,"周充值排行榜第1名！暑期活动特殊属性双人坐骑奖励！",0,52067,1,"1-1")
				elseif order >= 2 and order <= 3 then
					s_sysMail(uid,"周充值排行榜第2-4名！暑期活动特殊属性坐骑奖励！",0,52057,1,"1-1,3-604800")
				elseif order >= 4 and order <= 10 then
					s_sysMail(uid,"周充值排行榜第4-10名！暑期活动特殊属性坐骑奖励！",0,52058,1,"1-1")
				end
			end
		end


		if order == 1  then
			s_sysMail(uid,"周充值排行榜第1名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,16,"1-1")
			s_sysMail(uid,"周充值排行榜第1名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,55137,1,"1-1")
			s_debugUser(uid,"周充值榜第1名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第1名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 2  then
			s_sysMail(uid,"周充值排行榜第2名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,14,"1-1")
			s_debugUser(uid,"周充值榜第2名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第2名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3  then
			s_sysMail(uid,"周充值排行榜第3名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,12,"1-1")
			s_debugUser(uid,"周充值榜第3名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第3名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 4  then
			s_sysMail(uid,"周充值排行榜第4名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,10,"1-1")
			s_debugUser(uid,"周充值榜第4名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第4名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 5  then
			s_sysMail(uid,"周充值排行榜第5名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,8,"1-1")
			s_debugUser(uid,"周充值榜第5名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第5名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 6 and order <= 10  then
			s_sysMail(uid,"周充值排行榜第6-10名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,6,"1-1")
			s_debugUser(uid,"周充值榜第6-10名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第6-10名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 11 and order <= 15  then
			s_sysMail(uid,"周充值排行榜第11-15名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,5,"1-1")
			s_debugUser(uid,"周充值榜第11-15名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第11-15名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 16 and order <= 20  then
			s_sysMail(uid,"周充值排行榜第16-20名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,4,"1-1")
			s_debugUser(uid,"周充值榜第16-20名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第16-20名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 21 and order <= 25  then
			s_sysMail(uid,"周充值排行榜第21-25名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,3,"1-1")
			s_debugUser(uid,"周充值榜第21-25名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第21-25名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 26 and order <= 30  then
			s_sysMail(uid,"周充值排行榜第26-30名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,2,"1-1")
			s_debugUser(uid,"周充值榜第26-30名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第26-30名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order >= 31 and order <= 50  then
			s_sysMail(uid,"周充值排行榜第31-50名！感谢您一直以来对于兵王2的支持，也祝贺您获得了排行榜上的荣誉！",0,32238,1,"1-1")
			s_debugUser(uid,"周充值榜第31-50名")
			s_sysInfo(uid,"<p><n>恭喜您，获得周充值排行榜第31-50名。所以获得了我们送上的蓝色品质星耀石礼盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
	elseif typeid == 101 then --1对1模拟战
		if order == 1  then
			local num = 10
			s_sysMail(uid,"恭喜您成为本周1对1模拟战的王者，获得".. num*50 .."点声望奖励",0,22,num,"1-1")
			s_debugUser(uid,"1对1模拟战第一名奖励")
	elseif order == 2  then
		local num = 9
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第二名，获得".. num*50 .."点声望奖励，请再接再励，获得第一名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第2名奖励")
	elseif order == 3  then
		local num = 8
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第二名，获得".. num*50 .."点声望奖励，请再接再励，获得第二名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第3名奖励")
	elseif order <= 6  then
		local num = 7
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第4-6名，获得".. num*50 .."点声望奖励，请再接再励，获得第三名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第4-6名奖励")
	elseif order <= 10  then
		local num = 6
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第7-10名，获得".. num*50 .."点声望奖励，请再接再励，获得4-6名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第7-10名奖励")
	elseif order <= 20  then
		local num = 5
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第11-20名，获得".. num*50 .."点声望奖励，请再接再励，获得7-10名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第11-20名奖励")
	elseif order <= 30  then
		local num = 4
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第21-30名，获得".. num*50 .."点声望奖励，请再接再励，获得11-20名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第21-30名奖励")
	elseif order <= 50  then
		local num = 3
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第31-50名，获得".. num*50 .."点声望奖励，请再接再励，获得21-30名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第31-50名奖励")
	elseif order <= 100  then
		local num = 2
		s_sysMail(uid,"恭喜您成为本周1对1模拟战第51-100名，获得".. num*50 .."点声望奖励，请再接再励，获得31-50名可获得".. ((num+1)*50) .."点声望奖励",0,22,num,"1-1")
		s_debugUser(uid,"1对1模拟战第51-100名奖励")
	end
	--飞跃彩虹谷周排行榜--
	elseif typeid == 80 then
		if order == 1  then
			s_sysMail(uid,"飞跃彩虹谷排行榜第1名！感谢您一直以来对于兵王2的支持，也祝贺您所在团获得了排行榜上的荣誉！",0,55090,10,"1-1")
			s_debugUser(uid,"飞跃彩虹谷榜第1名")
			s_sysInfo(uid,"<p><n>恭喜您的团，获得飞跃彩虹谷排行榜第1名。所以获得了我们送上的魔甲材料盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 2  then
			s_sysMail(uid,"飞跃彩虹谷排行榜第2名！感谢您一直以来对于兵王2的支持，也祝贺您所在团获得了排行榜上的荣誉！",0,55090,8,"1-1")
			s_debugUser(uid,"飞跃彩虹谷榜第2名")
			s_sysInfo(uid,"<p><n>恭喜您的团，获得飞跃彩虹谷排行榜第2名。所以获得了我们送上的魔甲材料盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order == 3  then
			s_sysMail(uid,"飞跃彩虹谷排行榜第3名！感谢您一直以来对于兵王2的支持，也祝贺您所在团获得了排行榜上的荣誉！",0,55090,5,"1-1")
			s_debugUser(uid,"飞跃彩虹谷榜第3名")
			s_sysInfo(uid,"<p><n>恭喜您的团，获得飞跃彩虹谷排行榜第3名。所以获得了我们送上的魔甲材料盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		elseif order <= 10 then
			s_sysMail(uid,"飞跃彩虹谷排行榜第4-10名！感谢您一直以来对于兵王2的支持，也祝贺您所在团获得了排行榜上的荣誉！",0,55090,2,"1-1")
			s_debugUser(uid,"飞跃彩虹谷榜第4-10名")
			s_sysInfo(uid,"<p><n>恭喜您的团，获得飞跃彩虹谷排行榜第4-10名。所以获得了我们送上的魔甲材料盒。</n></p>",ChatPos_Sys + ChatPos_Important)
		end
	end]]
end
