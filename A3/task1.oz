declare QuadraticEquation in

  proc {QuadraticEquation A B C ?RealSol ?X1 ?X2} D in
    D = B * B - 4.0 * A * C 
    if D < 0.0 then
      RealSol = false
    else
      RealSol = true
      X1 = (~B - {Sqrt D}) / ( 2.0 * A)
      X2 = (~B - {Sqrt D}) / ( 2.0 * A)
    end 
  end

  local A = 2.0 B = 1.0 C = ~1.0 RealSol X1 X2 in
    {QuadraticEquation A B C RealSol X1 X2}

    {Show RealSol}
    {Show X1}
    {Show X2}
  end 

  local A = 2.0 B = 1.0 C = 2.0 RealSol X1 X2 in
    {QuadraticEquation A B C RealSol X1 X2}

    {Show RealSol}
    {Show X1}
    {Show X2}
  end

  % Procedural abstractions are usefull because:--

  % The difference between a procedure and a function is that a function has to return av value, while a procedure dosen't
  % Under the hood a function is built up from a procedure where the return value is a variable not yet assinged that then gets pointed back to the variable calling the function. 