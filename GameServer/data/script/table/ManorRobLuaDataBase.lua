-- FILE: 数表-帮级属性.xls SHEET: 强盗 KEY: day
ManorRobLuaDataBase = {
[1]={["day"]=1,["monsterinfo"]="20001,15;20012,1;20002,15;20013,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
[3]={["day"]=3,["monsterinfo"]="20002,15;20013,1;20003,15;20014,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
[7]={["day"]=7,["monsterinfo"]="20004,15;20015,1;20005,15;20016,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
[10]={["day"]=10,["monsterinfo"]="20006,15;20017,1;20007,15;20018,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
[14]={["day"]=14,["monsterinfo"]="20008,15;20019,1;20009,15;20020,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
[99999]={["day"]=99999,["monsterinfo"]="20010,15;20021,1;20011,15;20022,1",["contribution"]="40;70;40;70",["liveness"]="50;90;50;90",["reduceFund"]=15000,["reduceBoom"]=1500,["wday"]=21},
}
ManorRobLuaDataBase.query = function(day) return ManorRobLuaDataBase[day] end
