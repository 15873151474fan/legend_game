-- FILE: 数表-邮件推送.xlsx SHEET: Sheet1 KEY: type + level
IEmailPushDataBase = {
[33]={["type"]=33,["level"]=0,["addressor"]="系统邮件",["maintype"]="灵戒升级",["text"]="[#12]亲爱的玩家：[-]\n恭喜您获得战神传奇世界的[#12]圣器：灵戒！[-]传说拥有圣器灵戒的人就可获得复生、麻痹敌人、不受伤害的能力，这种能力超乎常人！若是不断精炼升级，其威力极其恐怖！传说中还没有人能够获得最强灵戒力量。\n这次大陆的裂变使得魔物大军来袭，众多勇士为站上巅峰战力可是不断精炼，想获得最强灵戒力量。超越历史成为第一人，会是谁呢？ \n可前往土城<灵戒商人>，消耗[灵戒碎片]兑换灵戒。据说[灵戒碎片]的来源：\n[#27]来源一：[-]登录首周赠送灵戒\n[#27]来源二：[-]商城购买[灵戒碎片]兑换灵戒\n\n勇士！朝着成为历史第一人的目标前进吧！"},
}
IEmailPushDataBase.query = function(type, level) return IEmailPushDataBase[type + level] end
