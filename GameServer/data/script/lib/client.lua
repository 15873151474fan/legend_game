--/////////////////////////////////////////////////////
--////客户端界面相关函数整理
--/////////////////////////////////////////////////////
--交易对话框函数----------------------------------------------------
--tradetype 1-普通模式，2-赠点模式，3-战争勋章模式
function SetTrade(uid,tradeTransactId,tradetype,paginationName,tradeItemList)
	local ifNeedJudge = 0
	local talkDialog =  'this:ShowNpcDialog(false)'
	local tradeDialog = ""
	tradeDialog =  'this:AddNpcTradeDialog('..'"'..paginationName..'"'..','..ifNeedJudge..','..'"'..tradeItemList..'",'..tradetype..')'
	local message = talkDialog..tradeDialog
	s_setMessage(uid,tradeTransactId, message,0)
end
--商城
function SetSuperMarket(uid,itemlist,bgold)
	local talkDialog =  'this:ShowNpcDialog(false)'
	if bgold == 0 then
		interfaceDialog = 'this:AddSuperMarketDialog(false,' ..'"'..itemlist ..'")'
	else
		interfaceDialog = 'this:AddSuperMarketDialog(true,' ..'"'..itemlist ..'")'
	end
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--装备界面调用-------------------------------------------------------
function ShowEquipUpgradeInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddEquipUpgradeDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--装备合成界面-------------------------------------------------------
--[[
function ShowEquipComposeDialog(uid)
local talkDialog =  'this:ShowNpcDialog(false)'
interfaceDialog = 'this:AddCompoundEquipDialog()'
local message = talkDialog..interfaceDialog
s_setMessage(uid,0,message,0)
end
]]
--宠物交易界面
function ShowDemonTradeInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddPreciousPetExchangeDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
	s_setOperate(uid,OperateType_Sale)
