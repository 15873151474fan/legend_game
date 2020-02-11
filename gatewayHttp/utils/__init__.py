import netifaces

def to_utf8(v):
    if isinstance(v,unicode):
        return v.encode("UTF-8")
    elif isinstance(v,str):
        return v
    else:
        return str(v)


def is_localhost(addr):
    return addr.startswith('127.0') or addr == '::1'

def is_private_ipv4(addr):
    return addr.startswith('10.') or addr.startswith('172.16') or addr.startswith('192.168')

def get_ipv4_list():
    for interface in netifaces.interfaces():
        intf= netifaces.ifaddresses(interface)
        if netifaces.AF_INET in intf:
            inet = intf[netifaces.AF_INET]
            if len(inet) and 'addr' in inet[0]:
                yield inet[0]['addr']

def get_private_ipv4_list():
    for ip in get_ipv4_list():
        if is_private_ipv4(ip):
            yield ip

# first_private_ipv4 = get_private_ipv4_list().next()

def get_listening_address():
    # try:
        # listening_address = first_private_ipv4
    # except:
        # listening_address = ''
    # return listening_address
    return ''
