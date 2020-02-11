from Crypto.Cipher import DES
from Crypto.Cipher import DES3
import base64
from utils.pkcs7 import PKCS7Encoder
class EncryptHelper(object):
    @staticmethod
    def des3_encrypt_ecb_pkcs7(text,key,mod_k = 8):
        d3= DES3.new(key, DES.MODE_ECB)
        encoder = PKCS7Encoder(mod_k)
        pad_text = encoder.encode(text)
        return base64.b64encode(d3.encrypt(pad_text)).encode("hex")

    @staticmethod
    def des3_decrypt_ecb_pkcs7(text,key,mod_k = 8):
        des3_text = base64.b64decode(text.decode("hex"))
        return EncryptHelper.des3_decrypt_ecb_pkcs7_plain(des3_text,key,mod_k)

    @staticmethod
    def des3_decrypt_ecb_pkcs7_plain(des3_text,key,mod_k = 8):
        d3= DES3.new(key, DES.MODE_ECB)
        pad_text = d3.decrypt(des3_text)
        text = None
        try:
            decoder = PKCS7Encoder(mod_k)
            text = decoder.decode(pad_text)
        except:
            pass
        return text

if __name__ == "__main__":
    text = "hello"
    e = EncryptHelper.des3_encrypt_ecb_pkcs7("hello","1231231212312312")
    d = EncryptHelper.des3_decrypt_ecb_pkcs7(e,"1231231212312312")
    w = EncryptHelper.des3_decrypt_ecb_pkcs7(e,"x231231212312312")
    assert(w == None)
    assert(d == text)