end
--宠物寄养界面
function ShowDemonAdoptInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddPreciousPetAdopt()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--宠物重生界面
function ShowDemonReliveInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddRebornDemonDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--宠物强化和进化界面
--index 0-进化，1-强化
function ShowDemonRebuildInterface(uid,index)
	local demons = s_getdemonlist(uid)
	if demons == nil or table.getn(demons) < 1 then
		s_sysInfo(uid,"您当前未拥有宠物，无法进行宠物改造操作。")
		return
	end
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddPetImproveDialog(' ..index ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--打开保险箱界面
function OpenStore(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddStoreDialog()'
	local message = talkDialog..interfaceDialog
	s_openStore(uid)
	s_setOperate(uid,OperateType_Store)
	s_setMessage(uid,0,message,0)
end
--打孔镶嵌界面
--index 0-打孔，1-镶嵌，2-调色，3-修改激活属性
function ShowEquipHoleInterface(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddEquipImproveDialog(' .. index ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--时装精炼
function ShowSuiteComposeInterface(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddSuiteEquipComposeDialog(' .. index ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--装备合成强化界面
function ShowEquipComposeInterface(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddEquipComposeDialog(' .. index ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--一个通用的任务包裹界面调用
function ShowTaskPack(uid,caption,msg,buttonname,callback,needitem,itemlevel,itemquality,params)
	if itemlevel == nil then
		itemlevel = 0
	end
	if itemquality == nil then
		itemquality = 0
	end
	s_setTaskPackCallback(uid,callback)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog = ""
	if params ~= nil then --补充参数,自定成客户端需求的字符串
		interfaceDialog= [[this:AddOneTableDialog("]] .. caption ..[[","]] .. msg ..[[","]] .. buttonname ..[[","]]..needitem..[[","]]..itemlevel..[[","]]..itemquality..[[","]]..params..[[")]]
	else
		interfaceDialog= [[this:AddOneTableDialog("]] .. caption ..[[","]] .. msg ..[[","]] .. buttonname ..[[","]]..needitem..[[","]]..itemlevel..[[","]]..itemquality..[[")]]
	end
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--一个通用的任务包裹2格界面调用
function ShowTaskPack2(uid,caption,msg,btname,tip1,tip2,baseid1,baseid2,call)
	s_setTaskPackCallback(uid,call)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog = string.format('this:AddTwoTableDialog("%s","%s","%s","%s","%s","%s","%s")',caption,msg,btname,tip1,tip2,baseid1,baseid2)
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--九格包裹界面自定义
function ShowNinePack(uid,caption,msg,buttonname,callback)
	s_setTaskPackCallback(uid,callback)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= [[this:AddNineTableDialog("]] .. caption ..[[","]] .. msg ..[[","]] .. buttonname ..[[")]]
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--拍卖行界面
function ShowAuctionInterface(uid,occupy)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddAuctionDialog(' .. occupy .. ','.. 0 ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
	s_setOperate(uid,OperateType_Sale)
end
--金卡交易界面
function ShowGoldCardInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddAuctionGoldDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
	s_setOperate(uid,OperateType_Sale)
end
--盒子包裹界面
function ShowBoxPack(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddNineTableDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--国家任免 禁言 抓人界面
function ShowCountryFunop(uid, itype)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:ShowKingOperate(' .. itype .. ')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--播放一个表情
function PlayEmotion(uid,eid)
	local list = s_getNineEntry(SCENE_ENTRY_PLAYER,uid,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local msg = 'this:PlayEmotion('..uid..','..eid..')'
			s_setMessage(list[i+1],0,msg,0)
		end
	end
end
--客户端新手提示
function FreshManTip(uid,delay)
	--[[
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:NewRole(' .. delay ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
	]]--
end
--客户端主界面效果闪动
function ButtonEffect(uid,id)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:SetEffect(' .. id ..',true)'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--客户端NPC坐标提示
function NpcPosTip(uid,npcid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:NewRoleTaskGuide(' .. npcid ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--团购买对话框函数
function SetCorpsTrade(uid,tradeTransactId,paginationName,tradeItemList,btype,level)
	local ifNeedJudge = 0
	local talkDialog =  'this:ShowNpcDialog(false)'
	local tradeDialog = ""
	tradeDialog = 'this:AddNpcTradeCorpDialog('..'"'..paginationName..'"'..','..ifNeedJudge..','..'"'..tradeItemList..'"'..',' .. '"' .. btype .. '"' .. ',' .. '"'.. level .. '"' .. ')'
	local message = talkDialog..tradeDialog
	s_setMessage(uid,tradeTransactId, message,0)
end
--关闭新手礼物提示
function CloseGiftButton(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:CloseCountDownGiftButton(' .. index ..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--生命存储仪
--[[
function ShowLifeEquipDialog(uid)
local talkDialog =  'this:ShowNpcDialog(false)'
local interfaceDialog= 'this:AddLifeEquipUpgradeDialog()'
local message = talkDialog..interfaceDialog
s_setMessage(uid,0,message,0)
end
]]
--购买彩票
function ShowBuyLotteryDialog(uid, max)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddDoubleColorLotteryTicketDialog(' .. max .. ')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--军团建筑操作界面
function ShowCorpsBuilding(uid,btype,blevel)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddCorpsBuildingDialog(' .. btype .. ',' .. blevel .. ')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--金银兑换接口
function ShowGoldToMoneyDialog(uid,price)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddGoldToMoneyWithSystemDialog(' .. price .. ')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--创建战友组织界面
function ShowCreateCompanionDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddBattleMateCreateDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--修改战友称谓界面
function ShowChangeCompanionNameDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddChangeBattleMateExNameDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--邮件系统界面
function ShowMailDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddMailDialog()'
	local message = talkDialog .. interfaceDialog
	s_setMessage(uid,0,message,0)
	s_setOperate(uid,OperateType_Mail)
end
--创建团界面
function ShowCreateCorpsDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local caption = "请输入您想创建团的名字: (最长8个中文字)"
	local interfaceDialog = 'this:CreateCorps('..'"'..caption..'"'..', 16)'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--播放特效
function ShowUserSfx(uid,sfxid)
	--[[
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddSfx('..uid..','..sfxid..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
	]]--
end
--显示副本队伍翻牌界面
function ShowTeamCardDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddCopyRewardSelectDialog(true)'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--关闭副本队伍翻牌
function CloseTeamCardDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddCopyRewardSelectDialog(false)'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--客户端播放特效
function Play2DEffect(uid, id)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:Play2DEffect(' .. id .. ')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--打开任务对话框
function ShowTaskDialog(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:OpenTaskDialog('..index..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
--装备改造界面
function ShowEquipRebuildDialog(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddEquipRemakeDialog('..index..')'
	local message = talkDialog..interfaceDialog
	s_trace("in>>lua"..message)
	s_setMessage(uid,0,message,0)
end
--升级改造界面
function ShowEquipUpgradeDialog(uid,index)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddZBZG5Dialog('..index..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--图纸合成
function ShowDrawingComposeInterface(uid, index)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddTuZhiHeChengDialog('..index..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--宠物技能学习
function ShowDemonLearnSkillInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddDemonLearnSkill()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--书籍说明
function ShowSimpleBookInterface(uid, index)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddSimpleBookDialog('..index..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--坐骑装备强化
function ShowHorseEquipInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddZQQHDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--军称号争夺界面
function ShowArmyTitleInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddArmyTitleDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--团工资商店
function ShowSupperMarketInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddSupperMarketDialog('.. 1 ..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--金币商店
function ShowSupperMarketGoldInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddSupperMarketDialog('.. 0 ..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--随机任务界面
function ShowRandomTaskInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local randomtaskid = s_getVar(uid,31000,TvarIndex_RandomTaskID)
	local interfaceDialog = 'this:AddRandomTaskDialog('..randomtaskid..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--竞标镖局
function ShowAddJingBiaoDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddJingBiaoDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--投保镖局
function ShowAddTouBaoDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddTouBaoDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--镖局充值界面
function ShowAddBiaoJuMoneyDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddBiaoJuMoneyDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--情缘任务界面
function ShowAddQingYuanDialog(uid,mtype)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddQingYuanDialog('..mtype..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--送花界面
function ShowAddSendFlowerDialog(uid,tagetid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddSendFlowerDialog('..tagetid..")"
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--国家官员奖金界面
function ShowCountryWageDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddCountryWageInfoDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--宠物强化界面
function ShowDemonInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddItemChangeDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--帝皇竞选界面
function ShowEmperorInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddDiHuangDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--膜拜帝皇
function WorshipEmperorInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddDiDuRewardDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--查看本服历任帝皇
function SeeEmperorLogInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddDiDuPreviousKingDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--皇权马车选择界面
function SelectHorseCarInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddDiDuSelectHorse()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--购买金砖界面
function BuyThankDayBoxInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddGoldBrick()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--团拓展刷新界面
function CorpsExpandRefreshInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:RefreshCorpExercise()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--团技能提升界面
function CorpsSkillUpInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddCorpsExerciseSkill()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--快捷键调用
function OpenHotkeyDialog(uid,hotkeyid,tabid,tabframe,treeid,treeleafid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:OpenHotkeyDialog('.. hotkeyid ..',' .. tabid ..',' .. tabframe ..',' .. treeid .. ',' .. treeleafid .. ')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--任务委托界面
function TaskDeputeDialog(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddTaskDelegationDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--委托任务发布界面
function TaskDuputeInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddTaskDelegation2Dialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--宠物乐园注册界面
function RegisterPetParkInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddEnterPetParkDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--宠物乐园信息查询
function PetParkInfoInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddEnterPetParkInfoDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--王国金库查询界面
function TaskGoldAttackInterface(uid,countrysize)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddGoldAttackDialog('..countrysize..')'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--开启时空回廊
function OpenZoneListDialogAttackInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddZoneListDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
--宠物召唤器播放特效专用
function ShowUserDemonSfx(uid,sfxid,itemid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddEggHatchRetSfx('..uid..','..sfxid..','..itemid..')'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--YY尾灯
function OpenYYWeidengDialogInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddYYWeidengDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end

--创建战队组织界面
function ShowCreateFightTeamDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:CreateChampBattleTeam()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--战队查询界面
function ShowChampBattleTeamQueryDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddChampBattleTeamQueryDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--挑战擂主界面
function ShowChampBattleChallengeDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddChampBattleChallengeDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--无双擂台赛决赛界面
function ShowFanalsBattleChallengeDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddChampBattleFinalWarDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--无双擂台赛冠军界面
function ShowChampBattleQueryHistoryDialog(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddChampBattleQueryHistory()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--打开大地图
function ShowLargeMapInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddLargeMapDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--关闭主包裹界面
function CloseMainPackInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:CloseMainPackDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--打开神恩周常任务接取刷新界面
function ShowRefreshWeeklyTaskInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddWeeklyTaskRefreshDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--打开神恩祈福界面
function ShowBlessWeeklyTaskInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddWeeklyTaskBlessDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--打开骑魂驯养
function ShowZQDomesticationInterface(uid)
	local talkDialog =  'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddZQDomesticationDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--打开团空间界面
function ShowCorpsSpaceInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddCorpsSpaceDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end

--绑定手机
function ShowMobileBindInterface(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	interfaceDialog = 'this:AddMobileBindDialog()'
	local message = talkDialog..interfaceDialog
	s_setMessage(uid,0,message,0)
end
