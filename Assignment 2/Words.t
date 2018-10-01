% Words

var number : int
var words : array 1 .. 20 of string
var direction : int

put "How many words do you want"
get number
cls

for i : 1 .. number
    put "Enter a Word"
    get words (i)
    if words (i) = "x" then
	break
    end if
    cls
end for

put "What Direction do You Want The Words to go in?"
put "Enter 1 For The Words to go Forwards"
put "Enter 2 For The Words to go Backwards"
get direction
cls

if direction = 1 then
    for j : 1 .. number
	put words (j)
    end for
elsif direction = 2 then
    if number = 5 then
	for decreasing i : length (words (1)) .. 1
	    put words (1) (i) ..
	end for
	put ""
	for decreasing i : length (words (2)) .. 1
	    put words (2) (i) ..
	end for
	put ""
	for decreasing i : length (words (3)) .. 1
	    put words (3) (i) ..
	end for
	put ""
	for decreasing i : length (words (4)) .. 1
	    put words (4) (i) ..
	end for
	put ""
	for decreasing i : length (words (5)) .. 1
	    put words (5) (i) ..
	end for
    elsif number = 4 then
	for decreasing i : length (words (1)) .. 1
	    put words (1) (i) ..
	end for
	put ""
	for decreasing i : length (words (2)) .. 1
	    put words (2) (i) ..
	end for
	put ""
	for decreasing i : length (words (3)) .. 1
	    put words (3) (i) ..
	end for
	put ""
	for decreasing i : length (words (4)) .. 1
	    put words (4) (i) ..
	end for
    elsif number = 3 then
	for decreasing i : length (words (1)) .. 1
	    put words (1) (i) ..
	end for
	put ""
	for decreasing i : length (words (2)) .. 1
	    put words (2) (i) ..
	end for
	put ""
	for decreasing i : length (words (3)) .. 1
	    put words (3) (i) ..
	end for
    elsif number = 2 then
	for decreasing i : length (words (1)) .. 1
	    put words (1) (i) ..
	end for
	put ""
	for decreasing i : length (words (2)) .. 1
	    put words (2) (i) ..
	end for
    elsif number = 1 then
	for decreasing i : length (words (1)) .. 1
	    put words (1) (i) ..
	end for
    end if
end if
