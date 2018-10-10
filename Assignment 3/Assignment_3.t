%***********************************************************************%
%                                                                       %
%                          PROGRAM HEADER                               %
%***********************************************************************%
%***********************************************************************%
%                                                                       %
% PROGRAMMER'S NAME:    Anthony                                         %
%                                                                       %
% DATE:                 Tuesday, October 09, 2018                       %
%                                                                       %
% PROGRAM NAME:         Student Marks and Average                       %
%                                                                       %
% CLASS:                TEJ3M1-04                                       %
%                                                                       %
% ASSIGNMENT:           Assignment #3                                   %
%                                                                       %
% TEACHER:              Mr. Henrich                                     %
%                                                                       %
% DUE DATE:             Thursday, October 11, 2018                      %
%                                                                       %
%***********************************************************************%
%                                                                       %
% WHAT THE PROGRAM DOES                                                 %
%                                                                       %
% This program asks for a student number (up to 50) and then asks for a %
% total number of test then asks for marks for that many tests once done%
% the program will calculate a average for that student and will repeat %
% until 50 students are entered or "9999999" is entered as a student    %
% number as a exit command. The program will display a table with all   %
% the information that was entered.                                     %
%***********************************************************************%
%                                                                       %
% PROCEDURES                                                            %
%                                                                       %
% One procedure is used within this program:                            %
% clearScreen:    This procedure is used to provide the user with a     %
%                 prompt to alert the user that the screen is about to  %
%                 be cleared.                                           %
%***********************************************************************%
%                                                                       %
% ERROR HANDLING                                                        %
%                                                                       %
% This program uses error handling routines, such as strintok, length   %
% and loops to check if the numbers inputed are within the acceptable   %
% range.                                                                %
%***********************************************************************%
%                                                                       %
% PROGRAM LIMITATIONS                                                   %
%                                                                       %
% Needs alot of error checks to not randomly crash.                     %
%***********************************************************************%
%                                                                       %
% EXTENSIONS AND IMPROVEMENTS                                           %
% This program could be improved in a variety of ways:                  %
% 1. Optimize Code                                                      %
%***********************************************************************%

var total_students : int % Tallys Total Number of Students
var students : array 1 .. 50, 1 .. 7 of int % Store Student Numbers and Marks
var sum : array 1 .. 50 of int % Store Sum for Students
var student : array 1 .. 50 of string % Store Displayed Student Numbers
var total_marks_string : string % Error Checking
var total_marks_int : array 1 .. 50 of int % Stores Total Ammount of Marks which is used for average calculating
var mark : string % Error Checking
var mark_int : int % Used for calculating sum
var change_mark : string % Error Checking
var change_mark_int : int % Used to Know which test mark to change
var i : int % Counter
var j : int % Counter
var d : int % Counter
var ext : int % Exit Flag

% Setting up Procedure to Prompt When the Screen Would be Cleared
procedure clearScreen
    var ch : string (1)
    put "Please press ENTER to clear screen"
    getch (ch)
    cls
end clearScreen
% Finished Setting up Procedure

% Setting Intergers
total_students := 1
i := 1
j := 1
ext := 0
% Finished Setting Intergers

