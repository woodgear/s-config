1. check net
```sh
ping www.bing.com
```
2. update mirrors
```sh
vim /etc/pacman.d/mirrorlist
```
3. disk
```
fdisk /dev/sda
g // gpt
n
enter
enter
+500M
t 
1

n
enter
enter
+8G     / root
n
enter
enter
enter     / home
w
```
```sh
mkfs.fat -F32 /dev/sda1
mkfs.ext4  /dev/sda2
mkfs.ext4  /dev/sda3

```
```
mount /dev/sda2 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
df -h // check point
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab // check poing
```
```
pacstrap -i /mnt base
arch-chroot /mnt
```
```
pacman -S linux linux-headers linux-lts linux-lts-headers

```