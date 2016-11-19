directorio = uigetdir;
sides = {};
tiempo = [];
cabeza = [];
ojo = [];
ojo_sinsac = [];
paciente = {};
sidesr = {};
tiempor = [];
cabezar = [];
ojor = [];
ojor_sinsac = [];
pacienter = {};
pat = cd;
exito = 0;
if not(directorio == 0)
    lista_archivos = strsplit(ls(directorio));
    archivos = sort(lista_archivos);
    archivos(1) = [];
    exito = 1;
    cd(directorio);
    [nul,numlist] = size(archivos);
    posicion = 1;
    impulso = 0;
    prog=waitbar(0,'Importing files...');
    while posicion <= numlist
        try
            [file_num,file_txt] = xlsread(char(archivos(posicion)));
        catch
            close(prog);
            cd(pat);
            exito = 0;
            posicion = numlist;
            msgbox('Error importing XLS files!', 'ERROR','error');
            return
        end
        leer = 1;
        [tama nul] = size(file_num);
        while leer <= tama
            if isnan(file_num(leer,2))
                sides = horzcat(sides,file_txt(leer,3));
                impulso = impulso + 1;
                leer = leer + 1;
                escribir = 1;
            else
                tiempo(escribir,impulso) = file_num(leer,1);
                cabeza(escribir,impulso) = file_num(leer,2);
                ojo(escribir,impulso) = file_num(leer,3);
                ojo_sinsac(escribir,impulso) = file_num(leer,4);
                paciente(impulso) = archivos(posicion);
                escribir = escribir + 1;
            end
            leer = leer + 1;
        end
        posicion = posicion + 1;
        waitbar(posicion/numlist);
    end
end
try
    close(prog);
end

cd(pat);
if exito == 1
    text = [num2str(posicion-1) ' files were imported. Do you want to import both sides?'];
    alerta = questdlg(text, 'Imported options', 'Left','Right','Both','Both');
    if strcmp(alerta,'Left')
        match = strfind(sides, 'LEFT');
        [nul val] = size(match);
        pos = 1;
        esc = 1;
        while pos <=val
            if not(isempty(match{pos}));
                tiempor(:,esc) = tiempo(:,pos);
                cabezar(:,esc) = cabeza(:,pos);
                ojor(:,esc) = ojo(:,pos);
                ojor_sinsac(:,esc) = ojo_sinsac(:,pos);
                sidesr(esc)= sides(pos);
                pacienter(esc)=paciente(pos);
                esc = esc + 1;
            end
            pos = pos + 1;
        end
        tiempo = tiempor;
        cabeza = cabezar;
        ojo = ojor;
        ojo_sinsac = ojor_sinsac;
        sides = sidesr;
        paciente = pacienter;
    end
    if strcmp(alerta,'Right')
        match = strfind(sides, 'RIGHT');
        [nul val] = size(match);
        pos = 1;
        esc = 1;
        while pos <=val
            if not(isempty(match{pos}));
                tiempor(:,esc) = tiempo(:,pos);
                cabezar(:,esc) = cabeza(:,pos);
                ojor(:,esc) = ojo(:,pos);
                ojor_sinsac(:,esc) = ojo_sinsac(:,pos);
                sidesr(esc)= sides(pos);
                pacienter(esc)=paciente(pos);
                esc = esc + 1;
            end
            pos = pos + 1;
        end
        tiempo = tiempor;
        cabeza = cabezar;
        ojo = ojor;
        ojo_sinsac = ojor_sinsac;
        sides = sidesr;
        paciente = pacienter;
    end
    [archivo,directorio] = uiputfile('*.mat','Save imported data to file','imported.mat');
    if archivo == 0
        return
    end
    save([directorio archivo],'ojo','cabeza','tiempo','ojo_sinsac','sides','archivos','paciente');
end