fun {Factorial N} 
  if N == 0:
    1
  else 
    N = N * {Factorial N-1}
    N 
end 