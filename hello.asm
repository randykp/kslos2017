section .data                           ;section declaration
msg db "Hello, haxor!",0xa              ;our string with a carriage return
len equ $ - msg                         ;length of our string, $ means here
section .text                   ;mandatory section declaration
                                ;export the entry point to the ELF linker or
global _start
                                ;loaders conventionally recognize
                                ; _start as their entry point
_start:


                                ;now, write our string to stdout
                                ;notice how arguments are loaded in reverse
mov     edx,len ;third argument (message length)
mov     ecx,msg ;second argument (pointer to message to write)
mov     ebx,1   ;load first argument (file handle (stdout))
mov     eax,4   ;system call number (4=sys_write)
int     0x80    ;call kernel interrupt and exit
mov     ebx,0   ;load first syscall argument (exit code)
mov     eax,1   ;system call number (1=sys_exit)
int     0x80    ;call kernel interrupt and exit