loop

    % Setting Conditional Intergers
    sum (i) := 0
    % Finished Setting Conditional Intergers

    % Get Student Number
    loop
	if i = 51 then
	    exit
	end if
	put "Please enter a 7 digit student number. Type in 9999999 to quit."
	get student (i)
	if strintok (student (i)) = true then
	    students (i, j) := strint (student (i))
	    if students (i, j) > 0 then
		if students (i, j) = 9999999 then
		    exit
		end if
		if length (student (i)) = 7 then
		    exit
		else
		    put "The student number must be 7 digits long. Type 0's at the beginning if necessary"
		end if
	    elsif students (i, j) < 0 then
		put "The student number must be a positive number"
	    else
		put "The student number must not contain only 0's"
	    end if
	elsif strintok (student (i)) = false then
	    put student (i), " is not a valid student number."
	end if
    end loop

    % Get Total Ammount of Tests and Test marks
    loop
	if ext >= 1 then
	    exit
	end if
	if i = 51 then
	    exit
	end if
	if students (i, j) = 9999999 then
	    exit
	end if
	if total_students > 2 then
	    for e : 1 .. (total_students - 1)
		loop
		    if ext = 2 then
			exit
		    end if
		    if ext = 3 then
			exit
		    end if
		    if students (i, 1) = students (e, 1) then
			d := e
			put "Which test mark do you want to change for student: ", student (d), ". Enter 9 to exit"
			get change_mark
			if strintok (change_mark) = true then
			    change_mark_int := strint (change_mark)
			    if change_mark_int = 9 then
				ext := 2
				total_students := total_students - 1
				i := i - 1
				exit
			    end if
			    j := change_mark_int
			    if change_mark_int > total_marks_int (d) then
				total_marks_int (d) := total_marks_int (d) + 1
			    end if
			    if j <= 0 then
				put "You must enter a number between 1 to 6"
			    elsif j <= 6 then
				j := j + 1
				put "Please enter the test ", j - 1, " mark for student ", student (d), " as a number between 0 to 100."
				get mark
				if strintok (mark) = true then
				    students (d, j) := strint (mark)
				    mark_int := strint (mark)
				    if students (d, j) < 0 then
					put "Your value of ", students (d, j), " was not between 0 to 100"
				    elsif students (d, j) > 100 then
					put "Your value of ", students (d, j), " was not between 0 to 100"
				    else
					for o : mark_int .. mark_int
					    sum (d) := sum (d) + o
					    ext := 2
					    total_students := total_students - 1
					    i := i - 1
					end for
				    end if
				elsif strintok (mark) = false then
				    put "You must enter a number between 0 to 100"
				end if
			    else
				put "You cannot enter more than six test marks"
			    end if
			end if
		    else
			ext := 3
		    end if
		end loop
	    end for
	elsif total_students = 2 then
	    loop
		if ext = 2 then
		    exit
		end if
		if ext = 3 then
		    exit
		end if
		if students (1, 1) = students (2, 1) then
		    d := 1
		    put "Which test mark do you want to change for student: ", student (d), ". Enter 9 to exit"
		    get change_mark
		    if strintok (change_mark) = true then
			change_mark_int := strint (change_mark)
			if change_mark_int = 9 then
			    ext := 2
			    total_students := total_students - 1
			    i := i - 1
			    exit
			end if
			j := change_mark_int
			if change_mark_int > total_marks_int (d) then
			    total_marks_int (d) := total_marks_int (d) + 1
			end if
			if j <= 0 then
			    put "You must enter a number between 1 to 6"
			elsif j <= 6 then
			    j := j + 1
			    put "Please enter the test ", j - 1, " mark for student ", student (d), " as a number between 0 to 100."
			    get mark
			    if strintok (mark) = true then
				students (d, j) := strint (mark)
				mark_int := strint (mark)
				if students (d, j) < 0 then
				    put "Your value of ", students (d, j), " was not between 0 to 100"
				elsif students (d, j) > 100 then
				    put "Your value of ", students (d, j), " was not between 0 to 100"
				else
				    for o : mark_int .. mark_int
					sum (d) := sum (d) + o
					ext := 2
					total_students := total_students - 1
					i := i - 1
				    end for
				end if
			    elsif strintok (mark) = false then
				put "You must enter a number between 0 to 100"
			    end if
			else
			    put "You cannot enter more than six test marks"
			end if
		    end if
		else
		    ext := 3
		end if
	    end loop
	end if
	if ext = 2 then
	    exit
	end if
	put "Please enter the number of test marks for student: ", student (i)
	get total_marks_string
	if strintok (total_marks_string) = true then
	    total_marks_int (i) := strint (total_marks_string)
	    if total_marks_int (i) <= 0 then
		put "You must enter a number between 1 to 6"
	    elsif total_marks_int (i) <= 6 then
		loop
		    if (j - 1) = total_marks_int (i) then
			ext := 1
			exit
		    end if
		    put "Please enter the test ", j, " mark for student ", student (i), " as a number between 0 to 100."
		    get mark
		    if strintok (mark) = true then
			j := j + 1
			students (i, j) := strint (mark)
			mark_int := strint (mark)
			if students (i, j) < 0 then
			    put "Your value of ", students (i, j), " was not between 0 to 100"
			    j := j - 1
			elsif students (i, j) > 100 then
			    put "Your value of ", students (i, j), " was not between 0 to 100"
			    j := j - 1
			else
			    for e : mark_int .. mark_int
				sum (i) := sum (i) + e
			    end for
			end if
		    elsif strintok (mark) = false then
			put "You must enter a number between 0 to 100"
		    end if
		end loop
	    else
		put "You cannot enter more than six test marks"
	    end if
	elsif strintok (total_marks_string) = false then
	    put "You must enter a number between 1 to 6"
	end if
    end loop

    if ext = 1 then
	ext := 0
    end if

    if ext = 3 then
	ext := 0
    end if

    % Fill Empty Marks With -1
    loop

	if ext = 2 then
	    exit
	end if

	if i = 51 then
	    i := i - 1
	    exit
	end if

	if students (i, j) = 9999999 then
	    exit
	end if

	j := j + 1

	if j = 8 then
	    exit
	end if

	students (i, j) := -1

    end loop

    % Reseting Exit Int and Counter
    ext := 0
    j := 1

    if i = 51 then
	i := i - 1
	exit
    end if

    if students (i, j) = 9999999 then
	exit
    end if

    i := i + 1

    clearScreen

    total_students := total_students + 1

end loop

clearScreen

% Display Table Header
put "Student Number  Test 1  Test 2  Test 3  Test 4  Test 5  Test 6  Average"
% Displayed Table Header

% Fix for crash
if i < 51 then
    total_students := total_students - 1
end if

% Display Table
for e : 1 .. total_students
    j := 2
    put "   " ..
    put student (e), "        " ..
    loop
	if j = 8 then
	    put " ", round (sum (e) / total_marks_int (e)), "."
	    exit
	end if
	if students (e, j) = -1 then
	    put "***     " ..
	else
	    put students (e, j), "     " ..
	end if
	j := j + 1
    end loop
end for
