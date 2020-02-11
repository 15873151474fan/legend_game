-- FILE: 数表-红包.xlsx SHEET: 排名奖励 KEY: rank
RedPacketDataBase = {
[1]={["rank"]=1,["gold"]=5000,["title"]=44,["buff"]=4011},
[2]={["rank"]=2,["gold"]=4000,["title"]=45,["buff"]=4009},
[3]={["rank"]=3,["gold"]=3000,["title"]=46,["buff"]=4010},
[4]={["rank"]=4,["gold"]=200,["title"]=0,["buff"]=4001},
[5]={["rank"]=5,["gold"]=200,["title"]=0,["buff"]=4002},
[6]={["rank"]=6,["gold"]=200,["title"]=0,["buff"]=4003},
[7]={["rank"]=7,["gold"]=200,["title"]=0,["buff"]=4004},
[8]={["rank"]=8,["gold"]=200,["title"]=0,["buff"]=4005},
[9]={["rank"]=9,["gold"]=200,["title"]=0,["buff"]=4006},
[10]={["rank"]=10,["gold"]=200,["title"]=0,["buff"]=4007},
[11]={["rank"]=11,["gold"]=10,["title"]=0,["buff"]=4008},
}
RedPacketDataBase.query = function(rank) return RedPacketDataBase[rank] end
