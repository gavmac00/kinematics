%% Get relative acc vector based off 2 local acc vectors in 2 local bases.
%  relative acc vector between base 2 and base 3 = a3-a2.

A21 = zeros(3,3);

a_L2 = [110;
        -4;
        80];

rotation = input('Rotation in which axis?: ','s');
theta = input('Theta for the second base (degrees, ensure (+/-)!): ');
theta = deg2rad(theta);

if rotation == 'y'
    A21(1,1) = cos(theta); A21(1,2) = 0; A21(1,3) = -sin(theta);
    A21(2,1) =          0; A21(2,2) = 1; A21(2,3) =           0;
    A21(3,1) = sin(theta); A21(3,2) = 0; A21(3,3) =  cos(theta);
end

if rotation == 'x'
    A21(1,1) = 1; A21(1,2) =           0; A21(1,3) =          0;
    A21(2,1) = 0; A21(2,2) =  cos(theta); A21(2,3) = sin(theta);
    A21(3,1) = 0; A21(3,2) = -sin(theta); A21(3,3) = cos(theta);
end

if rotation == 'z'
    A21(1,1) =  cos(theta); A21(1,2) = sin(theta); A21(1,3) = 0;
    A21(2,1) = -sin(theta); A21(2,2) = cos(theta); A21(2,3) = 0;
    A21(3,1) =           0; A21(3,2) =          0; A21(3,3) = 1;
end

A21T = A21.'
a_G1 =A21T*a_L2

%-------

a_L3 = [250;
          5;
         20];

theta = input('Theta for the third base (degrees, ensure (+/-)!): ');
theta = deg2rad(theta);

if rotation == 'y'
    A21(1,1) = cos(theta); A21(1,2) = 0; A21(1,3) = -sin(theta);
    A21(2,1) =          0; A21(2,2) = 1; A21(2,3) =           0;
    A21(3,1) = sin(theta); A21(3,2) = 0; A21(3,3) =  cos(theta);
end

if rotation == 'x'
    A21(1,1) = 1; A21(1,2) =           0; A21(1,3) =          0;
    A21(2,1) = 0; A21(2,2) =  cos(theta); A21(2,3) = sin(theta);
    A21(3,1) = 0; A21(3,2) = -sin(theta); A21(3,3) = cos(theta);
end

if rotation == 'z'
    A21(1,1) =  cos(theta); A21(1,2) = sin(theta); A21(1,3) = 0;
    A21(2,1) = -sin(theta); A21(2,2) = cos(theta); A21(2,3) = 0;
    A21(3,1) =           0; A21(3,2) =          0; A21(3,3) = 1;
end

A21T = A21.'
a_G2 =A21T*a_L3

a_rel = a_G2 - a_G1