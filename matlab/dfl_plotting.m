t = out.state.Time;
x = out.state.Data(:,1);
y = out.state.Data(:,2);
z = out.state.Data(:,3);

x_d = out.dtraj.Data(1,:);
y_d = out.dtraj.Data(2,:);
z_d = out.dtraj.Data(3,:);

disp("Plotting system trajectory vs desired trajectory...")

figure;
plot(t,x,"blue",'LineWidth', 1)
xlabel('time t')
ylabel('position x')

figure;
plot(t,y,"magenta",'LineWidth', 1)
xlabel('time t')
ylabel('position y')

figure;
plot(t,z,'black','LineWidth', 1)
xlabel('time t')
ylabel('position z')

figure;
plot3(x,y,z,'green','LineWidth',1)
hold on
plot3(x_d,y_d,z_d,'red','LineWidth',1)
legend('State traj','Desired traj');
xlabel('x')
ylabel('y')
zlabel('z')

