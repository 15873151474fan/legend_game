-- FILE: 数表-邮件推送.xlsx SHEET: Sheet2 KEY: type + level
EmailPushDataBase = {
[33]={["ID"]=17,["type"]=33,["level"]=0,["addressor"]="系统邮件",["maintype"]="神戒升级"},
[1055]={["ID"]=2,["type"]=1000,["level"]=55,["addressor"]="系统邮件",["maintype"]="功勋升级"},
[1060]={["ID"]=1,["type"]=1000,["level"]=60,["addressor"]="系统邮件",["maintype"]="护符升级"},
[1065]={["ID"]=3,["type"]=1000,["level"]=65,["addressor"]="系统邮件",["maintype"]="龙珠升级"},
[1081]={["ID"]=4,["type"]=1000,["level"]=81,["addressor"]="系统邮件",["maintype"]="转生"},
[2001]={["ID"]=5,["type"]=2000,["level"]=1,["addressor"]="系统邮件",["maintype"]="恭喜加入VIP大家庭"},
[2002]={["ID"]=6,["type"]=2000,["level"]=2,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP2"},
[2003]={["ID"]=7,["type"]=2000,["level"]=3,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP3"},
[2004]={["ID"]=8,["type"]=2000,["level"]=4,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP4!"},
[2005]={["ID"]=9,["type"]=2000,["level"]=5,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP5!"},
[2006]={["ID"]=10,["type"]=2000,["level"]=6,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP6!"},
[2007]={["ID"]=11,["type"]=2000,["level"]=7,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP7!"},
[2008]={["ID"]=12,["type"]=2000,["level"]=8,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP8!"},
[2009]={["ID"]=13,["type"]=2000,["level"]=9,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP9!"},
[2010]={["ID"]=14,["type"]=2000,["level"]=10,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP10!"},
[2011]={["ID"]=15,["type"]=2000,["level"]=11,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP11!"},
[2012]={["ID"]=16,["type"]=2000,["level"]=12,["addressor"]="系统邮件",["maintype"]="恭喜您成为VIP12!"},
}
EmailPushDataBase.query = function(type, level) return EmailPushDataBase[type + level] end
