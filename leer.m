% arcchivo *.xml leido con funcion xmlread
% prueba  = 49
% impulso = 77
% impulso 2.0.14 = 89
% Funcion leer xml de v-HIT por Jorge A. Rey Martinez

function [existe, nombre, apellido, cabeza, ojo, lado, ganancia, picocabeza, borrado, tipo] = leer(archivo,prueba,impulso)
try
aa = archivo.getDocumentElement;
bb = aa.getChildNodes;
% Get the first "Entry"'s children
cc = bb.item(1).getChildNodes;

ii = cc.item(7).getChildNodes;
version = char(ii.getTextContent);
if strcmp(version,'2.0.14')
    %para version beta 2 de Nicolas
    impulso = impulso +8;
    %prueba = prueba-2;
end
if strcmp(version,'3.0.42')
    %para version beta 3 de Nicolas
    impulso = impulso + 24;
    prueba = prueba;
end
if strcmp(version,'4.0.37')
    %para version beta 3.5 borrar test oculomotores
    impulso = impulso + 122;
    prueba = prueba;
end

%COMPROVACION DE IDIOMA
cc = bb.item(3).getChildNodes;
ii = cc.item(prueba).getChildNodes;
punto1 = ii.getFirstChild;
gg = ii.getChildNodes;
ff = gg.item(51).getChildNodes;
decimal = char(ff.getTextContent);
hh = gg.item(53).getChildNodes;
separa = char(hh.getTextContent);
if strcmp(version,'4.0.37')
 hh = gg.item(63).getChildNodes;
 %en algunas versiones hh = gg.item(65).getChildNodes;
separa = char(hh.getTextContent);   
end
%if separa ~= ';' || separa ~= ','
%   existe = 3;
%   nombre = 0;
%   apellido = 0;
%   cabeza = 0;
%   ojo = 0;
%   lado = 0;
%   ganancia = 0;
%   picocabeza = 0;
%   borrado = 0;
%   tipo = 0;
%    return
%end
%FIN IDIOMA


a = archivo.getDocumentElement;
b = a.getChildNodes;
% Get the first "Entry"'s children
c = b.item(3).getChildNodes;

i = c.item(9).getChildNodes;
punto1 = i.getFirstChild;
nombre = char(i.getTextContent);

e = c.item(11).getChildNodes;
punto2 = e.getFirstChild;
apellido = char(e.getTextContent);


f = c.item(prueba).getChildNodes;
modulo = char(f.getChildNodes);
if strcmp(modulo,'[VW_HITest: null]') || strcmp(modulo,'[HITest: null]') || strcmp(modulo,'[VW_SHIMPTest: null]')
%Nodo numero de prueba
g = f.getChildNodes;
fr = g.item(69).getChildNodes;
if strcmp(version,'4.0.37')
    %en algunas versiones fr = g.item(81).getChildNodes;
    fr = g.item(79).getChildNodes;
end
%punto25 = fr.getFirstChild;
tipo = char(fr.getTextContent);
h = g.item(impulso).getChildNodes;
if strcmp(h,'[VW_SHIMPVideo: null]')
    tipo = 'SHIMP Lateral';
end
if strcmp(h,'[VW_HIImpulse: null]') || strcmp(h,'[HIImpulse: null]')|| strcmp(h,'[VW_SHIMPImpulse: null]')
%Nodo numero de impulso
i = h.item(5).getChildNodes;
punto3 = i.getFirstChild;
precabeza = char(i.getTextContent);
if strcmp(h,'[VW_SHIMPImpulse: null]')
hh = gg.item(61).getChildNodes;
separa = char(hh.getTextContent);
fr = g.item(77).getChildNodes;
tipo = char(fr.getTextContent);
end
if separa == ';'
precabeza = strrep(precabeza, ';', ' ');
precabeza = strrep(precabeza, ',', '.');
else
  precabeza = strrep(precabeza, ',', ' ');  
end
precabeza = textscan(precabeza,'%f');
cabeza = precabeza{1};

j = h.item(7).getChildNodes;
punto4 = j.getFirstChild;
preojo = char(j.getTextContent);
if separa == ';'
preojo = strrep(preojo, ';', ' ');
preojo = strrep(preojo, ',', '.');
else
    preojo = strrep(preojo, ',', ' ');
end
preojo = textscan(preojo,'%f');
ojo = preojo{1};

k = h.item(9).getChildNodes;
punto5 = k.getFirstChild;
preizquierda = char(k.getTextContent);
if strcmp (preizquierda, 'true')
    lado = 1;
else
    lado = 0;
end
l = h.item(11).getChildNodes;
punto6 = l.getFirstChild;
ganancia = str2num(char(l.getTextContent));

m = h.item(13).getChildNodes;
punto6 = m.getFirstChild;
picocabeza = str2num(char(m.getTextContent));

o = h.item(15).getChildNodes;
punto7 = o.getFirstChild;
preborrado = char(o.getTextContent);
if strcmp (preborrado, 'true')
    borrado = 1;
else
    borrado = 0;
end
    existe = 1;
else
    %Devuelve estos valores del campo video dentro del vhit
    cabeza = 1;
    existe = 1;
    ojo = 1;
    lado = 1;
    ganancia = 1;
    picocabeza = 1;
    borrado = 1;
end
else 
    existe = 2;
end
catch
   existe = 0;
   nombre = 0;
   apellido = 0;
   cabeza = 0;
   ojo = 0;
   lado = 0;
   ganancia = 0;
   picocabeza = 0;
   borrado = 0;
   tipo = 0;
end

