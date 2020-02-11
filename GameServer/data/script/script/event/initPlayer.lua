--第一次进入场景初始
function OnPlayerFirstIntoScene(uid)
	OnInitPlayerSkill(uid)
	--FreshManTip(uid,800)
	AddRoleTaskForGM(uid,1001)
	SetReturnPoint(uid)
    --添加测试装备
   -- RewardAllEquip(uid)
   s_addTitle(SCENE_ENTRY_PLAYER,uid,37)
   s_setProtect(uid)
   --送一个加血加蓝buff
   s_addbuff(SCENE_ENTRY_PLAYER,uid,30003,1,5,10000000)
   s_addbuff(SCENE_ENTRY_PLAYER,uid,30004,1,5,200000)
--   s_addItem(uid,10056,0,99,0,"1-1","新号获得")
--	s_addItem(uid,20001,0,1,0,"1-1","新号获得")
end
--测试添加装备，上线送职业全套装
function RewardAllEquip(uid)
    local profession =  s_getValue(0,uid,VALUE_TYPE_PROFESSION)
    s_debug("RewardAllEquip profession=%d",profession)
    --战士
    if profession == Profession_Soldier then
        s_addItem(uid,1000,0,1,2,str,"团种植收获")
        s_addItem(uid,11101,0,1,2,str,"团种植收获")
        s_addItem(uid,13401,0,1,2,str,"团种植收获")
        s_addItem(uid,14100,0,1,2,str,"团种植收获")
        s_addItem(uid,14115,0,1,2,str,"团种植收获")
        s_addItem(uid,15100,0,1,2,str,"团种植收获")
        s_addItem(uid,16100,0,1,2,str,"团种植收获")
        s_addItem(uid,17100,0,1,2,str,"团种植收获")
        s_addItem(uid,19100,0,1,2,str,"团种植收获")
        s_addItem(uid,23037,0,1,2,str,"团种植收获")
        s_addItem(uid,54500,0,1,2,str,"团种植收获")
        s_addItem(uid,54600,0,1,2,str,"团种植收获")
        s_addItem(uid,54700,0,1,2,str,"团种植收获")
        s_addItem(uid,54800,0,1,2,str,"团种植收获")
        s_addItem(uid,54401,0,1,2,str,"团种植收获")
        s_addItem(uid,54411,0,1,2,str,"团种植收获")
        s_addItem(uid,54421,0,1,2,str,"团种植收获")
        s_addItem(uid,54431,0,1,2,str,"团种植收获")
        s_addItem(uid,54441,0,1,2,str,"团种植收获")
        s_addItem(uid,54451,0,1,2,str,"团种植收获")
        s_addItem(uid,54461,0,1,2,str,"团种植收获")
        s_addItem(uid,54470,0,1,2,str,"团种植收获")
        s_addItem(uid,54480,0,1,2,str,"团种植收获")
        s_addItem(uid,54490,0,1,2,str,"团种植收获")
        s_addItem(uid,54510,0,1,2,str,"团种植收获")
        s_addItem(uid,54530,0,1,2,str,"团种植收获")
    elseif profession == Profession_Gunman then
        s_addItem(uid,3000,0,1,2,str,"团种植收获")
        s_addItem(uid,11301,0,1,2,str,"团种植收获")
        s_addItem(uid,13601,0,1,2,str,"团种植收获")
        s_addItem(uid,14300,0,1,2,str,"团种植收获")
        s_addItem(uid,14315,0,1,2,str,"团种植收获")
        s_addItem(uid,15300,0,1,2,str,"团种植收获")
        s_addItem(uid,16300,0,1,2,str,"团种植收获")
        s_addItem(uid,17300,0,1,2,str,"团种植收获")
        s_addItem(uid,19300,0,1,2,str,"团种植收获")
        s_addItem(uid,23037,0,1,2,str,"团种植收获")
        s_addItem(uid,54500,0,1,2,str,"团种植收获")
        s_addItem(uid,54600,0,1,2,str,"团种植收获")
        s_addItem(uid,54700,0,1,2,str,"团种植收获")
        s_addItem(uid,54800,0,1,2,str,"团种植收获")
        s_addItem(uid,54401,0,1,2,str,"团种植收获")
        s_addItem(uid,54411,0,1,2,str,"团种植收获")
        s_addItem(uid,54421,0,1,2,str,"团种植收获")
        s_addItem(uid,54431,0,1,2,str,"团种植收获")
        s_addItem(uid,54441,0,1,2,str,"团种植收获")
        s_addItem(uid,54451,0,1,2,str,"团种植收获")
        s_addItem(uid,54461,0,1,2,str,"团种植收获")
        s_addItem(uid,54470,0,1,2,str,"团种植收获")
        s_addItem(uid,54480,0,1,2,str,"团种植收获")
        s_addItem(uid,54490,0,1,2,str,"团种植收获")
        s_addItem(uid,54510,0,1,2,str,"团种植收获")
        s_addItem(uid,54530,0,1,2,str,"团种植收获")
    elseif  profession == Profession_Freeman then
        s_addItem(uid,2000,0,1,2,str,"团种植收获")
        s_addItem(uid,11201,0,1,2,str,"团种植收获")
        s_addItem(uid,13501,0,1,2,str,"团种植收获")
        s_addItem(uid,14200,0,1,2,str,"团种植收获")
        s_addItem(uid,14215,0,1,2,str,"团种植收获")
        s_addItem(uid,15200,0,1,2,str,"团种植收获")
        s_addItem(uid,16200,0,1,2,str,"团种植收获")
        s_addItem(uid,17200,0,1,2,str,"团种植收获")
        s_addItem(uid,19200,0,1,2,str,"团种植收获")
        s_addItem(uid,23037,0,1,2,str,"团种植收获")
        s_addItem(uid,54500,0,1,2,str,"团种植收获")
        s_addItem(uid,54600,0,1,2,str,"团种植收获")
        s_addItem(uid,54700,0,1,2,str,"团种植收获")
        s_addItem(uid,54800,0,1,2,str,"团种植收获")
        s_addItem(uid,54401,0,1,2,str,"团种植收获")
        s_addItem(uid,54411,0,1,2,str,"团种植收获")
        s_addItem(uid,54421,0,1,2,str,"团种植收获")
        s_addItem(uid,54431,0,1,2,str,"团种植收获")
        s_addItem(uid,54441,0,1,2,str,"团种植收获")
        s_addItem(uid,54451,0,1,2,str,"团种植收获")
        s_addItem(uid,54461,0,1,2,str,"团种植收获")
        s_addItem(uid,54470,0,1,2,str,"团种植收获")
        s_addItem(uid,54480,0,1,2,str,"团种植收获")
        s_addItem(uid,54490,0,1,2,str,"团种植收获")
        s_addItem(uid,54510,0,1,2,str,"团种植收获")
        s_addItem(uid,54530,0,1,2,str,"团种植收获")

    end
