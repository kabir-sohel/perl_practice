use Memoize;
memoize 'Fibo';

sub Fibo{
    my $n = shift;
    return $n if $n <= 1;
    return Fibo($n - 1) + Fibo($n - 2);
}

print "Finding fibo...\n";
print Fibo(60);
