%avg chord for non-straight wing takes chord function and wingspan

function Cavg = Cavg(b, chord_function)
    syms x;
    Cavg = 2/b*int(chord_function,x,0,b/2);
    %calculates integral--works for constant chords as well 
end