syms fi th psi m I_x I_y I_z T

%J = [cos(th), sin(th);
%    -sin(th), cos(th)];

%J_1 = inv(J);

%J_1 = simplify(J_1);

%th = pi;

%subs(J_1)

J_DFL = [-(cos(psi)*sin(th)*cos(fi) + sin(psi)*sin(fi))/m, -(cos(psi)*sin(th)*sin(fi) + sin(psi)*cos(fi))*(T/(m*I_x)), -(cos(psi)*cos(th)*cos(fi))*(T/(m*I_y)), -(-sin(psi)*sin(th)*cos(fi) + cos(psi)*sin(fi))*(T/(m*I_z));
    -(sin(psi)*sin(th)*cos(fi) - sin(fi)*cos(psi))/m, -(-sin(psi)*sin(th)*sin(fi) - cos(fi)*cos(psi))*(T/(m*I_x)), -(sin(psi)*cos(th)*cos(fi))*(T/(m*I_y)), -(cos(psi)*sin(th)*cos(fi) + sin(psi)*sin(fi))*(T/(m*I_z));
    -cos(th)*cos(fi)/m, (cos(th)*sin(fi))*(T/(m*I_x)), (sin(th)*cos(fi))*(T/(m*I_y)), 0;
    0, 0, 0, 1/I_z];

J_DFL_1 = inv(J_DFL);

disp("Inverse of the Jacobian J to be used in controlling a quadrotor through DFL is:")
simplify(J_DFL_1)

disp("Verifying that the product with J is the identity:")
simplify(J_DFL * J_DFL_1)