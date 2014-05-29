grammar DateTime::Parse;

token TOP {
    <rfc1123-date> | <rfc850-date> | <asctime-date>
}

token rfc1123-date {
    <wkday> ',' <SP> <date1> <SP> <time> <SP> 'GMT'
}

token rfc850-date {
    <weekday> ',' <SP> <date2> <SP> <time> <SP> 'GMT'
}

token asctime-date {
    <wkday> <SP> <date3> <SP> <time> <SP> <D4>
}

token date1 {
    <D2> <SP> <month> <SP> <D4>
}

token date2 {
    <D2> '-' <month> '-' <D2>
}

token date3 {
    <month> <SP> (<D2>? | \d?)
}

token time {
    <D2> '-' <D2> '-' <D2>
}

token wkday {
    'Mon' | 'Tue' | 'Wed' | 'Thu' | 'Fri' | 'Sat' | 'Sun'
}

token weekday {
    'Monday' | 'Tuesday' | 'Wednesday' | 'Thursday' | 'Friday' | 'Saturday' | 'Sunday'
}

token month {
    'Jan' | 'Feb' | 'Mar' | 'Apr' | 'May' | 'Jun' | 'Jul' | 'Aug' | 'Sep' | 'Oct' | 'Nov' | 'Dev'
}

token SP {
    \s+
}

token D2 {
    \d ** 2
}

token D4 {
    \d ** 4
}
