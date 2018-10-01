% Counting

var a : int
var b : int
var c : int

procedure getNumbers
    put "Starting Number"
    get a
    put "Ending Number"
    get b
    put "Interval to Count by"
    get c
    cls
end getNumbers

getNumbers

if a = b or c > b then
    put "The Numbers you Entered are Invalid"
elsif a < b then
    for count : a .. b by c
	put count
    end for
elsif a > b then
    for count : b .. a by c
	put count
    end for
end if
