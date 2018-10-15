var numbers : array 1 .. 2 of int
var number : string
var total_number : int
var i : int
var sum : int
var ext : int

procedure clearScreen
    var ch : string (1)
    put "Press any key to clear screen"
    getch (ch)
    cls
end clearScreen

i := 1
sum := 0
ext := 0

loop
    loop
	put "Please enter a negative interger"
	get number
	if strintok (number) = true and strint (number) < 0 then
	    ext := 1
	end if
	if i = 2 and strint (number) < numbers (i - 1) then
	    put number, " is not a negative interger greater than starting interger"
	    clearScreen
	    ext := 2
	end if
	exit when ext > 0
	if strintok (number) = false then
	    put number, " is not a negative interger"
	end if
	clearScreen
    end loop
    if ext = 1 then
	numbers (i) := strint (number)
	ext := 0
	i := i + 1
	if i = 3 then
	    exit
	end if
    end if

end loop

for j : numbers (1) .. numbers (2)
    sum := sum + j
end for

total_number := numbers (1) - (numbers (2) + 1)

clearScreen
put "The numbers are:"
for j : numbers (1) .. numbers (2)
    put j
end for
put "The average is"
put "-", sum / total_number
