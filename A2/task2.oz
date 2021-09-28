
declare fun {Lex Input} 
  {String.tokens Input 32} % Remove space - ASCII value of 32 
end

%{Show {Lex "1 2 + 3 *" }}

declare fun {Tokenize Lexemes} 
  {List.map Lexemes fun {$X}
    case X 
      of "+" then operator(type:plus)
      [] "-" then operator(type:minus)
      [] "*" then operator(type:multiply)
      [] "/" then operator(type:divide)
      [] "p" then command(print)
      [] "d" then command(duplicate)
      [] "i" then command(i)
      [] "^" then command(inverse)
    else
      number({String.toFloat X})
    end
  end}
end

%{Show {Tokenize {Lex "1 2 + 3 *"}}}
 
% declare fun {Pop C} Old New in 
%   {Exchange C Old New}
%   case Old
%     of nil then New=nil raise empty end
%     [] H|T then New=T H
%   end 
% end 
   
declare fun {Push Stack X}
  X | Stack 
end 
   

declare fun {Interpret Tokens}

  fun {While Token Stack} A B in
    case Tokens of 
      nil then {List.reverse Stack}
      
      [] number(N) | Tail then
        {While Tail {Push Stack number(N)}}

      [] operator | Tail then
        case Stack of 
          number(A) | number(B) | StackTail then
          
        %A = {Pop Stack}
        %B = {Pop Stack}

          case operator.type 
            of plus     then {While Tail {Push StackTail number(A+B)} }
            [] minus    then {While Tail {Push StackTail number(A-B)} }
            [] multiply then {While Tail {Push StackTail number(A*B)} }
            [] divide   then {While Tail {Push StackTail number(A/B)} }
          end
        else
          nil
        end
    end
end
 
  in 
    {While Tokens nil}
end

%{Show {Interpret {Tokenize {Lex "1 2 3 +"}}}}