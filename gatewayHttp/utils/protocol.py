import json

def load_json(s):
    ret = None
    try:
        ret = json.loads(s)
    except Exception:
        pass
    return ret
