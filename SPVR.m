global datosojos datoscabeza CC CO
acojo = transpose(250*(low(low(diff(datoscabeza)))));
accel = transpose(acojo);
tdo=transpose(datosojos);
tdc=transpose(datoscabeza);
CC = clusterdata(tdc,'maxclust',4,'linkage','ward');
[num nul] = size(tdc);
reconom = {};
if num < 5
    msgbox('More impulses are needed for cluster analysis', 'ERROR','error');
    return
end

if num > 5
    reconom = '2';
end
if num > 60
    reconom = '8';
end
if num > 5000
    reconom = '16';
end

text = ['You must to choose how much clusters do you want: ' reconom ' clusters are recommended'];
clusters = questdlg(text,'Choose clusters','2','8','16',reconom);
switch clusters
    case '2'
        cl = 2;
    case '8'
        cl = 8;
    case '16'
        cl = 16;
    otherwise
        cl = 4;
end

CO = clusterdata(tdo,'maxclust',cl,'linkage','ward');
if max(CC)>0
    figure('Name','Slow Phase Cluster Analysis: Head','NumberTitle','off','Position',[1 350 1200 360]);
    p = 1;
    while p <= max(CC);
        clus = find (CC==p);
        pp = 1;
        clusp = [];
        cluspt =[];
        [n,nul] = size(clus);
        while pp <= n
            clusp = vertcat(clusp,tdc(clus(pp),:));
            pp = pp + 1;
        end
        subplot (1,max(CC),p)
        n2 = size(clusp);
        hold all
        plot(transpose(clusp),'b');
        xli = plot(quantile(clusp,0.5),'color',[1 0.5 0]);
        xli2 = plot(quantile(clusp,0.1),'--','color',[1 0.5 0]);
        xli3 = plot(quantile(clusp,0.9),'--','color',[1 0.5 0]);
        xli.LineWidth = 3;
        xli2.LineWidth = 1;
        xli3.LineWidth = 1;
        ylim([-50 350])
        xlim ([0 61])
        xlabel('Time in samples')
        ylabel('Velocity in degrees/s')
        text = ['Head Cluster: ' num2str(p) ' (n = ' num2str(n2(1)) ')'];
        title(text);
        p=p+1;
    end
end
if max(CO)>0
    figure('Name','Slow Phase Cluster Analysis: Eye','NumberTitle','off','Position',[1 1 1200 620]);
    p = 1;
    while p <= max(CO);
        clus = find (CO==p);
        pp = 1;
        clusp = [];
        cluspi = [];
        [n,nul] = size(clus);
        while pp <= n
            clusp = vertcat(clusp,tdo(clus(pp),:));
            cluspi = vertcat(cluspi,tdc(clus(pp),:));
            pp = pp + 1;
        end
        subplot (2,(max(CO)/2),p)
        n2 = size(clusp);
        hold all
        plot(transpose(cluspi),'h','color',[0.8 0.8 0.8]);
        plot(transpose(clusp),'color',[1 0.5 0]);
        yli = plot(quantile(clusp,0.5),'b');
        yli2 = plot(quantile(clusp,0.1),'--b');
        yli3 = plot(quantile(clusp,0.9),'--b');
        yli.LineWidth = 3;
        yli2.LineWidth = 1;
        yli3.LineWidth = 1;
        ylim([-50 350])
        xlim ([0 61])
        xlabel('Time in samples')
        ylabel('Velocity in degrees/s')
        text = ['Eye Cluster: ' num2str(p) ' (n = ' num2str(n2(1)) ')'];
        title(text);
        p=p+1;
    end
end
acel = questdlg('Do you want acceleracion plots of eye clusters?','Choose plots','Yes','NO','NO');
if strcmp(acel,'Yes')
    if max(CO)> 0
        figure('Name','Slow Phase Cluster Analysis: Head Acceleration on eye clusters','NumberTitle','off','Position',[1 50 1200 620]);
        p2 = 1;
        while p2 <= max(CO)
            clusa = find (CO==p2);
            pp = 1;
            cluspx = [];
            accelx = [];
            [n3,nul] = size(clusa);
            while pp <= n3
                cluspx = vertcat(cluspx,acojo(clusa(pp),:));
                accelx = horzcat(accelx,accel(:,clusa(pp)));
                pp = pp + 1;
            end
            ppp = 1;
            [null,n4] = size(accelx);
            jerk = [];
            jerkval = [];
            while ppp <= n4
            trace =  find(accelx(:,ppp)> (max(accelx(:,ppp)/2)));
            jerk = horzcat(jerk,trace(1));
            jerkval = vertcat(jerkval,accelx(trace(1),ppp));
            ppp = ppp + 1;
            end
            jerkval = transpose(jerkval);
            subplot (2,(max(CO)/2),p2)
            hold all
            plot(transpose(cluspx),'color',[1 0.5 0]);
            [null,n5] = size(jerk);
            if n4 == n5
            %pjerk = plot(jerk,jerkval,'*','color',[1 0.5 0]);
            end
            zli = plot(quantile(cluspx,0.5),'b');
            zli2 = plot(quantile(cluspx,0.9),'--b');
            zli3 = plot(quantile(cluspx,0.1),'--b');
            if n4 == n5
                jl = line([mean(jerk),mean(jerk)],[mean(jerkval)-2000,mean(jerkval)+2000],'color',[.8 .8 .8],'LineWidth',4,'LineStyle','-');
                text = ['Jerk Constant: ' num2str(round(mean(jerk))) ' samples'];
                legend (jl,text);
                %pjerk = plot(mean(jerk),mean(jerkval),'*b');
            end
            [null,n5] = size(jerk);
            zli.LineWidth = 3;
            zli2.LineWidth = 1;
            zli3.LineWidth = 1;
            ylim([-6000 6000])
            xlim ([0 60])
            xlabel('Time in samples')
            ylabel('Acceleration in degrees/s2')
            text = ['Head acce. in eye cluster: ' num2str(p2) ' (n = ' num2str(n3(1)) ')'];
            title(text);
            p2 = p2 + 1;
        end
    end
end
