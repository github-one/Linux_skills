    #!/usr/bin/perl -w
    
    ($#ARGV == 0) or die "Usage: $0 [directory]\n";
    
    use File::Find;
    
    find(sub { -l && return; $size{$File::Find::name} = -s if -f;}, @ARGV);
    @sorted = sort {$size{$b} <=> $size{$a}} keys %size;
    
    my $total_size = 0;
    my $file_count = 0;
    foreach (@sorted)
    {
        $total_size += $size{$_};
        $file_count ++;
    }
    print "The total files is ", $file_count, "\n";
    print "The total size  is ", $total_size, "\n";     
    
    
    splice @sorted, 10 if @sorted > 10;
    
    foreach (@sorted)
    {   
        $file_size_with_comma = $size{$_};
        $file_size_with_comma =~ s/(\d)(?=(\d{3})+(\D|$))/$1\,/g;
        printf "%10d %s\n", $size{$_}, $_;
    } 
    
    
