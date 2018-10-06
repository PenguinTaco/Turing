var students : array 1 .. 50, 1 .. 7 of int
var average : array 1 .. 50 of int
var student : string
var total_marks_string : string
var total_marks_int : int
var mark : string
var i : int
var j : int

i := 1
j := 1

loop
    loop

	if i = 51 then
	    exit
	end if

	put "Please enter a 7 digit student number. Type in 9999999 to quit."
	get student

	if strintok (student) = true then
	    students (i, j) := strint (student)
	    if students (i, j) = 9999999 then
		exit
	    end if
	    if length (student) = 7 then
		exit
	    else
		put "The student number must be 7 digits long. Type 0's at the beginning if necessary"
	    end if
	elsif strintok (student) = false then
	    put student, " is not a valid student number."

	end if

    end loop

    loop

	if i = 51 then
	    exit
	end if

	if students (i, j) = 9999999 then
	    exit
	end if
	put "Please enter the number of test marks for student: ", students (i, j)
	get total_marks_string
	if strintok (total_marks_string) = true then
	    total_marks_int := strint (total_marks_string)
	    if total_marks_int <= 0 then
		put "You must enter a number between 1 to 6"
	    elsif total_marks_int <= 6 then
		if total_marks_int = 6 then
		elsif total_marks_int = 5 then
		elsif total_marks_int = 4 then
		elsif total_marks_int = 3 then
		elsif total_marks_int = 2 then
		elsif total_marks_int = 1 then
		end if
	    else
		put "You cannot enter more than six test marks"
	    end if
	elsif strintok (total_marks_string) = false then
	    put "You must enter a number between 1 to 6"
	end if

    end loop

    if i = 51 then
	i := i - 1
	exit
    end if

    if students (i, j) = 9999999 then
	exit
    end if

end loop
