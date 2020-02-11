function OnNewFunctionTips(uid)
	--local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	--if level > 21 then
	--s_sysRightBook(uid,70232,"新内容推荐",1800,15,1)
	--end
	--local worldlevel = s_getWorldLevel()
	--新功能礼包  策划在配置时一定注意，s_addVar(uid, 10000,5,1)中的1类似的依次类推，一个对应一个，绝对不能出现混用的情况
	--新功能礼包 已使用1、2羽翼系统、3重铸材料补偿、4劳伦斯的信、5人生转轮、6奥运会、7七夕、8中秋、9万圣节、10感恩节、11圣诞节、12任务委托、13新年、14宠物寄养、15劳动节、16端午节,17纹章打孔,18七夕,19无双擂台赛,20中秋（2013）,21情人节，22妇女节 ，23神魂觉醒,24愚人节,25婚贴活动,26世界杯活动
	--劳伦斯的信

	--if level >= 51 then
		--if s_getVar(uid, 10000,8) ~= 26 then
			--s_addVar(uid, 10000,8,26)
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  中秋佳节至谨祝奥丁大陆的勇士们：学业、事业和生活如同此时的月亮一样，圆圆满满。</n><newline/><n>  节日期间，特别准备了节日礼物，找</n><goto id='363' mapid='5' flagpoint='1'/><n>免费领取吧！</n></p> ",0,31214,1,"1-1")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  柔情似水，佳期如梦，牛郎织女，鹊桥相会，愿天下有情人终成眷属！快来找</n><goto id='320' mapid='159' flagpoint='1'/><n>参加活动吧，</n><n color='GXColorGreen'>骆驼坐骑</n><n>等你来拿！</n></p>  ")
			----s_sysMail(uid,"<p><n>亲爱的朋友们：</n><newline/><n>  2012伦敦奥运会开始了，让我们一起为中国队加油！</n><newline/><n>  参与即可每天免费领取稀有道具、海量赠点、奥运礼包。 </n><newline/><n>  快去找</n><goto id='313' mapid='159' flagpoint='1'/><n>为中国队助威吧！！",0,55062,5,"1-1")
			----s_sysMail(uid,"<p><n>勇士们：</n><newline/><n>  新副本：人生转轮已出现。地宫副本区</n><goto id='313' mapid='159' flagpoint='1'/><n>处，达到封印等级可进！</n><newline/><n>             曾美丽过的：歌利亚</n></p>",0,31802,1,"1-1")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  一年一度的万圣节降临奥丁大陆，穿上幽魂死神铠，骑上鬼哭神嚎，去找</n><goto id='337' mapid='5' flagpoint='1'/><n>参加活动吧！海量经验，丰厚礼品，等你来拿！</n></p> ",0,55229,1,"1-1,")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>   一年一度的感恩节来临了，吾王准备了肥美的火鸡盛宴，诚邀忠于王的勇者们共享！快来找</n><goto id='350' mapid='5' flagpoint='1'/><n>参加活动吧！海量经验，丰厚礼品，等你来拿！</n></p> ")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  叮叮当，叮叮当，铃儿响叮当……圣诞老人为奥丁大陆带来了丰厚的礼物，快来找</n><goto id='353' mapid='5' flagpoint='1'/><n>参加活动吧！海量经验，，圣诞特典道具，等你来拿！</n></p> ",0,44091,1,"1-1,")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  瑞雪纷飞，爆竹声脆，春节将临!快来找</n><goto id='367' mapid='5' flagpoint='1'/><n>来参加活动吧！丰厚新年礼物等你来拿！</n></p> ",0,31309,1,"1-1,")
			----s_sysMail(uid,"<p><n>致拥有爱的人：</n><newline/><n>  被爱不一定是幸福，去爱才真的幸福！在这玫瑰花香的时节，对爱你的人说声“谢谢”吧！</n></p> ",0,55260,1,"1-1,")
			----s_sysMail(uid,"<p><n>至美丽的女性朋友们：</n><newline/><n>  温柔是你的外号，美丽是你的小名，气质是你的称呼！快来找</n><goto id='370' mapid='5' flagpoint='1'/><n>来参加活动吧，关心是情，爱心是意，女人节快乐！</n></p> ")
			----s_sysMail(uid,"<p><n>至奥丁大陆的朋友们：</n><newline/><goto id='216' mapid='5' flagpoint='1'/><n>在2014年又跟奥丁大陆的朋友见面，在这个节日，塔布里斯要跟各玩家比比，究竟谁才是终极的整蛊之王？来接受塔布里斯的挑战吧！！</n></p> ")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  活动期间，在</n><goto id='357' mapid='5' flagpoint='1'/><n>处可以获得1个日志本，每天获得的活力点会进行累计统计，根据达到的值可以领取对应奖励。</n></p> ")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>   划龙舟，挂菖蒲，前途事业不用愁；喝黄酒，贴五毒，亲朋好友都有福。</n><newline/><n>  端午即至，混国战网游鼻祖《兵王2》特献8重好礼庆佳节！10星合金免费领，还等什么，快来找</n><goto id='305' mapid='5' flagpoint='1'/><n>来参加活动吧！</n></p> ",0,31508,1,"1-1,")
			----s_sysMail(uid,"<p><n>至奥丁大陆的朋友们：</n><newline/><n>   2014巴西世界杯开始了，让我们一起为心爱的队伍加油！。</n><newline/><n>   参与即可获得海量奖品。</n><newline/><n>   快去找</n><goto id='313' mapid='5' flagpoint='1'/><n>为世界杯助威吧！</n></p> ")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  炎炎夏日，暑期来临，快来找</n><goto id='353' mapid='5' flagpoint='1'/><n>来参加活动吧，丰富奖励等你来拿！</n></p> ")
			----s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  欢庆六一活动：充值返利，魔幻卡牌，超值特权，珍品限购，详见节日说明。</n></p> ",0,63372,1,"1-1,")
		--end
	--end

	--上线送福利
	--if worldlevel == 1 then
		--if s_getCountryVar(13,10000,9) == 1 then
			--if level >= 31 and level <= 59 then
				--s_sysInfo(uid,"<p><n>人类进程的封印不久将破除，31-59级的角色可以前往光明城寻找</n><goto id='135' mapid='3' flagpoint='1'/><n>接取祭典任务，获得大量角色经验！</n></p>！",ChatPos_Pop)
			--end
		--end
	--end


	--60级送魔导器（15年1月20日测试用）
	--if level >= 51 then
	--if s_getVar(uid,116,444) == 0 then
	--s_addVar(uid, 116,444,1)
	--s_sysMail(uid,"<p><n>恭喜您获得雷神的加护，被赐予：雷神之怒！右键使用后，您的部分技能攻击将附带一定固定值闪电伤害。</n></p> ",0,63044,1,"1-1,")
	--end
	--end


	--婚礼活动邮件
	--[[if level >= 21 then
	if s_getVar(uid,116,321) ~=25 then
	s_addVar(uid, 116,321,25)
	s_sysMail(uid,"<p><n>亲爱的朋友：</n><newline/><n>  我们要结婚了，感谢您一直以来的支持，特此准备了婚帖，送呈您台启。</n> <goto id='45110' mapid='101' flagpoint='1'/><goto id='45131' mapid='101' flagpoint='1'/><n> 敬邀！</n></p> ",0,55266,1,"1-1,")
	end
	end]]--
	--神魂觉醒邮件
	--[[if level >= 100 then
	if s_getVar(uid,116,319) ~=23 then
	s_addVar(uid, 116,319,23)
	s_sysMail(uid,"<p><n>奥丁大陆的朋友们：</n><newline/><n>  恭喜您达到了100级，在此奖励您神魂觉醒体验包，请查收</n></p> ",0,55265,1,"1-1,")
	end
	end]]--
	--送话费
	--[[local worldlevel = s_getWorldLevel()
	if worldlevel < 2 then
	if level <= 30 then
	s_sysRightBook(uid,70213,"新内容推荐",1800,15,1)
	end
	--福利秘籍
	if level > 30 then
	s_sysRightBook(uid,70214,"新内容推荐",3000,15,1)
	end
	elseif worldlevel >= 2 then
	if level > 30 and level <= 59 then
	s_sysRightBook(uid,70215,"新内容推荐",300,15,1)
	end
	if level >= 60 and level < 80 then
	s_sysRightBook(uid,70216,"新内容推荐",300,15,1)
	end
	if level >= 80 then
	s_sysRightBook(uid,70217,"新内容推荐",300,15,1)
	end
	end
	--]]

	--[[屏蔽功能引导
	--7-20级新手说明
	if level >=7 and level <=20 then
	s_sysRightBook(uid,70195,"7-20级功能说明",1440,19,0)
	end
	--21-30级新手说明
	if level >=21 and level <=30 then
	s_sysRightBook(uid,70196,"21-30级功能说明",1440,20,0)
	end
	--31-40级新手说明
	if level >=31 and level <=40 then
	s_sysRightBook(uid,70197,"31-40级功能说明",1440,21,0)
	end
	--41-50级新手说明
	if level >=41 and level <=50 then
	s_sysRightBook(uid,70198,"41-50级功能说明",1440,22,0)
	end
	--51-60级新手说明
	if level >=51 and level <=60 then
	s_sysRightBook(uid,70199,"51-60级功能说明",1440,23,0)
	end
	--61-70级新手说明
	if level >=61 and level <=70 then
	s_sysRightBook(uid,70202,"61-70级功能说明",1440,24,0)
	end
	--71-80级新手说明
	if level >=71 and level <=80 then
	s_sysRightBook(uid,70203,"71-80级功能说明",1440,25,0)
	end
	--]]
	--[[
	if level >=14 or level <=19 then
	s_sysRightNewFunction(uid,3,"新内容推荐",1800,15,0)
	end
	local process = s_getTaskValue(uid,3681,TaskValue_Process)
	if process == TaskProcess_Doing then
	s_sysRightRemoveNewFunction(uid,3)
	end
	--]]
	--充值礼包
	--if level ==1 then
		--if s_getVar(uid,114,10) == 0 then
			----s_addItem(uid,32034,0,1,0,"1-1","充值礼包")
			----s_addItem(uid,63039,0,1,0,"1-1","金币礼包")
			----s_addItem(uid,32300,0,1,0,"1-1","超级兵王新手卡")
		--end
		--s_addVar(uid,114,10,1)
	--end
	--if worldlevel <2 then
		--if level >=50 then
			--if s_getVar(uid,10001,27) == 0 then
				--s_addItem(uid,34187,3,1,0,"1-1","新区送装备")
			--end
			--s_addVar(uid,10001,27,1)
		--end
	--end

	--[[屏蔽功能引导
	--阶段引导
	--5级授勋(1)
	if level >= 5 then
	if  level < 8 and s_getTaskValue(uid,3231,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,19,"授勋",180,42,0)
	end
	end
	--2、9级装备合成(2)
	if level >= 9 then
	if  level < 11 and s_getTaskValue(uid,3341,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,5,"装备合成",180,45,0)
	end
	end
	--11级宠物(3)
	if level >= 11 then
	if  level < 14 and s_getTaskValue(uid,3461,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,22,"宠物",180,35,0)
	end
	end
	--14级仓库(4)
	if level >= 14 then
	if  level < 19 and s_getTaskValue(uid,3681,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,3,"仓库",180,34,0)
	end
	end
	--19级坐骑(5)
	if level >= 19 then
	if  level < 22 and s_getTaskValue(uid,3811,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,9,"坐骑",180,46,0)
	end
	end
	--25级入团(6)
	if level >= 25 then
	if  level < 28 and s_getTaskValue(uid,12032,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,2,"入团",180,44,0)
	end
	end
	--28级生活技能(7)
	if level >= 28 then
	if  level < 29 and s_getTaskValue(uid,4201,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,29,"生活技能",180,38,0)
	end
	end
	--29级命运大厅(8)（2012年10月9日改为41级开启，42级关闭）
	if level >= 41 then
	if  level < 42  then
	s_sysRightNewFunction(uid,33,"命运大厅",180,44,0)
	end
	end
	--32级合体宠物(9)
	if level >= 32 then
	if  level < 34 and s_getTaskValue(uid,4412,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,32,"合体宠物",180,35,0)
	end
	end
	--34级探险者地宫(10)
	if level >= 34 then
	if  level < 36  then
	s_sysRightNewFunction(uid,17,"探险者地宫",180,44,0)
	end
	end
	--40级战斗坐骑(11)
	if level >= 40 then
	if  level < 41 and s_getTaskValue(uid,13051,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,42,"战斗坐骑",180,46,0)
	end
	end
	--42级5星武器(12)
	--if level >= 42 then
	--	if  level < 43 and s_getTaskValue(uid,1581,TaskValue_Process) ~= TaskProcess_Done then
	--		s_sysRightNewFunction(uid,58,"五星武器",180,41,0)
	--  end
	--  end
	--44级要塞守卫(13)
	if level >= 44 then
	if  level < 45 and s_getTaskValue(uid,1624,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,37,"要塞守卫",180,44,0)
	end
	end
	--55级职业套装(14)
	if level >= 54 then
	if  level < 56 and s_getTaskValue(uid,11831,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,59,"职业套装",180,39,0)
	end
	end
	--59级血脉(15)
	if level >= 59 then
	if  level < 61 and s_getField(uid, UserVar_EquipBloodAllLevel) == 0 then
	s_sysRightNewFunction(uid,60,"血脉",180,44,0)
	end
	end
	--61级羽翼(16)
	if level >= 61 then
	if  level < 62 and s_getTaskValue(uid,15212,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,61,"羽翼",180,43,0)
	end
	end
	--69级传奇烙印(17)
	if level >= 69 then
	if  level < 71  then
	s_sysRightNewFunction(uid,62,"传奇烙印",180,36,0)
	end
	end
	--78级骑魂谷(18)
	if level >= 78 then
	if  level < 81 and s_getTaskValue(uid,15220,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,63,"骑魂谷",180,37,0)
	end
	end
	--81级炼金(19)
	if level >= 81 then
	if  level < 83 and s_getTaskValue(uid,15226,TaskValue_Process) ~= TaskProcess_Done then
	s_sysRightNewFunction(uid,64,"炼金",180,44,0)
	end
	end
	--]]
