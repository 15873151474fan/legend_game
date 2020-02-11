-- FILE: 数表-怪物信息.xls SHEET: 巨兽围城 KEY: id
MonsterCityNpcDataBase = {
[1]={["id"]=1,["monsterinfo"]="7101,15;7112,1;7102,15;7113,1",["startdays"]=1},
[2]={["id"]=2,["monsterinfo"]="7102,15;7113,1;7103,15;7114,1",["startdays"]=3},
[3]={["id"]=3,["monsterinfo"]="7104,15;7115,1;7105,15;7116,1",["startdays"]=7},
[4]={["id"]=4,["monsterinfo"]="7106,15;7117,1;7107,15;7118,1",["startdays"]=14},
[5]={["id"]=5,["monsterinfo"]="7108,15;7119,1;7109,15;7120,1",["startdays"]=28},
[6]={["id"]=6,["monsterinfo"]="7110,15;7121,1;7111,15;7122,1",["startdays"]=99999},
}
MonsterCityNpcDataBase.query = function(id) return MonsterCityNpcDataBase[id] end
