% Temperature and What it Might Feel Like

var f : int
put "What is the temperature in fahrenheit"
get f
cls
put "Temperature in Celsius"
put (f - 32)/1.8:0:1
if (f - 32)/1.8 > 40 then
    put "boiling"
elsif (f - 32)/1.8 > 30 then
    put "too hot"
elsif (f - 32)/1.8 >= 0 then
    put "comfortable"
elsif (f - 32)/1.8 < 0 then
    put "cold"
end if
