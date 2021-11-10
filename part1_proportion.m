%set initial conditions
x(1)=20;y(1)=40;theta(1)=0;%degree
%set value
theta(1)=theta(1)*pi/180;%rad
v=0.5;
T=0.1;
t(1)=0.1;
err_ki(1)=0;
kp=1;
ky=1.5;
kt=30;
for k=2:5000
    t(k)=k*T;
    err1(k)=0-y(k-1);
    err2(k)=0-theta(k-1);
    err(k)=ky*err1(k)+kt*err2(k);
    err_kp(k)=kp*(ky*err1(k)+kt*err2(k));
    u(k)=err_kp(k);
    if u(k)>pi/6
        u(k)=pi/6;
    end
    if u(k)<-pi/6
        u(k)=-pi/6;
    end
    theta(k)=theta(k-1)+tan(u(k))*T/2.5;
    y(k)=y(k-1)+v*sin(theta(k))*T;
    x(k)=x(k-1)+v*cos(theta(k))*T;
end
theta=180/pi.*theta;
u=180/pi.*u;
%plot result
figure(1)
%plot(out.y_Data1(:,1),out.y_Data1(:,2),'k') %to compare with fuzzy control
hold on
plot(t,y,'g')
refline(0,0);
title('y-t');
xlabel('t/s');
ylabel('y/m');
figure(2)
%plot(out.u_Data1(:,1),out.u_Data1(:,2),'k')
hold on
plot(t,u,'g')
title('u-t');
xlabel('t/s');
ylabel('u/degree');
figure(3)
%plot(out.theta_Data1(:,1),out.theta_Data1(:,2),'k')
hold on
plot(t,theta,'g')
refline(0,0);
title('\theta-t');
xlabel('t/s');
ylabel('\theta/degree');




