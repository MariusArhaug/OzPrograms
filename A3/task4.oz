declare Quadratic in 

  fun {Quadratic A B C}
    fun {$ X} A*X*X + B*X + C end
  end

  {System.showInfo "f(x)=Ax² + Bx+ C: \nA = 3 B = 2 C = 1 X = 2 => 17"}
  {Show {{Quadratic 3 2 1} 2}}