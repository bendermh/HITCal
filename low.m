function y = low(x)
%Filtro de baja frecuencia para HIT dise�ado por Jorge Rey 
s = 0.5;
y = filter(s, [1 s-1], x);


