pt=squeeze(pt);
pt1=squeeze(pt1);
pt2=squeeze(pt2);
pt3=squeeze(pt3);
pt4=squeeze(pt4);
pt5=squeeze(pt5);
pt6=squeeze(pt6);
pt7=squeeze(pt7);
pt8=squeeze(pt8);
pt9=squeeze(pt9);

n=sum(pt>ring);
while n>0
    pt(pt>ring)=pt(pt>ring)-ring;
    n=sum(pt>ring);
end
n1=sum(pt1>ring);
while n1>0
    pt1(pt1>ring)=pt1(pt1>ring)-ring;
    n1=sum(pt1>ring);
end
n2=sum(pt2>ring);
while n2>0
    pt2(pt2>ring)=pt2(pt2>ring)-ring;
    n2=sum(pt2>ring);
end
n3=sum(pt3>ring);
while n3>0
    pt3(pt3>ring)=pt3(pt3>ring)-ring;
    n3=sum(pt3>ring);
end
n4=sum(pt4>ring);
while n4>0
    pt4(pt4>ring)=pt4(pt4>ring)-ring;
    n4=sum(pt4>ring);
end
n5=sum(pt5>ring);
while n5>0
    pt5(pt5>ring)=pt5(pt5>ring)-ring;
    n5=sum(pt5>ring);
end
n6=sum(pt6>ring);
while n6>0
    pt6(pt6>ring)=pt6(pt6>ring)-ring;
    n6=sum(pt6>ring);
end
n7=sum(pt7>ring);
while n7>0
    pt7(pt7>ring)=pt7(pt7>ring)-ring;
    n7=sum(pt7>ring);
end
n8=sum(pt8>ring);
while n8>0
    pt8(pt8>ring)=pt8(pt8>ring)-ring;
    n8=sum(pt8>ring);
end
n9=sum(pt9>ring);
while n9>0
    pt9(pt9>ring)=pt9(pt9>ring)-ring;
    n9=sum(pt9>ring);
end
%Merging data into 1 array
data_pt=[pt,pt1,pt2,pt3,pt4,pt5,pt6,pt7,pt8,pt9];
data_vt=[vt,vt1,vt2,vt3,vt4,vt5,vt6,vt7,vt8,vt9];
data_dx=[dx,dx1,dx2,dx3,dx4,dx5,dx6,dx7,dx8,dx9];
data_dv=[dv,dv1,dv2,dv3,dv4,dv5,dv6,dv7,dv8,dv9];
data_a=[a,a2,a3,a4,a5,a6,a7,a8,a9,a10];

data_pt=squeeze(data_pt);
data_vt=squeeze(data_vt);
data_dx=squeeze(data_dx);
data_dv=squeeze(data_dv);
data_a=squeeze(data_a);


check=min(data_dx);
check=min(check)



vmean=mean(data_vt);
vmean_int=mean(vmean(40000:1000000))
% 
sd=std(data_vt);
sd_int=mean(sd(40000:1000000))

figure(1)
plot(ttest,data_pt,'.')
set(gcf,'color','w','position',[10,10,1920,425]);
set(gca,'fontsize', 20);
xlim([200 inf])
xlabel('Time (s)','fontsize', 28,'fontweight','bold')
ylabel('Position (m)','fontsize', 28,'fontweight','bold')

legend('1','2','3','4','5','6','7','8','9','10')
grid on

figure(2)
plot(ttest,data_vt,'LineWidth',2)
set(gcf,'color','w','position',[10,10,1920,425]);
set(gca,'fontsize', 20);
xlim([200 500])
legend('1','2','3','4','5','6','7','8','9','10')
xlabel('Time (s)','fontsize', 28,'fontweight','bold')
ylabel('Velocity (m/s)','fontsize', 28,'fontweight','bold')



figure(3)
plot(ttest,data_dx,'LineWidth',2)
set(gcf,'color','w','position',[10,10,1920,425])
set(gca,'fontsize', 16);
xlim([200 inf])
legend('1','2','3','4','5','6','7','8','9','10')
xlabel('Time (s)','fontsize', 28,'fontweight','bold')
ylabel('Distance(m)','fontsize', 28,'fontweight','bold')
grid on

figure(4)
plot(ttest,data_dv)
set(gcf,'color','w');
set(gca,'fontsize', 16);
legend('1','2','3','4','5','6','7','8','9','10')
title('Relative Velocity to Vehicle Ahead','fontsize', 20)
xlabel('Time (s)','fontsize', 18)
ylabel('Relative Velocity (m/s)','fontsize', 18)
grid on

figure(5)
plot(ttest,data_a)
set(gcf,'color','w');
set(gca,'fontsize', 16);
legend('1','2','3','4','5','6','7','8','9','10')
title('Acceleration','fontsize', 20)
xlabel('Time (s)','fontsize', 18)
ylabel('Acceleration (m/s2)','fontsize', 18)
grid on

% figure(6)
% plot(ttest,Uout,ttest,data_vt(1,:),ttest,data_a(1,:),ttest,da)
% set(gcf,'color','w');
% set(gca,'fontsize', 16);
% legend('Uout','vt','a','da')

figure(7)
plot(ttest,sd,ttest,vmean,'LineWidth',1.5)
set(gcf,'color','w');
set(gca,'fontsize', 16);
xlim([0 11000])
legend('Velocity S.D.','Platoon Mean Velocity','Location','southeast')
set(gcf,'color','w','position',[10,10,1920,425]);
set(gca,'fontsize', 20);
xlabel('Time (s)','fontsize', 28,'fontweight','bold')
ylabel('Velocity (m/s)','fontsize', 28,'fontweight','bold')