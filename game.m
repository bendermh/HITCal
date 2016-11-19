posicion = 1;
[nul,fin] = size(archivos);
respuestas = cell(1,fin);
cuentas = [];
while posicion <= fin
    impulsos = strfind(paciente,archivos(posicion));
    [nul,fin2]=size(impulsos);
    pos = 1;
    L1 = 0;
    L2 = 0;
    R1 = 0;
    R2 = 0;
    respuesta = [];
    while pos <= fin2
        if impulsos{pos} == 1;
          if strcmp(sides{pos},'LEFT')
              if CO(pos) == 1;
                  L1 = L1 + 1;
              else
                  L2 = L2 + 1;
              end
          else
              if CO(pos) == 1;
                  R1 = R1 + 1;
              else
                  R2 = R2 + 1;
              end 
          end
        end
        pos = pos + 1;
    end
   if L2/(L1+L2) > R2/(R1+R2)
       respuesta = 'LEFT';
   elseif R2 < 1
       respuesta = 'UNKNOWN';
   else
       respuesta = 'RIGHT';
   end
    cuentas(posicion,1)= L1;
    cuentas(posicion,2)= L2;
    cuentas(posicion,3)= R1;
    cuentas(posicion,4)= R2;
    respuestas{posicion} = respuesta;
    posicion = posicion + 1;
end