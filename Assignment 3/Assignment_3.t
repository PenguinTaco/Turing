var students : array 1 .. 50, 1 .. 7 of int
var student : string
var total_marks : string
var mark : string
var i : int
var j : int

i := 1
j := 1

loop
    loop
	loop
	    put "Please enter a 7 digit student number. Type in 9999999 to quit."
	    get student
	    if strintok (student) = true then
		students (i, j) := strint (student)
		if length (student) = 7 then
		    exit
		else
		    put "The student number must be 7 digits long. Type 0's at the beginning if necessary"
		end if
	    elsif strintok (student) = false then
		put student, " is not a valid student number."
	    end if
	end loop
	put "Please enter the number of test marks for student: ", students (i, j)
	get total_marks
    end loop
end loop
