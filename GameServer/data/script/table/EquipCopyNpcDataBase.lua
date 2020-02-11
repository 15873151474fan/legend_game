-- FILE: 数表-怪物信息.xls SHEET: 装备副本 KEY: id
EquipCopyNpcDataBase = {
[1]={["id"]=1,["needlevel"]=60,["monid"]=18002,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=20000,["time"]=21600,["gold"]=5,["limit"]=1},
[2]={["id"]=2,["needlevel"]=70,["monid"]=18003,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=50000,["time"]=21600,["gold"]=10,["limit"]=1},
[3]={["id"]=3,["needlevel"]=80,["monid"]=18004,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=100000,["time"]=21600,["gold"]=20,["limit"]=1},
[4]={["id"]=4,["needlevel"]=1001,["monid"]=18005,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=200000,["time"]=21600,["gold"]=40,["limit"]=1},
[5]={["id"]=5,["needlevel"]=1002,["monid"]=18006,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=400000,["time"]=21600,["gold"]=80,["limit"]=1},
[6]={["id"]=6,["needlevel"]=1004,["monid"]=18007,["num"]=1,["x"]=27,["y"]=15,["buffcost"]=700000,["time"]=21600,["gold"]=150,["limit"]=1},
}
EquipCopyNpcDataBase.query = function(id) return EquipCopyNpcDataBase[id] end
