
declare fun {Lex Input} 
  {String.tokens Input 32}  
end

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


declare fun {Infix Tokens}

  fun {Operation Stack Type} 
    case Stack of A | B | Tail then
      case Type of
           plus     then "("#A#"+"#B#")"|Tail
        [] minus    then "("#A#"-"#B#")"|Tail
        [] multiply then "("#A#"*"#B#")"|Tail
        [] divide   then "("#A#"/"#B#")"|Tail  
      end
    else
      raise "error" end
    end
  end

  fun {Command Stack Type}
    case Stack of Head | Tail then
      case Type of
           flip     then  "-"#Head|Tail end
        [] inverse  then "1/"#Head|Tail end
      end
    else
      raise "error" end
    end
  end

  fun {While Tokens Stack}
    case Tokens of 
      nil then {List.reverse Stack}
      
      [] number(N)|Tail        then {While Tail N|Stack}

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


%{System.show {Infix {Tokenize {Lex "1 2 +"}}}}
%{System.showInfo {Infix {Tokenize {Lex "1 2 +"}}}}
%{Show {Infix {Tokenize {Lex "1 2 +"}}}}