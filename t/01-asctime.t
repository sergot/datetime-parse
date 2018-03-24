#! /usr/bin/env perl6

use v6.c;

use DateTime::Parse;
use Test;

plan 1;

my $string = "Thu Mar  3 23:05:25 2005";

lives-ok { DateTime::Parse.new($string); }, "date(1) string can be parsed";

# vim: ft=perl6 noet
