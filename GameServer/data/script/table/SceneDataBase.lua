-- FILE: 数表-副本.xlsx SHEET: 副本汇总表 KEY: dwID
SceneDataBase = {
[1]={["dwID"]=1,["openlevel"]=80,["scenename"]="神石副本",["intertime"]="2",["timelimit"]=1800,["cost"]="500002",["costnum"]="2",["item"]="{{19005,0,500000,0,\"1-1,4-1\"},{10210,0,10,0,\"1-1,4-1\"}}",["threecost"]=50,["script"]=1501,["monsnum"]=11},
[2]={["dwID"]=2,["openlevel"]=80,["scenename"]="龙珠副本",["intertime"]="2",["timelimit"]=1800,["cost"]="500002",["costnum"]="2",["item"]="{{19005,0,500000,0,\"1-1,4-1\"},{10223,0,10,0,\"1-1,4-1\"}}",["threecost"]=50,["script"]=1502,["monsnum"]=11},
[3]={["dwID"]=3,["openlevel"]=80,["scenename"]="羽毛副本",["intertime"]="2",["timelimit"]=1800,["cost"]="500002",["costnum"]="2",["item"]="{{19005,0,500000,0,\"1-1,4-1\"},{10097,0,10,0,\"1-1,4-1\"}}",["threecost"]=50,["script"]=1503,["monsnum"]=11},
[4]={["dwID"]=4,["openlevel"]=80,["scenename"]="护盾副本",["intertime"]="2",["timelimit"]=1800,["cost"]="500002",["costnum"]="2",["item"]="{{19005,0,500000,0,\"1-1,4-1\"},{10249,0,20,0,\"1-1,4-1\"}}",["threecost"]=50,["script"]=1504,["monsnum"]=11},
}
SceneDataBase.query = function(dwID) return SceneDataBase[dwID] end
