# Build Tools for Creating a Filesystem of Games For the Z80-Retro!

Note: This derived from the [Z80-Retro-disk-maker](https://github.com/Z80-Retro/Z80-Retro-disk-maker) repo.  

This will download the games from Anna Christina Naß's games repo here: 
https://git.imzadi.de/acn/vt100-games 
and build a filesystem suitable for use on the Z80 Retro!  

By default, a `make burn` will overwrite the filesystem on drive E of your SD card.

Here is a capture of me running this on my home system (just type `make` and then `make burn`):

```
winans@x570:~/projects/Z80-Retro/acn-vt100-games$ make 
Cloning into 'vt100-games'...
remote: Enumerating objects: 675, done.
remote: Counting objects: 100% (675/675), done.
remote: Compressing objects: 100% (621/621), done.
remote: Total 675 (delta 227), reused 107 (delta 49), pack-reused 0
Receiving objects: 100% (675/675), 1.79 MiB | 1.96 MiB/s, done.
Resolving deltas: 100% (227/227), done.
rm -f disk.img
mkfs.cpm -f generic-8k-8m disk.img
cpmcp -f generic-8k-8m disk.img vt100-games/HDimage/u0/* 0:
cpmcp -f generic-8k-8m disk.img vt100-games/HDimage/u0/* 1:
winans@x570:~/projects/Z80-Retro/acn-vt100-games$ make burn
rm -f disk.img
mkfs.cpm -f generic-8k-8m disk.img
cpmcp -f generic-8k-8m disk.img vt100-games/HDimage/u0/* 0:
cpmcp -f generic-8k-8m disk.img vt100-games/HDimage/u0/* 1:
sudo dd if=disk.img of=/dev/sdc1 bs=512 seek=4x16384 conv=fsync
2240+0 records in
2240+0 records out
1146880 bytes (1.1 MB, 1.1 MiB) copied, 0.189057 s, 6.1 MB/s
winans@x570:~/projects/Z80-Retro/acn-vt100-games$ 
```

Have fun!
