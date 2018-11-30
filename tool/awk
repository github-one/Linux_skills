
Q:How can I get the total sizes of the .c file in the my project?
A:
    $ find . -name "*.c" -print0 | xargs -0 ls -FaGl | awk \
            '{ sum+=$4; print } END { print "Sum of the .c file size: \n" sum }'



