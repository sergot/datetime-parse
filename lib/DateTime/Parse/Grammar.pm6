grammar DateTime::Parse::Grammar;

token TOP {
    <dt=rfc1123-date> | <dt=rfc850-date> | <dt=asctime-date>
}

token rfc1123-date {
    <.wkday> ',' <.SP> <date=.date1> <.SP> <time> <.SP> 'GMT'
}

token rfc850-date {
    <.weekday> ',' <.SP> <date=.date2> <.SP> <time> <.SP> 'GMT'
}

token asctime-date {
    <.wkday> <.SP> <date=.date3> <.SP> <time> <.SP> <year=.D4-year>
}

token date1 { # e.g., 02 Jun 1982
    <day=.D2> <.SP> <month> <.SP> <year=.D4-year>
}

token date2 { # e.g., 02-Jun-82
    <day=.D2> '-' <month> '-' <year=.D2>
}

token date3 { # e.g., Jun  2
    <month> <.SP> (<day=.D2> | <.SP> <day=.D1>)
}

token time {
    <hour=.D2> ':' <minute=.D2> ':' <second=.D2>
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

token D4-year {
    \d ** 4
}

token D2-year {
    \d ** 2
}

token SP {
    \s
}

token D1 {
    \d
}

token D2 {
    \d ** 2
}