end
--添加通用技能
function CheckAddCommonSkill(uid)
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,40112) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,40112,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,50002) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,50002,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,50006) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,50006,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,50007) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,50007,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,50008) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,50008,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5521) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5521,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,7234) == 0 then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,7234,1)
	--end
	--if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,7235) == 0 then
	--	s_addskill(SCENE_ENTRY_PLAYER,uid,7235,1)
	--end
end
--创建角色时初始化技能
function OnInitPlayerSkill(uid)
	--s_addskill(SCENE_ENTRY_PLAYER,uid,60000,1)
	--s_addskill(SCENE_ENTRY_PLAYER,uid,60001,1)
	--s_addskill(SCENE_ENTRY_PLAYER,uid,60002,1)
	--s_addskill(SCENE_ENTRY_PLAYER,uid,60003,1)
	--local skill = { 5000,5001,5019,50009,50010,50011}
	--for i = 1,table.getn(skill) do
	--	s_addskill(SCENE_ENTRY_PLAYER,uid,skill[i],1)
	--end
    s_addskill(SCENE_ENTRY_PLAYER,uid,5001,1)
	local profession = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if profession == Profession_Soldier then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5011,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5012,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5013,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5014,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5015,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5016,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5017,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5018,1)
	end
	if profession == Profession_Spy then
		s_addskill(SCENE_ENTRY_PLAYER,uid,5007,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10200,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10201,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10204,1)
	end
	if profession == Profession_Gunman then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5031,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5032,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5033,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5034,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5035,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5036,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5037,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5038,1)
	end
	if profession == Profession_Blast then
		s_addskill(SCENE_ENTRY_PLAYER,uid,5009,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10400,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10401,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,10402,1)
	end
	if profession == Profession_Freeman then
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5051,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5052,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5053,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5054,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5055,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5056,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5057,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5058,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5059,1)
		--s_addskill(SCENE_ENTRY_PLAYER,uid,5060,1)
	end
	if profession == Profession_Doctor then
		s_addskill(SCENE_ENTRY_PLAYER,uid,5051,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5052,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5053,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5054,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5055,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5056,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5057,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5058,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5059,1)
		s_addskill(SCENE_ENTRY_PLAYER,uid,5060,1)
	end
end

