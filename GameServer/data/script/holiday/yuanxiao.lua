--元宵节
function OnHolidayEvent_YuanXiao_Begin(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 8 and (mday >= 1 and mday <= 3) then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local POSITION = {
		{354,358},{355,366},{360,376},{366,382},{375,387},{384,388},{393,387},{402,382},
		{408,376},{413,366},{414,358},{413,350},{408,340},{402,334},{393,329},{384,328},
		{375,329},{366,334},{360,340},{355,350},{349,358},{351,370},{356,379},{363,386},
		{373,391},{384,393},{395,391},{405,386},{412,379},{417,370},{419,358},{417,346},
		{412,337},{405,330},{395,325},{384,323}, {373,325},{363,330},{356,337},{351,346},
		{384,334},{407,358},{384,381},{360,358},
	}
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			local cid = list[i] * 2^8 + 3
			if hour == 12 then
				for j = 60677,60720 do
					local posx = POSITION[j-60677+1][1]
					local posy = POSITION[j-60677+1][2]
					local npcid = s_sysSummon(j,cid,posx,posy)
					if npcid ~= 0 then
						s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*60*1000)
					end
				end
			end
			if hour == 20 then
				for j = 60721,60764 do
					local posx = POSITION[j-60721+1][1]
					local posy = POSITION[j-60721+1][2]
					local npcid = s_sysSummon(j,cid,posx,posy)
					if npcid ~= 0 then
						s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*60*1000)
					end
				end
			end
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>七夕【爱的1000问】活动在</n><goto pos='384,328' mapid='3'  flagpoint='1'/><n color='GXColorBlueSky'>附近开始啦，21级以上玩家可去光明城舞区附近解情题，吃巧果啦！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
end
function OnHolidayEvent_YuanXiao_Finish(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 8 and (mday >= 1 and mday <= 3) then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>本次的七夕【爱的1000问】活动结束了，请大家凭借兑换券去</n><goto id='320' mapid='3' flagpoint='1'/><n color='GXColorBlueSky'>处品尝美味巧果哦！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
end
--RegisterHolidayActivityEvent(12,0,"OnHolidayEvent_YuanXiao_Begin")
--RegisterHolidayActivityEvent(20,0,"OnHolidayEvent_YuanXiao_Begin")
--RegisterHolidayActivityEvent(13,0,"OnHolidayEvent_YuanXiao_Finish")
--RegisterHolidayActivityEvent(21,0,"OnHolidayEvent_YuanXiao_Finish")

QAInfo_YuanXiao =
{
	{question ="<p><n>情题：</n><newline/><n>    把爱拿走，我们的地球就变成一座____了。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.地狱","B.天堂","C.公园"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱情，只有情，可以使人敢于为所爱的人献出生命；这一点，不但男人能做到，而且____也能做到。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.天使","B.女人","C.鲜花"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    爱情有一千个动人的心弦而又各不相同的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.电影","B.色彩","C.音符"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    我告诉你，爱神是万物的第____个太阳，他照到哪里，哪里就会春意盎然。（查普曼）</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.一","B.二","C.三"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    生命是花，爱是____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.盐","B.蜜","C.土"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    没有阳光花儿不香，没有爱情生活不____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.咸","B.酸","C.甜"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    爱一个人，与其为他的幸福而放弃他，不如留住他，为他的幸福而____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.努力","B.嘲笑","C.郁闷"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    无法厮守终生的爱情，不过是人在长途旅程中，来去匆匆的____，无论停留多久，始终要离去坐另一班机。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.转机站","B.地铁战","C.公交站"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    只有得到女人的爱，才能成为一个真正的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.奥特曼","B.男子汉","C.马里奥"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    人生最好的东西总是和最坏的连在一起，幸福的极致往往是____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.快乐","B.幸福","C.悲哀"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    你若爱她，让你的爱像____一样包围她，并且给她自由。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.阳光","B.火球","C.台风"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    热得快的爱情，冷得也____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.快","B.慢","C.高"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    我要你知道，这世界上有一个人是永远等着你的，不管是在什么时候，不管你是在什么地方，反正你知道，总有这样一个____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.鬼","B.神","C.人"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    爱是一种甜蜜的____，真诚的爱情永不是走一条平坦的道路的。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.蛋糕","B.火箭","C.痛苦"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    世上最遥远的距离，不是生与死的距离，不是天各一方，而是我就站在你面前，你却不知道____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.我爱你","B.我恨你","C.我想你"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    纵然伤心，也不要愁眉不展，因为你不知是谁会爱上你的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.笑容","B.金钱","C.跑车"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    不要为那些不愿在你身上花费时间的人而浪费你的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.金钱","B.时间","C.思考"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    对于世界而言，你是一个人；但是对于某个人，你是他的整个____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.岛屿","B.火星","C.世界"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    没有人值得你流泪，值得让你这么做的人不会让你____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.疯狂","B.欢笑","C.哭泣"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    我爱你，不是因为你是一个怎样的人，而是因为我喜欢与你在一起时的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.感觉","B.温度","C.回忆"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    不要因为结束而哭泣，_______，为你的曾经拥有。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.狂奔吧","B.微笑吧","C.安息吧"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    缘起缘灭，缘浓缘淡，不是我们能够控制的。我们能做到的，是在因缘际会的时侯好好的珍惜那________。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.悲伤的回忆","B.浪漫的期待","C.短暂的时光"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    爱情献出了一切，却依然____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.悲伤","B.颓靡","C.富有"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    狗不会瘦，因为它不会思念，人会瘦，因为他思念着别人，人总是被思念折磨，在思念里做一条可怜的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.流浪狗","B.火星猫","C.月球兔"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱情刚刚萌芽的时候，一切总是单纯而美好的，到了后来，才有_______。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.背叛和谎言","B.甜蜜和温柔","C.草莓和香蕉"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    人与另一人相爱的时候，总会联想到____。生命终将消逝，我们在一起是要同度过这短暂的人生。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.人生","B.过去","C.死亡"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    只要一分钟就可以碰到一个人，一小时就可以喜欢上一个人，一天就可以爱上一个人，但需要花尽____的时间去忘记一个人。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.一月","B.一年","C.一生"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    你曾经不被人所爱，你才会____将来那个爱你的人。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.憎恨","B.珍惜","C.鄙视"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    分手之后，持续地想着对方有多么好，那样只会期让自己____，愈来愈执着，也依恋得愈来愈深。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.沉沦","B.坚强","C.快乐"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱一个人就是指帮助他回到自己，使他更是______。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.另一个自己","B.另个人","C.他自己"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    当爱情轻敲肩膀时，连平日对诗情画意都不屑一顾的男人，都会变成____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.诗人","B.傻子","C.政治家"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    我愿与君相知，山无棱，天地合，________!</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.轻舟已过万重山","B.乃敢与君绝","C.海地一线天"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    得成比目何辞死，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.愿作鸳鸯不羡仙","B.此物最相思","C.地角天涯不是长"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    身无彩凤双飞翼，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.昨夜星辰昨夜风","B.心有灵犀一点通","C.荷叶生时春恨生"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    在天愿作比翼鸟，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.人面桃花相映红","B.在地愿为连理枝","C.何当共剪西窗烛"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    天长地久有时尽，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.千里佳期一夕休","B.人面不知何处去","C.此恨绵绵无绝期"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    衣带渐宽终不悔，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.别梦依依到谢家","B.为伊消得人憔悴","C.日夜东流无歇时"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    心似双丝网，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.中有千千结","B.中有万万圆","C.中有千万愁"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    此情无计可消除，才下眉头，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.又上肩头","B.又下枕头","C.却上心头"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    寻寻觅觅，冷冷清清，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.哼哼哈哈嘿嘿","B.凄凄惨惨戚戚","C.情情爱爱恨恨"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    问君能有几多愁？________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.忆君心似西江水","B.恨到归时方始休","C.恰似一江春水向东流"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    此情可待成追忆，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.只是当时已惘然","B.从此无心爱良夜","C.多情只有春庭月"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    十年生死两茫茫，不思量，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.思悠悠","B.自难忘","C.恨悠悠"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    众里寻他千百度，蓦然回首，那人却在，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.花红酒绿中","B.灯火阑珊处","C.天马行空间"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    我的世界不允许你的消失，不管结局是否____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.完美","B.终结","C.延续"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    承诺常常很像____，美丽的飞盘旋然后不见。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.企鹅","B.乌鸦","C.蝴蝶"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    爱情…在指缝间承诺，指缝，在____下交缠。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.爱情","B.指缝","C.指间"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    如果你为着错过夕阳而哭泣，那么你就要错过____了。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.海洋","B.阳光","C.群星"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    宁愿笑着流泪，也不哭着说____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.后悔","B.开心","C.幸运"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    当________时，就注定受到伤害。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.香烟爱上火柴","B.老鼠爱上大米","C.月亮爱上星星"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    没有谁对不起谁，只有谁不懂得____谁。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.讨厌","B.珍惜","C.想念"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    永远不是一种距离，而是一种____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.可悲","B.妄想","C.决定"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    在回忆里继续梦幻，不如在地狱里等待____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.天堂","B.恶魔","C.洪水"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    有了你，我迷失了自我。失去你，我多么希望自己再度____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.迷失","B.回忆","C.坚强"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    我需要你，正如我需要________。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.仰望星空","B.呼吸空气","C.彻夜长眠"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    爱是长在我们心里的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.藤蔓","B.岩石","C.洞穴"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    有爱的心永远____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.沉默","B.年轻","C.寂静"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    在这个世界上，男人最珍贵的财产就是一个女人的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.心","B.身体","C.眼神"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    没有你的日子就像一本没有书页的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.树叶","B.书签","C.书"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    让一个人了解自己太多的话，就会成为自己致命的弱点，而让自己变得____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.脆弱","B.开心","C.迷茫"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    有时候不知道真相，不了解本质的人，是快乐的，而能够假装不知道真相，不了解本质的人，却是____的。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.坚强","B.幸福","C.软弱"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    爱的出发点不一定是身体，但爱到了身体就到了____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.终点","B.重点","C.顶点"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    因爱而受苦，那就爱得多一点吧。为爱而死，便是________。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.为爱而生","B.为生而爱","C.为情而死"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱情的美丽的。当你坚强的时候，它会更加____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.绝望","B.美丽","C.痛苦"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    真正相爱的人对____是不在乎的。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.贫富","B.感情","C.未来"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱情的火焰，越是遏制，它越是____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.微弱","B.熄灭","C.厉害"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    爱情也像____一样深沉。我给你的越多，我自己就越富，因为这两者都是没有穷尽的。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.大地","B.海","C.天空"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    男人与女人之间融为一体的渴求，是人类最强有力的奋斗的____。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.动力","B.绝望","C.痛苦"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    ____和饮食一样，是人类的一种自然需要。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.生","B.死","C.性"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    与所爱的人长期相处的秘诀是：________。</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.放弃改变对象的念头","B.凡事回避","C.无视他"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    爱情是理想，结婚是____，把理想与现实混为一谈，岂能不自食其痛苦之果？</n><newline/><n>    （空格填词）</n></p>",	answer ={"A.天堂","B.现实","C.地狱"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    两情若是长久时，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.何必恨王昌","B.又岂在朝朝暮暮","C.谁知离别情"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    柔情似水，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.佳期如梦","B.千里情缘","C.爱如潮水"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    多情自古空余恨，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.罗带同心结未成","B.好梦由来最易醒","C.月明人倚楼"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    色不迷人人自迷，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.几时重","B.太匆匆","C.情人眼里出西施"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    人生自古有情痴，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.此恨不关风与月","B.此恨绵绵无绝期","C.终日望君君不归"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    问世间情为何物？________！</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.汴水流","B.直教人生死相许","C.自是人生长恨水长东"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    生命诚可贵，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.易求无价宝","B.自能窥宋玉","C.爱情价更高"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    执子之手，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.与子同归","B.与子偕老","C.与子共舞"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    相思一夜情多少?________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.人生自是有情痴","B.一曲能教肠寸结","C.地角天涯不是长"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    锦瑟无端五十弦，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.一弦一柱思华年","B.一期一会梦今朝","C.一生一世笑苍天"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    曾经沧海难为水，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.怅望江头江水声","B.深知身在情长在","C.除却巫山不是云"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    多情只有春庭月，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.蜡烛有心还惜别","B.犹为离人照落花","C.替人垂泪到天明"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    金风玉露一相逢，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.又岂在朝朝暮暮","B.忍顾鹊桥归路","C.便胜却人间无数"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    相思相见知何日？________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.此时此夜难为情","B.离愁正引千丝乱","C.梯横画阁黄昏后"}, result ={1}},
	{question ="<p><n>情题：</n><newline/><n>    换我心，为你心，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.许多愁","B.始知相忆深","C.飞絮蒙蒙"}, result ={2}},
	{question ="<p><n>情题：</n><newline/><n>    若教眼底无离恨，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.山长水远知何处","B.只恁寂寞厌厌地","C.不信人间有白头"}, result ={3}},
	{question ="<p><n>情题：</n><newline/><n>    似此星辰非昨夜，________。</n><newline/><n>    （古诗句联接）</n></p>",	answer ={"A.为谁风露立中宵","B.明月不谙离恨苦","C.无言谁会凭阑意"}, result ={1}},
}
local YuanXiao_fun = [[
	function OnClickNpc_#1(uid,npcid)
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		if level < 21 then
			s_sysInfo(uid,"还未到21级，无法参加七夕【爱的1000问】活动哦",ChatPos_Sys)
			return
		end
		local baseid = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BASE_ID)
		if s_getVar(uid,10004,baseid) == s_getCurTime(TIME_ALLDAYS) then
			s_sysInfo(uid,"每个情题无论对错，只能回答一次哦！",ChatPos_Sys)
			return
		end
		local info = { }
		local qa = QAInfo_YuanXiao[baseid-60677+1]
		info.talk = qa.question
		info.button = {}
		for i = 1,table.getn(qa.answer) do
			local tmp = {}
			table.insert(tmp,qa.answer[i] .. "(3)")
			if qa.result[1] == i then
				table.insert(tmp,"OnFinishQAGame_YuanXiao($1,1,"..baseid..")")
			else
				table.insert(tmp,"OnFinishQAGame_YuanXiao($1,2,"..baseid..")")
			end
			table.insert(info.button,tmp)
		end
		table.insert(info.button,{"这题太难啦，稍候再答(2)"})
		ShowNpcMenuByTable(uid,info)
	end
]]
for i = 60677,60764 do
	RegistetFunction(string.gsub(YuanXiao_fun,"#1",i))
end
function OnFinishQAGame_YuanXiao(uid,ret,baseid)
	s_addVar(uid,10004,baseid,s_getCurTime(TIME_ALLDAYS))
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if ret ~= 1 then
		local exp = 6 * (30+level^1.5)
		s_refreshExp(uid,exp,ExpType_Answer,60677)
		s_sysInfo(uid,"抱歉，答错了，请继续努力哦！",ChatPos_Sys)
		return
	end
	s_addItem(uid,31315,0,1,0,"","七夕")
	local exp = 10 * (30+level^1.5)
	s_refreshExp(uid,exp,ExpType_Answer,60677)
	if math.random(1,100) == 1 then
		s_addbuff(SCENE_ENTRY_PLAYER,uid,5017,1,5)
	end
	s_sysInfo(uid,"恭喜，答对了，请再接再厉哟！",ChatPos_Sys)
end
