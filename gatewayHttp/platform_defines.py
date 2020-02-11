#encoding: utf-8
from tornado.util import import_object
from command import TPlatformContext,AS2PSConnectCommand
ePlatform_UNKNOWN = 0  # PC测试平台(安卓)


__name_to_id__ = dict(
    pc      = ePlatform_UNKNOWN,
)
__id_to_name__ = {}
for k , v in __name_to_id__.items():
    __id_to_name__[v] = k

__actives__ = []


def name_to_id(name):
    return __name_to_id__.get(name,None)

def id_to_name(_id):
    return __id_to_name__[_id];

__platform_configs__ = [ ]
__platform_id_to_handler__ = {}

def check_uniqueness( platforms ):
    prefixes = set()
    for p in platforms:
        if p['szPrefix'] in prefixes:
            raise ValueError("Prefix `%s` is exists" %  p['szPrefix'] )
        prefixes.add(p['szPrefix'])

def import_platforms_bak():
    for p in __actives__:
        pm = import_object(p)
        c = import_object('%s.config' % p)
        __platform_configs__.append(getattr(c,'get_plaform_info')())
        __platform_id_to_handler__[name_to_id(p)] = getattr(pm,'get_handlers')()

    check_uniqueness(__platform_configs__)

def import_platforms():
    for p in __actives__:
        old_p = p
        index = p.find('_')
        if index != -1:
            p = p[:index]
        pm = import_object(p)
        if index != -1:
            pInfo = dict(nPlatformID=name_to_id(old_p),szPrefix=old_p + '_')
        else:
            pInfo = getattr(import_object('%s.config' % p),'get_plaform_info')()
        __platform_configs__.append(pInfo)
        __platform_id_to_handler__[name_to_id(old_p)] = getattr(pm,'get_handlers')()
    check_uniqueness(__platform_configs__)

def get_platform_by_id(_id):
    return __platform_id_to_handler__.get(_id,None)

def get_platform_configs():
    return __platform_configs__

def create_platform_contexts():
    configs = get_platform_configs()
    platform_count = len(configs)
    contexts = (TPlatformContext * platform_count )()
    count = 0
    for p in configs:
        c = contexts[count]
        c.nPlatformID = p['nPlatformID']
        c.szPrefix    = p['szPrefix']
        count = count + 1

    return contexts

#平台那边统计需要查找游戏在平台那边的ID
def get_zqb_platid(platid):
    platid = int(platid)
    if platid in (1,2,17,64,65,66) or (platid >= 100 and platid <= 130):
        return platid
    elif platid in (11,12,14,36,43,46,47,50,52,59,81,84,87,92):
        return 2
    return 1

if __name__ == "__main__":
    def test_import_platforms():
        import_platforms()
        for p in __platform_configs__:
            print(p['szPrefix'])

    def test_create_platform_context():
        platforms = (TPlatformContext * 3)()
        p =  platforms[0]
        p.nPlatformID = ePlatform_UNKNOWN
        p.szAppKey = "pc"
        p =  platforms[1]
        p.nPlatformID = ePlatform_ZQB
        p.szAppKey = "bw"
        p =  platforms[2]
        p.nPlatformID = ePlatform_91
        p.szAppKey = "91"
        cmd = AS2PSConnectCommand(123123,platforms)
        # cast(pointer(cmd.data),POINTER((TPlatformContext * 3)) ).contents[0].szAppKe
        print repr(cmd.pack())
    test_import_platforms()
    print get_platform_by_id(6)

