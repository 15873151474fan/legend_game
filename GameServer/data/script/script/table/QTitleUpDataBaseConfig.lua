-- FILE: 数表-四特殊物品等级表.xls SHEET: 称号 KEY: id
local QTitleUpDataBaseConfig = {
[1]={["id"]=1,["roleType"]=1,["titlelevel"]=1,["needpoint"]=50000,["isopen"]=true},
[2]={["id"]=2,["roleType"]=1,["titlelevel"]=2,["needpoint"]=150000,["isopen"]=true},
[3]={["id"]=3,["roleType"]=1,["titlelevel"]=3,["needpoint"]=390000,["isopen"]=true},
[4]={["id"]=4,["roleType"]=1,["titlelevel"]=4,["needpoint"]=858000,["isopen"]=true},
[5]={["id"]=5,["roleType"]=1,["titlelevel"]=5,["needpoint"]=1716000,["isopen"]=true},
[6]={["id"]=6,["roleType"]=1,["titlelevel"]=6,["needpoint"]=3088800,["isopen"]=true},
[7]={["id"]=7,["roleType"]=1,["titlelevel"]=7,["needpoint"]=5250960,["isopen"]=true},
[8]={["id"]=8,["roleType"]=1,["titlelevel"]=8,["needpoint"]=8401536,["isopen"]=true},
[9]={["id"]=9,["roleType"]=1,["titlelevel"]=9,["needpoint"]=13022380,["isopen"]=true},
[10]={["id"]=10,["roleType"]=1,["titlelevel"]=10,["needpoint"]=19533571,["isopen"]=true},
[11]={["id"]=11,["roleType"]=3,["titlelevel"]=11,["needpoint"]=50000,["isopen"]=true},
[12]={["id"]=12,["roleType"]=3,["titlelevel"]=12,["needpoint"]=150000,["isopen"]=true},
[13]={["id"]=13,["roleType"]=3,["titlelevel"]=13,["needpoint"]=390000,["isopen"]=true},
[14]={["id"]=14,["roleType"]=3,["titlelevel"]=14,["needpoint"]=858000,["isopen"]=true},
[15]={["id"]=15,["roleType"]=3,["titlelevel"]=15,["needpoint"]=1716000,["isopen"]=true},
[16]={["id"]=16,["roleType"]=3,["titlelevel"]=16,["needpoint"]=3088800,["isopen"]=true},
[17]={["id"]=17,["roleType"]=3,["titlelevel"]=17,["needpoint"]=5250960,["isopen"]=true},
[18]={["id"]=18,["roleType"]=3,["titlelevel"]=18,["needpoint"]=8401536,["isopen"]=true},
[19]={["id"]=19,["roleType"]=3,["titlelevel"]=19,["needpoint"]=13022380,["isopen"]=true},
[20]={["id"]=20,["roleType"]=3,["titlelevel"]=20,["needpoint"]=19533571,["isopen"]=true},
[21]={["id"]=21,["roleType"]=5,["titlelevel"]=21,["needpoint"]=50000,["isopen"]=true},
[22]={["id"]=22,["roleType"]=5,["titlelevel"]=22,["needpoint"]=150000,["isopen"]=true},
[23]={["id"]=23,["roleType"]=5,["titlelevel"]=23,["needpoint"]=390000,["isopen"]=true},
[24]={["id"]=24,["roleType"]=5,["titlelevel"]=24,["needpoint"]=858000,["isopen"]=true},
[25]={["id"]=25,["roleType"]=5,["titlelevel"]=25,["needpoint"]=1716000,["isopen"]=true},
[26]={["id"]=26,["roleType"]=5,["titlelevel"]=26,["needpoint"]=3088800,["isopen"]=true},
[27]={["id"]=27,["roleType"]=5,["titlelevel"]=27,["needpoint"]=5250960,["isopen"]=true},
[28]={["id"]=28,["roleType"]=5,["titlelevel"]=28,["needpoint"]=8401536,["isopen"]=true},
[29]={["id"]=29,["roleType"]=5,["titlelevel"]=29,["needpoint"]=13022380,["isopen"]=true},
[30]={["id"]=30,["roleType"]=5,["titlelevel"]=30,["needpoint"]=19533571,["isopen"]=true},
}
QTitleUpDataBaseConfig.query = function(id) return QTitleUpDataBaseConfig[id] end
return QTitleUpDataBaseConfig
