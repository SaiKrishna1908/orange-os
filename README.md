# orange-os

## Build binary
```
    nasm -f bin ./boot.asm -o ./boot.bin
```

##  Run the binary 
```
    qemu-system-x86_64 -hda ./boot.bin
```

## Burn the os to a usb
```
    sudo dd -if=./boot.bin of=<usb location>
```