acelcabcab = 250*diff(low(low(low(datoscabeza_cabeza(20:100,:)))));
prejerk = diff(acelcabcab);
[n2,n1] = size(prejerk);
posic = 1;
jerk = [];
while posic <= n1 
jerk = horzcat(jerk,prejerk(:,posic));
posic = posic + 1;
end
jr = plot(mean(transpose((250*(low(low(jerk)))))),'color','blue');
jr.LineWidth = 3;
fig = gca;
fig.XGrid = 'on';
fig.LineWidth = 2;
%Segundo
acelcabcab = 250*diff(low(low(low(datoscabeza_mandibula(20:100,:)))));
prejerk = diff(acelcabcab);
[n2,n1] = size(prejerk);
posic = 1;
jerk = [];
while posic <= n1 
jerk = horzcat(jerk,prejerk(:,posic));
posic = posic + 1;
end
hold all
jrm = plot(mean(transpose((250*(low(low(jerk)))))),'color',[1 0.5 0]);
jrm.LineWidth = 3;
legend ('Hands on head','Hands on mandible');