function [JF] = jitter(f0)
%Algoritmo para el calculo del parametro Jitter para analisis acustico de
%voz, Jorge Rey Martinez 2004
[a b] = size(f0);
c = 2;
N = 0;
if b == 1
    while c <= a
        N = N + (abs(f0(c,1)-f0((c-1),1)));
        c = c +1;
    end
    if N > 0
        JF = (N/(a-1))/(mean(f0(:,1)));
    else
        JF = 0;
    end
else
    JF = 0;
end
