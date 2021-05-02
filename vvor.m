% Jorge Rey Martinez & María Moserrat Soriano 2021 version 2.0
% Run the VVOR and VORS analysis routines
s = 0;

question = questdlg('Do you want to read the data from VVOR or from VVORS (suppressed) test?','Select test to read','VVOR','VORS (suppressed)','VVOR');
if strcmp(question,'VORS (suppressed)')
    s = 1;
end
[t,e,h] = read(s);
if isempty(t)
    disp('No data was loaded');
    return
end
analize(t,e,h,s);
question = questdlg('Do you want to analize saccades?','Extended analysis','YES','NO','NO');
if strcmp(question,'YES')
    saccades(t,e,h,s)
end
if isOctave
   disp('WARNING: OCTAVE results has not been validated, and could be unaccuracy, specially for saccade analysis & PR score') 
end