
------------------------------------------------------------------------------------------------------
```
$ time ls
dir1 dir2 file1 file2 mcelog

real 0m0.007s
user 0m0.001s
sys 0m0.004s

Here,
real -refers the total time taken by command/program,
user - refers the time taken by the program in user mode,
sys - refers the time taken by the program in kernel mode.

time vs /usr/bin/time
$ type -a time
time is a shell keyword
time is /usr/bin/time

As you see in the above output, time is both,
A keyword built into the BASH shell
An executable file i.e /usr/bin/time

$ /usr/bin/time -o file.txt ls
dir1 dir2 file1 file2 file.txt mcelog
$ /usr/bin/time -a file.txt ls
```

------------------------------------------------------------------------------------------------------
```
$ timeout <time-limit-interval> <command>
For example, the following command will terminate after 10 seconds.
$ timeout 10s tail -f /var/log/pacman.log

The other available suffixes are:
'm' for minutes,
'h' for hours
'd' for days.



$ timeout -k 20 10 tail -f /var/log/pacman.log

Just in case if the command is still running even after the time out, 
you can send a kill signal like below.
In this case, if you the tail command still running after 10 seconds, 
the timeout command will send it a kill signal after 20 seconds and end it.

$ sudo apt-get install timelimit
$ timelimit -t10 tail -f /var/log/pacman.log


```
