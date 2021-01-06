```
# wget http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz
# wget -O wget.zip http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz
# wget http://ftp.gnu.org/gnu/wget/wget-1.5.3.tar.gz ftp://ftp.gnu.org/gnu/wget/wget-1.10.1.tar.gz.sig
# wget -i /wget/tmp.txt          ---- Read URL’s from a file

# wget -b /wget/log.txt ftp://ftp.iinet.net.au/debian/debian-cd/6.0.5/i386/iso-dvd/debian-6.0.5-i386-DVD-1.iso
                                 ---- Download files in background
# tail -f wget-log               ---- Check the process

# wget --reject=gif url          ---- Download url but not gif files


# wget --http-user=narad --http-password=password http://mirrors.hns.net.in/centos/6.3/isos/x86_64/CentOS-6.3-x86_64-LiveDVD.iso
# wget --ftp-user=narad --ftp-password=password ftp://ftp.iinet.net.au/debian/debi


# wget -c http://mirrors.hns.net.in/centos/6.3/isos/x86_64/CentOS-6.3-x86_64-LiveDVD.iso   
In case of big file download, it may happen sometime to stop download 
in that case we can resume download the same file where it was left off with -c option. 
But when you start download file without specifying -c option wget will add .1 extension 
at the end of file, considering as a fresh download. 
So, it’s good practice to add -c switch when you download big files.
```


```
-a<日志文件>：在指定的日志文件中记录资料的执行过程；
-A<后缀名>：指定要下载文件的后缀名，多个后缀名之间使用逗号进行分隔；
-b：进行后台的方式运行wget；
-B<连接地址>：设置参考的连接地址的基地地址；
-c：继续执行上次终端的任务；
-C<标志>：设置服务器数据块功能标志on为激活，off为关闭，默认值为on；
-d：调试模式运行指令；
-D<域名列表>：设置顺着的域名列表，域名之间用“，”分隔；
-e<指令>：作为文件“.wgetrc”中的一部分执行指定的指令；
-h：显示指令帮助信息；
-i<文件>：从指定文件获取要下载的URL地址；
-l<目录列表>：设置顺着的目录列表，多个目录用“，”分隔；
-L：仅顺着关联的连接；
-r：递归下载方式；
-nc：文件存在时，下载文件不覆盖原有文件；
-nv：下载时只显示更新和出错信息，不显示指令的详细执行过程；
-q：不显示指令执行过程；
-nh：不查询主机名称；
-v：显示详细执行过程；
-V：显示版本信息；
--passive-ftp：使用被动模式PASV连接FTP服务器；
--follow-ftp：从HTML文件中下载FTP连接文件。
```

```
下载多个文件
wget -i filelist.txt
首先，保存一份下载链接文件：

cat > filelist.txt
url1
url2
url3
url4
接着使用这个文件和参数-i下载。

过滤指定格式下载

wget --reject=gif ur
下载一个网站，但你不希望下载图片，可以使用这条命令。

把下载信息存入日志文件

wget -o download.log URL
不希望下载信息直接显示在终端而是在一个日志文件，可以使用。

限制总下载文件大小

wget -Q5m -i filelist.txt
当你想要下载的文件超过5M而退出下载，你可以使用。注意：这个参数对单个文件下载不起作用，只能递归下载时才有效。

下载指定格式文件

wget -r -A.pdf url
可以在以下情况使用该功能：

下载一个网站的所有图片。
下载一个网站的所有视频。
下载一个网站的所有PDF文件。
```
