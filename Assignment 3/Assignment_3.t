%***********************************************************************%
%                                                                       %
%                          PROGRAM HEADER                               %
%***********************************************************************%
%***********************************************************************%
%                                                                       %
% PROGRAMMER'S NAME:    Anthony                                         %
%                                                                       %
% DATE:                 Sunday, October 06, 2018                        %
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
% 1. Add comments                                                       %
% 2. Optimize Code                                                      %
%***********************************************************************%

var students : array 1 .. 50, 1 .. 7 of int
var average : array 1 .. 50 of int
var sum : int
var student : string
var total_marks_string : string
var total_marks_int : int
var mark : string
var mark_int : int
var i : int
var j : int
var ext : int

procedure clearScreen
    var ch : string (1)
    put "Please press ENTER to clear screen"
    getch (ch)
    cls
end clearScreen

i := 1
j := 1
ext := 0
sum := 0
average (i) := 0

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
	if ext = 1 then
	    exit
	end if
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
	    
		loop
		    if (j - 1) = total_marks_int then
			ext := 1
			exit
		    end if
		    put "Please enter the test ", j, " for student ", students (i, 1), " as a number between 0 to 100."
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
				sum := sum + e
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

    loop
	j := j + 1
	if j = 8 then
	    exit
	end if
	students (i, j) := -1
    end loop

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

end loop
