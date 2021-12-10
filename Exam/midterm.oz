local A P in

  fun {P X Y} 
    X * Y 
  end

  fun {A L BO I}
    case L 
      of nil then I
      [] H | T then {BO H {A T BO I}}
    end
  end

  {Browse {A [2 3 4] P 1}}
end

local P FoldRight in 

  fun {P X Y} 
    X * Y 
  end

  fun {FoldRight List Null Transform Combine}
    case List of nil then Null
    [] H | T then {Combine {Transform H} {FoldRight T Null Transform Combine}}
    end
  end

  {Browse {FoldRight [2 3 4 5] 1 fun {$ X} X end P}}
end

local ReverseD X in 

  fun {ReverseD Xs} 
    proc {ReverseDF Xs ?Y1 Y}
      case Xs of nil then Y1 = Y
      [] X|Xr then {ReverseDF Xr Y1 X|Y}
      end
    end
    Y1
    in {ReverseDF Xs Y1 nil}
    Y1
  end

  {Browse {ReverseD (1|2|3|4|X)#X}}
end