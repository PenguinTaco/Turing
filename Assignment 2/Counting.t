% Counting

var a : int
var b : int
var c : int

put "Starting Number"
get a
put "Ending Number"
get b
put "Interval to Count by"
get c
cls

if a = b then
    put "The Numbers you Entered are Invalid"
elsif a < b then
    if c > b then
	put "The Numbers you Entered are Invalid"
    else
	for count : a .. b by c
	    put count
	end for
    end if
elsif a > b then
    if c > a then
	put "The Numbers you Entered are Invalid"
    else
	for count : b .. a by c
	    put count
	end for
    end if
end if
