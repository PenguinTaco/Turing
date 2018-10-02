% Number Thing B

var sum : int
var numbers : array 1 .. 20 of int
var total_numbers : int
var i : int
sum := 0
i := 0

loop
    i := i + 1
    put "Input a Number"
    get numbers (i)
    exit when i = 2
    cls
end loop

cls

if numbers (1) < numbers (2) then
    for n : 1 .. 2
	total_numbers := numbers (2) + (numbers (1) - 1)
    end for
elsif numbers (1) > numbers (2) then
    for n : 1 .. 2
	total_numbers := numbers (1) + (numbers (2) - 1)
    end for
end if

if numbers (1) < numbers (2) then
    for j : numbers (1) .. numbers (2)
	sum := sum + j
    end for
elsif numbers (2) < numbers (1) then
    for j : numbers (2) .. numbers (1)
	sum := sum + j
    end for
end if

if numbers (1) = numbers (2) then
    put "The Numbers you Entered are Invalid"
else
    put "Sum of Numbers"
    put sum
    put "Average of Numbers"
    put sum / total_numbers
end if
