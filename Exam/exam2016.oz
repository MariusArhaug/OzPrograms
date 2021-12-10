local Zip in 

  fun {Zip L1 L2} H1 H2 T1 T2 in
    
    if L1 == nil andthen L2 == nil then
      nil
    else
      H1 | T1 = L1
      H2 | T2 = L2
      H1#H2|{Zip T1 T2}
    end
  end

  % Assumes that input only is of same sizes
  {System.show {Zip [1 2 3] [4 5 6]}}

end


local Iterate Generate Map Enumerate FoldLeft in

  fun {Iterate State Final Next}
    if {Final State} then State
    else {Iterate {Next State} Final Next}
    end
  end

  fun {Generate From Next Stop}
    if {Stop From} then
      nil
    else 
      From | {Generate {Next From} Next Stop}
    end
  end

  fun {FoldLeft List Nil Transform Combine}
    Result in 
      {Iterate List#Result 
        fun {$ List#_} List == nil end 
        fun {$ (Head|Tail)#End} NewEnd in
          End = {Transform Head}|NewEnd
          Tail#NewEnd
        end
      } = _#nil
      Result
  end

  fun {Map List Transform}
    case List of nil then nil
    [] H | T then {Transform H} | {Map T Transform}
    end
  end


  fun {Enumerate From To By}
    {Generate From fun {$ Curr} Curr + By end fun {$ Curr} if Curr + By > To then true else false end end} 
  end
  
  
  {System.show {Enumerate 1 10 1}}
  {System.show {Map [1 2 3] fun {$ E} E * 2 end}}
end