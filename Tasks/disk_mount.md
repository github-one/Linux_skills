```
Step 1: Check the status of disks
# lsblk -f

Step 2: Disk partition
# fdisk /dev/sdb
　　　　　　开始对/sdb分区
　　　　　　*m　　显示命令列表
　　　　　　*p　　显示磁盘分区　　与fdisk -l效果相同
　　　　　　*n　　新增分区
　　　　　　*d　　删除分区
　　　　　　*w　　写入并退出
Now you will get the "/dev/sdb1"

Step 3: Disk formation
# mkfs -t ext4 /dev/sdb1

Step 4: Disk mounting
# mount /dev/sdb1  /home/newdisk
(dismount:  
$ umnout /dev/sdb1
or
$ umount /home/newdisk
)

Step 4: Disk automatic mounting
# vi /etc/fstab
add such a line:
/dev/sdb1  /home/newdisk ext4 defaults  0 0
then
$ mount -a

Step 5: check the usage of disks
# df -h
# du -s /home/newdisk
　　　　常用选项：-s　　指定目录占用大小汇总
　　　　　　　　　-h　　带计量单位
　　　　　　　　　-a　　含文件
　　　　　　　　　--max-depth=1　　子目录深度
　　　　　　　　　-c　　列出明细的同时，增加汇总值

```
