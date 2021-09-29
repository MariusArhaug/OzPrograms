
declare fun {Lex Input} 
  {String.tokens Input 32} % Remove space - ASCII value of 32 
end

% Test
% {Show {Lex "1 2 + 3 *"}}
% Expected: [[49] [50] [43] [51] [42]]

declare fun {Tokenize Lexemes} 
  {List.map Lexemes fun {$X}
    case X 
      of "+" then operator(type:plus)
      [] "-" then operator(type:minus)
      [] "*" then operator(type:multiply)
      [] "/" then operator(type:divide)
      [] "p" then command(print)
      [] "d" then command(duplicate)
      [] "i" then command(flip)
      [] "^" then command(inverse)
    else
      number({String.toFloat X})
    end
  end}
end

% Test
% {Show {Tokenize {Lex "1 2 + 3 *"}}}
% Expected: [number(1) number(2) operator(type:plus) number(3) operator(type:multiply)]
 

declare fun {Interpret Tokens}

  fun {Operation Stack Type} 
    case Stack of number(A) | number(B) | Tail then
      case Type of
           plus     then number(A+B)|Tail
        [] minus    then number(A-B)|Tail
        [] multiply then number(A*B)|Tail
        [] divide   then number(A/B)|Tail  
      end
    else 
      raise "error" end
    end
  end

  fun {Command Stack Type}
    case Stack of number(Head) | Tail then
      case Type of
           print     then {Show {List.reverse Stack}} Stack
        [] duplicate then number(Head)|number(Head)|Tail
        [] flip      then number(~Head)|Tail
        [] inverse   then number(1.0/Head)|Tail
      end
    else
      raise "error" end
    end
  end

  fun {While Tokens Stack}
    case Tokens of 
      nil then {List.reverse Stack}
      
      [] number(N)|Tail        then {While Tail number(N)|Stack}

      [] operator(type:X)|Tail then {While Tail {Operation Stack X}}
      
      [] command(X) | Tail     then {While Tail {Command Stack X}}
      
    else 
      raise 
        "error" 
      end
    end 
  end 
in 
  {While Tokens nil}
end


{Show {Interpret {Tokenize {Lex "1 2 3 +"}}}}
% Expected: [number(1) number(5)]

{Show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
% prints: [number(1) number(2) number(3)]
% Expected: [number(1) number(5)]

{Show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
% Expected: [number(1) number(5) number(5)]

{Show {Interpret {Tokenize {Lex "1 2 3 + i"}}}}
% Expected: [number(1) number(~5)]

{Show {Interpret {Tokenize {Lex "1 2 3 + ^"}}}}
% Expected: [number(1) number(0.2)]

