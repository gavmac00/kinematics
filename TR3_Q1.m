% (TR3 Q1) Estimate the Rotation Matrix given, init A21, w_G, timestep, time.
% angular velocity must remain unchanged
w_G = [0.1;
         4;
       0.2];

t = 0.01;       % (in seconds)
tstep = 0.005;

A21_t0 = [1 0 0; % sometimes A21_t-1 = [I]
         0 1 0;
         0 0 1];
     
w_L = A21_t0*w_G; %converting w to base 2, does nothing when A21 = [I]

% Eqt: A21dot = -{w_squiggle}^e2[A21]t-1

w_squiggle = [     0  -w_L(3)   w_L(2); % always in base 2
              w_L(3)      0   -w_L(1);
             -w_L(2)  w_L(1)       0];
         
neg_w_sqiggle = -1*w_squiggle;

for i = tstep:tstep:t
    A21dot = neg_w_sqiggle*A21_t0;

    A21_t1 = A21_t0 + A21dot*tstep
    A21_t0 = A21_t1;
end