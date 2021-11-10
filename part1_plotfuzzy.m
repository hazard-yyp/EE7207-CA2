%run fuzzy control.slx in simulink first
figure(1)
plot(out.y_Data1(:,1),out.y_Data1(:,2),'k');
refline(0,0);
title('y-t');xlabel('t/s');ylabel('y/m');
figure(2)
plot(out.u_Data1(:,1),out.u_Data1(:,2),'k');
title('u-t');xlabel('t/s');ylabel('u/degree');
figure(3)
plot(out.theta_Data1(:,1),out.theta_Data1(:,2),'k');
refline(0,0);
title('\theta-t');xlabel('t/s');ylabel('\theta/degree');