end

--新区装备奖励
function OnUseItemEventXinQuG(uid,thisid,level,quality)
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if pro == Profession_Soldier then mo = 1
	elseif pro == Profession_Spy then mo = 2
	elseif pro == Profession_Gunman then mo = 1
	elseif pro == Profession_Blast then mo = 2
	elseif pro == Profession_Freeman then mo = 2
	elseif pro == Profession_Doctor then mo = 2
	end
	if level < 61 then itemlevel = 5
	elseif level >= 61 and level <= 70 then itemlevel = 6
	elseif level >= 71 and level <= 80 then itemlevel = 7
	elseif level >= 81 and level <= 90 then itemlevel = 8
	elseif level >= 91 then	itemlevel = 9
	end
	x = math.random(1,100)
	if x <= 33 then s_addItem(uid,11000+mo*100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuG") return VALUE_OK end
	if x <= 66 then s_addItem(uid,12000+mo*100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuG") return VALUE_OK end
	if x <= 100 then s_addItem(uid,13000+mo*100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuG") return VALUE_OK end
	return VALUE_OK
end

--新区装备奖励防
function OnUseItemEventXinQuF(uid,thisid,level,quality)
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if level < 61 then itemlevel = 5
	elseif level >= 61 and level <= 70 then itemlevel = 6
	elseif level >= 71 and level <= 80 then itemlevel = 7
	elseif level >= 81 and level <= 90 then itemlevel = 8
	elseif level >= 91 then	itemlevel = 9
	end
	x = math.random(1,100)
	if x <= 10 then	s_addItem(uid,15100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 20 then	s_addItem(uid,15200+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 30 then	s_addItem(uid,16100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 40 then	s_addItem(uid,16200+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 50 then	s_addItem(uid,17100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 60 then	s_addItem(uid,17200+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF") return VALUE_OK	end
	if x <= 70 then	s_addItem(uid,18100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF")	return VALUE_OK	end
	if x <= 80 then s_addItem(uid,18200+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF") return VALUE_OK end
	if x <= 90 then s_addItem(uid,19100+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF") return VALUE_OK end
	if x <= 100 then s_addItem(uid,19200+itemlevel,0,1,1,quality,"OnUseItemEventXinQuF") return VALUE_OK end
	return VALUE_OK
end

