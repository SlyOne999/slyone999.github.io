To generate an RSA 4096-bit key pair:


ssh-keygen -t rsa -b 4096 -f key_name
To generate an ECDSA 521-bit key-pair (ECDSA has bit sizes of 256, 384, and 521):


ssh-keygen -t ecdsa -b 521 -f key_name
To generate an ED25519 key pair:


ssh-keygen -t ed25519 -f key_name
The following shows an example of the ssh-keygen output.


ssh-keygen -t rsa -b 4096 -f key_name
Generating public/private rsa key pair.

Enter passphrase (empty for no passphrase): 
Enter same passphrase again:
Your identification has been saved in key_name.
Your public key has been saved in key_name.pub.
The key fingerprint is:
SHA256:8tDDwPmanTFcEzjTwPGETVWOGW1nVz+gtCCE8hL7PrQ bob.amazon.com
The key's randomart image is:
+---[RSA 4096]----+
|    . ....E      |
| .   = ...       |
|. . . = ..o      |
| . o +  oo =     |
|  + =  .S.= *    |
| . o o ..B + o   |
|     .o.+.* .    |
|     =o*+*.      |
|    ..*o*+.      |
+----[SHA256]-----+
Tip: When you run the ssh-keygen command as shown preceding, it creates the public and private keys as files in the current directory.

Your SSH key pair is now ready to use. Follow steps 3 and 4 to store the SSH public key for your service-managed users. These users use the keys when they transfer files on Transfer Family server endpoints.