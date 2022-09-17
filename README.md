# orange-os

## Build binary
```
    nasm -f bin ./boot.asm -o ./boot.bin
```

##  Run the binary 
```
    qemu-system-x86_64 -hda ./boot.bin
```