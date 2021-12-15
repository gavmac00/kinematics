%% 3 Axis Robot End Effector Questions, given: angles, link lengths.

%          ->----->----->
% [A30] = [Ad3]*[Ad2]*[Ad1] (must go in the order from link0 to end effector)

theta = deg2rad(30);
% rotation around Z axis (see base 0-1)
    Ad1(1,1) =  cos(theta); Ad1(1,2) = sin(theta); Ad1(1,3) = 0;
    Ad1(2,1) = -sin(theta); Ad1(2,2) = cos(theta); Ad1(2,3) = 0;
    Ad1(3,1) =           0; Ad1(3,2) =          0; Ad1(3,3) = 1;           

% rotation around y axis (see base 1-2)
theta = deg2rad(45);
    Ad2(1,1) = cos(theta); Ad2(1,2) = 0; Ad2(1,3) = -sin(theta);
    Ad2(2,1) =          0; Ad2(2,2) = 1; Ad2(2,3) =           0;
    Ad2(3,1) = sin(theta); Ad2(3,2) = 0; Ad2(3,3) =  cos(theta);
           
% rotation around x axis (see base 2/3)
theta = deg2rad(0);
    Ad3(1,1) = 1; Ad3(1,2) =           0; Ad3(1,3) =          0;
    Ad3(2,1) = 0; Ad3(2,2) =  cos(theta); Ad3(2,3) = sin(theta);
    Ad3(3,1) = 0; Ad3(3,2) = -sin(theta); Ad3(3,3) = cos(theta);
           
A30 = Ad3*Ad2*Ad1; % A30 is it is a 3 axis robot
A30T = A30.';

% b) R_EO_e0 = R_OA_e0 + R_AB_e0 + R_BC_e0 + R_CD_e0 + R_DE_e0
%    However, rotation of e2 = e3, so we can reduce B-C-D-E to B-E.

%    Thus: R_E0_e0 = R_OA_e0 + R_AB_e0 + R_EB_e0.

link = [ 0.2;  %|A0| 1  (Z)
        0.04;  %|AB| 2 (-Y)
         0.1;  %|BC| 3  (X)
        0.02;  %|CD| 4  (Y)
        0.08]; %|DE| 5  (Z)

R_OA_e0 = [0; 0; link(1)] %already in e0

    R_AB_e1 = [0; -link(2); 0];
    
R_AB_e0 = Ad1.'*R_AB_e1 % always * transpose to get e0/global

    R_BE_e2 = [link(3); link(4); link(5)];
    
R_BE_e0 = A30T*R_BE_e2

R_E0_e0 = R_OA_e0 + R_AB_e0 + R_BE_e0