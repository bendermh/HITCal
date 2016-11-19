busca = 7;
[nul,num] = size(datosojos);
n = 1;
selecojos = [];
seleccabeza = [];
selecgan = [];
selecpac = {};
while n <= num
    if CO(n) == busca
        selecojos = horzcat(selecojos,datosojos(:,n));
        %selecgan = horzcat(selecgan,datosgan(:,n));
        seleccabeza = horzcat(seleccabeza,datoscabeza(:,n));
        %selecpac = horzcat(selecpac,datospac(n));
    end
    n = n + 1;
end
