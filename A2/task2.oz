% declare [Stack] = {Module.link ['x-ozlib://niehren/base/stack.ozf']}


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


define 
  fun {NewStack}      {Cell.new nil} end 
   
  fun {Pop C} Old New in 
     {Exchange C Old New}
     case Old of nil then New=nil raise empty end 
     [] H|T then New=T H
     end 
  end 
   
  proc {Pusg C X} Old New  in New=X|Old {Exchange C Old New} end 
   
  fun {Peek C}
     case {Access C} of H|_ then H
     else raise empty end end 
  end 
   
end


%{Show {Tokenize {Lex "1 2 + 3 *"}}}

declare fun {Interpret Tokens} S While in 
  S = {NewStack}


  
  % fun {While Tokens S} A B in
  %   if {List.length Tokens} > 0 then
  %     case Tokens of 
  %       Head | Tail then

  %         case Head of 
  %           number then
  %             {S.push Head}
          
  %           [] operator(type:X) then
  %             A = {S.pop}
  %             B = {S.pop}
  %             {S.push A Head B}            
  %         end
  %         {While Tail S}
  %       [] nil then
  %         S
  %       end
  %     end
  %   end
  % end

  % Operations = record(
  %   operator(type:plus)     : +
  %   operator(type:minus)    : -
  %   operator(type:multiply) : *
  %   operator(type:divide)   : /
  % )


  fun {While Tokens} A B in
    case Tokens of 
      Head | Tail then
        case Head of 
          number then {Push S Head}

          [] operator then
            A = {Pop S}
            B = {Pop S}
            case operator.type 
              of plus     then {Push S A + B}
              [] minus    then {Push S A - B}
              [] multiply then {Push S A * B}
              [] divide   then {Push S A / B}
            end
        end
      {While Tail}
    end
  end

  {While Tokens}
  

end

{Show {Interpret {Tokenize {Lex "1 2 3 +"}}}}