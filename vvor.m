s = 0;
question = questdlg('Do you want to read the data from VVOR or from VVORS (suppressed) test?','Select test to read','VVOR','VORS (suppressed)','VVOR');
if strcmp(question,'VORS (suppressed)')
    s = 1;
end
[t,e,h] = read(s);
if isempty(t)
    display('No data was loaded')
    return
end
analize(t,e,h,s);
question = questdlg('Do you want to analize saccades?','Extended analysis','YES','NO','NO');
if strcmp(question,'YES')
saccades(t,e,h,s)   
end
