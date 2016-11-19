function y = hight(x)
%Filtro de alta frecuencia para HIT diseñado por Jorge Rey 
sr = 250; %samplerate
limit = 0.1; %Cut frecuenz Hz
[b,a] = cheby1(10,1,(limit/(sr/2)),'high');
y = filter(b,a,x);