-- FILE: 数表-假日活动表.xlsx SHEET: 转盘前端显示 KEY: index
TurntableShowDataBase = {
[1]={["index"]=1,["rate"]=100,["node"]=130,["nodetwo"]=70,["nodedefault"]=0},
[2]={["index"]=2,["rate"]=100,["node"]=120,["nodetwo"]=80,["nodedefault"]=0},
[3]={["index"]=3,["rate"]=100,["node"]=110,["nodetwo"]=90,["nodedefault"]=0},
[4]={["index"]=4,["rate"]=6000,["node"]=0,["nodetwo"]=0,["nodedefault"]=0},
[5]={["index"]=5,["rate"]=30,["node"]=700,["nodetwo"]=600,["nodedefault"]=0},
[6]={["index"]=6,["rate"]=2670,["node"]=5,["nodetwo"]=3,["nodedefault"]=0},
[7]={["index"]=7,["rate"]=0,["node"]=0,["nodetwo"]=0,["nodedefault"]=0},
[8]={["index"]=8,["rate"]=1000,["node"]=15,["nodetwo"]=5,["nodedefault"]=0},
}
TurntableShowDataBase.query = function(index) return TurntableShowDataBase[index] end
