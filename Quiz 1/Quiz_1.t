var numbers : array 1 .. 5 of int
var number : string
var i : int
var sum : int

procedure clearScreen
    var ch : string (1)
    put "Press any key to clear screen"
    getch (ch)
    cls
end clearScreen

i := 1
sum := 0

loop
    loop
	put "Please enter an integer."
	get number
	if strintok (number) = false then
	    exit
	end if
	numbers (i) := strint (number)
	sum := sum + numbers (i)
	i := i + 1
	if i = 6 then
	    exit
	end if
    end loop
    if i = 6 then
	exit
    end if
    if strintok (number) = false then
	put number, " is not a valid integer."
	clearScreen
    end if
end loop

put "The list of numbers in the original order will be:"
for count : 1 .. 5
    put numbers (count)
end for

put "The list of numbers in the reverse order will be:"
for decreasing count : 5 .. 1
    put numbers (count)
end for

put "The sum of the numbers = ", sum
