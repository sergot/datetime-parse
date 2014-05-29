class DateTime::Parse::Actions;

method TOP($/) {
    make $<dt>.made
}

method rfc1123-date($/) {
    make DateTime.new(|$<date>.made, |$<time>.made)
}

method rfc850-date($/) {
    make DateTime.new(|$<date>.made, |$<time>.made)
}

method asctime-date($/) {
    make DateTime.new(:year($<year>.made), |$<date>.made, |$<time>.made)
}

method date1($/) { # e.g., 02 Jun 1982
    make { year => $<year>.made, month => $<month>.made, day => $<day>.made }
}

method date2($/) { # e.g., 02-Jun-82
    make { year => $<year>.made, month => $<month>.made, day => $<day>.made }
}

method date3($/) { # e.g., Jun  2
    make { year => $<year>.made, month => $<month>.made, day => $<day>.made }
}

method time($/) {
    make { hour => +$<hour>, minute => +$<minute>, second => +$<second> }
}

my %wkday = Mon => 0, Tue => 1, Wed => 2, Thu => 3, Fri => 4, Sat => 5, Sun => 6;
method wkday($/) {
    make %wkday{~$/}
}

my %weekday = Monday => 0, Tuesday => 1, Wednesday => 2, Thursday => 3,
              Friday => 4, Saturday => 5, Sunday => 6;
method weekday($/) {
    make %weekday{~$/}
}

my %month = Jan => 1, Feb => 2, Mar => 3, Apr =>  4, May =>  5, Jun =>  6,
            Jul => 7, Aug => 8, Sep => 9, Oct => 10, Nov => 11, Dev => 12;
method month($/) {
    make %month{~$/}
}

method D4-year($/) {
    make +$/
}

method D2-year($/) {
    my $yy = +$/;
    make $yy < 34 ?? 2000 + $yy !! 1900 + $yy
}

method D2($/) {
    make +$/
}
