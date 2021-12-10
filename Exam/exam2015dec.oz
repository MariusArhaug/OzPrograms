local X in
  % Xvar free, Xid bound 
  local Y F in 
    % Yvar, Fvar freee, Yid 
    fun {F X} X * Y end
    % newXid bound, YiD free in in fun, Fvar bound to "fun {..} "

    Y = 3
    % Yvar bound
    Z = X + Y
    % Zid free, from outer space? 
    % Yvar bound 
    % Xvar unbound, will suspend..

    {F Z}
    % Fvar bound, Zvar would have been bound if 
    % reached but not possible. 
  end
end

local LMap in
  fun lazy {LMap Xs F}
    case Xs of 
        nil then nil
      [] X | Xr then {F X}|{LMap Xr F} 
    end
  end

end

local P Unk W in 

  P = person(height: 62 weight: 190 age: Unk)
  W = 55

  case P of building(height: H weight: W age: A)
      then {Browse first#H#W#A}
    [] person(height: H weight: 190)
      then {Browse second#H}
    [] person(height: H weight: W age: A)
      then {Browse third#H#W#A}
    [] person(height: H weight: X age: A)
      then {Browse fourth#H#X#A}
    else {Browse none}
  end

  % Will browse third since it matches the P pattern and W in the case is not the same W as outside the case. scoping. 
  % since it has already matched third it will not reach the fourth case. 

end