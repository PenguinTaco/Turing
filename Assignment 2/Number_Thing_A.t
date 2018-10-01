% Number Thing A

var sum : int
var numbers : array 1 .. 20 of int
var total_numbers : int
sum := 0

for i : 1 .. 2
    put "Input a Number"
    get numbers (i)
    cls
end for

if numbers (1) < numbers (2) then
    for n : 1 .. 2
	total_numbers := (numbers (2) - 1) - numbers (1)
    end for
elsif numbers (1) > numbers (2) then
    for n : 1 .. 2
	total_numbers := (numbers (1) - 1) - numbers (2)
    end for
end if

if numbers (1) < numbers (2) then
    for j : (numbers (1) + 1) .. (numbers (2) - 1)
	sum := sum + j
    end for
elsif numbers (2) < numbers (1) then
    for j : (numbers (2) + 1) .. (numbers (1) - 1)
	sum := sum + j
    end for
end if

put "Sum of Numbers"
put sum
put "Average of Numbers"
put sum / total_numbers
