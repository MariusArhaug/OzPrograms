declare LazyNumberGenerator in 

  fun {LazyNumberGenerator X}
    X | fun {$} {LazyNumberGenerator X+1} end
  end

  {System.showInfo "{LzyG 0}.1 == 0"}
  {Show {LazyNumberGenerator 0}.1}

  {System.showInfo "{{LzyG 0}.2}.1 == 1"}
  {Show {{LazyNumberGenerator 0}.2}.1}

  {System.showInfo "{{{{{{LzyG 0}.2}.2}.2}.2}.2}.1 == 5"}
  {Show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}