## VNC

Decrypt TightVNC password:

```
root@kali:$ msdbrun -q
msf5 > irb
>> fixedkey = "\x17\x52\x6b\x06\x23\x4e\x58\x07"
=> "\u0017Rk\u0006#NX\a"
>> require 'rex/proto/rfb'
=> true
>> Rex::Proto::RFB::Cipher.decrypt ["f0f0f0f0f0f0f0f0"].pack('H*'), fixedkey
=> "<DECRYPTED>"
```

* [github.com/frizb/PasswordDecrypts](https://github.com/frizb/PasswordDecrypts)