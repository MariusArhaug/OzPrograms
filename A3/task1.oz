declare QuadraticEquation R Y1 Y2 Sum RightFold Sum2 Quadratic in

  proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
    if B*B - 4 * A * C < 0 then
      RealSol = false
    else
      RealSol = true
      X1 = {Float.sqrt {Int.toFloat ~1*B + (A * A - 4*A*C)}} / ( 2 * A)
      X2 = {Float.sqrt {Int.toFloat ~1*B - (A * A - 4*A*C)}} / ( 2 * A)
    end 
  end

  % {QuadraticEquation 2 1 ~1 R Y1 Y2}

  % {Show Y1}
  % {Show Y2}
  % {Show R}

  fun {Sum List}
    case List 
      of H | T then {Sum H+T}
      [] nil then 0
    end
  end

  % {Show {Sum [1 2 3]}}

  fun {RightFold List Op U}
    case List 
      of H | T then {RightFold T {Op H T} U}
      [] nil then 0
    end
  end

  fun {Sum2 List} 
    {RightFold List fun {$ X Y} X + Y end 0}
  end

  % fun {Length List}
  %   {RightFold List fun {$ X Y} 1 end 0}
  % end 

  fun {Quadratic A B C}
    fun {$ A B C X} A*A*X + B*X + C end
  end

  {Show {{Quadratic 3 2 1} 2}}

  fun {LazyNumberGenerator X}
    
  end

