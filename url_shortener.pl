#! /usr/bin/perl
use integer;
use strict;
use warnings;

my @code = ('A'..'Z', 'a'..'z', '0'..'9','?','/');
my @enc = ();
my @dec = ();
sub encode {
    my $v = shift;
    my @encoded = ();
    my $base = @code;
    do {
        push @encoded, $code[$v % $base] and $v /= $base
    }while ($v > 0);
    return join "", reverse @encoded;
}
sub decode {
    my $v = shift;
    my %codeHash = ();
    while((my $in, my $d) = each @code){
        $codeHash{$d} = $in;
    }   
    my $base = @code, my $pow = 1, my $decoded = 0;
    $decoded += ($pow * $codeHash{$_}) and $pow *= $base for(reverse split("", $v));
    return $decoded;
}
for my $v(@ARGV){
    push @enc, encode($v);
    push @dec, decode($enc[$#enc]);
}
print "ARGV = @ARGV\nenc = @enc\ndec = @dec\n";
