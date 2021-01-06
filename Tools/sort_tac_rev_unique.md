```
------------------------------------------------------------------------------------------
Q: How can I reverse the order of lines in a file?
A:
$ tail -r myfile.txt
$ tac a.txt > b.txt

:g/^/m0       # for vim
g means "do this globally. ^ means "the beginning of a line". 
m means "move the line to a new line number. 0 is which line to move to. 
0 means "top of the file, before the current line 1". 
So: "Find every line that has a beginning, and move it to line number 0."
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
sort
The default rules in the sort command
numbers > letters
lowercase > uppercase

The following sort command sorts lines in test file on numeric value in first word of line and displays sorted output.
$ sort -n test
11 qqq
22 zzz
33 sss
55 BBB
77 aaa

The following sort command sorts human readable numbers (i.e 1K = 1 Thousand, 1M = 1 Million, 1G = 1 Giga, 1T = 1 Tera).
$ sort -h test
1K
2K
2M
1G
2G
1T

The following sort command sorts lines in test file in reverse order and displays sorted output.
$ sort -r test
5
4
4
2
2
1

The following sort command sorts lines in test file in reverse order and removes duplicate lines from sorted output.
$ sort -r -u test
5
4
2
1

The following sort command sorts lines in test file on the 3rd word of each line and displays sorted output.
$ sort -k3 test
aa aa ff
aa aa kk
aa aa tt
aa aa zz

This will sort the text by the numerals on the third column.
$sort filename.txt -k 3n
1. MX Linux 100
5. Ubuntu 200
3. Mint 300
2. Manjaro 400
4. elementary 500

Same as the above command just that the sort order has been reversed.
$sort filename.txt -k 3nr
4. elementary 500
2. Manjaro 400
3. Mint 300
5. Ubuntu 200
1. MX Linux 100


In test file, words in each line are separated by delimiter ‘|’. 
It sorts lines in test file on the 2nd word of each line on the basis of numeric value.

$ sort -n -t'|' -k2 test -o outfile
The contents of output file are shown below.
$ cat outfile
aa|1a|tt
aa|2a|ff
aa|3a|kk
aa|5a|zz

------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
rev
While the rev command works character wise on lines of text, there's another command - 
dubbed tac - that reverses the information lines wise. You can learn more about tac by heading here.

------------------------------------------------------------------------------------------
tac

$ echo "1,2" | tac -s ,
2
1,

$echo "1,2" | tac -b -s ,
,2
1

------------------------------------------------------------------------------------------
uniqe

$ cat apple.txt
apple
apple
orange
orange
apple 
orange
$ uniq apple.txt 
apple
orange
apple 
orange
$ sort apple.txt | uniq 
apple
banana
orange

$ uniq sample_log_file.txt uniq_log_output.txt 

Using ‘-c’ to get the count of repeated lines
$ uniq sample_log_file.txt -c

Only print repeated lines with ‘-d’
$ uniq sample_log_file.txt -d

Only print unique lines with ‘-u’
$ uniq sample_log_file.txt -u

Ignore fields or characters with uniq [‘-f’ and ‘-s’]
Skip fields with:
$ uniq <source_file> -f N
Skip characters with:
$ uniq <source_file> -s N

Use ‘-w’ to compare only N characters
The ‘-w’ option allows us to specify an exact number of characters to use in our comparison.
$ uniq -w 4 sample_log_file.txt 

```
