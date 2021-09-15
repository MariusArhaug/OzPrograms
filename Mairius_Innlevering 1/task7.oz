/*
  A)
  Take in List 
  Recursivly pattern match on head | tail and then increment counter
  then do the same for remaining tail

 */
declare fun {Length List} 
    case List of 
      Head | Tail then
        {Length Tail} + 1
      [] nil then
        0
    end
end

{Show {Length [1 2 3 4 5]}}

% /*
%   B)

%  */

% fun {Take List Count} 


% end