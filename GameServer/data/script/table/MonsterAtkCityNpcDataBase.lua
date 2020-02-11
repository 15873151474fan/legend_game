-- FILE: 数表-怪物信息.xls SHEET: 怪物攻城 KEY: id
MonsterAtkCityNpcDataBase = {
[1]={["id"]=1,["baseid"]=5700,["posx"]=71,["posy"]=44,["startdays"]=1},
[2]={["id"]=2,["baseid"]=5705,["posx"]=71,["posy"]=44,["startdays"]=1},
[3]={["id"]=3,["baseid"]=5710,["posx"]=71,["posy"]=44,["startdays"]=1},
[4]={["id"]=4,["baseid"]=5701,["posx"]=71,["posy"]=44,["startdays"]=3},
[5]={["id"]=5,["baseid"]=5706,["posx"]=71,["posy"]=44,["startdays"]=3},
[6]={["id"]=6,["baseid"]=5711,["posx"]=71,["posy"]=44,["startdays"]=3},
[7]={["id"]=7,["baseid"]=5702,["posx"]=71,["posy"]=44,["startdays"]=5},
[8]={["id"]=8,["baseid"]=5707,["posx"]=71,["posy"]=44,["startdays"]=5},
[9]={["id"]=9,["baseid"]=5712,["posx"]=71,["posy"]=44,["startdays"]=5},
[10]={["id"]=10,["baseid"]=5703,["posx"]=71,["posy"]=44,["startdays"]=7},
[11]={["id"]=11,["baseid"]=5708,["posx"]=71,["posy"]=44,["startdays"]=7},
[12]={["id"]=12,["baseid"]=5713,["posx"]=71,["posy"]=44,["startdays"]=7},
[13]={["id"]=13,["baseid"]=5704,["posx"]=71,["posy"]=44,["startdays"]=9},
[14]={["id"]=14,["baseid"]=5709,["posx"]=71,["posy"]=44,["startdays"]=9},
[15]={["id"]=15,["baseid"]=5714,["posx"]=71,["posy"]=44,["startdays"]=9},
}
MonsterAtkCityNpcDataBase.query = function(id) return MonsterAtkCityNpcDataBase[id] end
