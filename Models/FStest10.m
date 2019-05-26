%chosen model= Xing 1995= a=C1*dv(t-T)+C2(dx(t-3.43)-Dn(t-T))
%Dn=7+0.5v(t) Dn= safe distance based on vehicle speed
%Discrete time frame = 0.01s
clear all

IV=0; %global initial velocity (m/s)

IP=[117,104,91,78,65,52,39,26,13,0];%Set initial position to vehicles

ring=130; %size of ring(m)

ave=250; %window length of moving average = 1s = 100frames



%RNG for C1,C2,T
C1 = [0.5538,0.6834,0.4035,0.5862,0.5319,0.5901,0.4566,0.5343,0.8578,0.7769] ;%0.17-1.3 
aveC1=mean(C1)

C2_ratio=[0.15,0.12,0.18,0.14, 0.15,0.17,0.12,0.11,0.15,0.2]; %C2 is ~10-20% of C1
C2=C1.*C2_ratio;

T=[36,160,95,73,95,69,71,117,114,115]; %Applied to dv and dn 0.5-2.2
aveT=mean(T)

%Perfect sets of RNG constants
C1=[0.668571650540611,0.505734391442468,0.511990363346558,0.532740104446010,0.361957267040408,0.712570423425208,0.623515243156496,0.537105734466424,0.707123883207618,0.460578686491704];
C2=[0.093600031075686,0.070802814801946,0.092158265402380,0.095893218800282,0.043434872044849,0.106885563513781,0.087292134041909,0.091307974859292,0.120211060145295,0.082904163568507];
T=[82,96,76,78,94,117,83,100,91,111];


dn=2; %gain value for v in Dn
dncons=7; %constant, minimum safe distance
maxa=1;
mina=-3;
maxv=40;


n=size(IP); %number of vehicle sets
I_gap=IP(1)-IP(2)
equil_v=2*I_gap-14


%FS controller
 
% %Short Test
% FStime= [0 220 400 401]; 
% Ut=[0 220 240 260 280 320 400 401 500];
% U= [0  2  2.5 3.0 3.2 3.4 3.4 0  0  ];
% runtime=500

%Long Test
FStime= [0 220 10000 10001];         %FScontroller on off time, [0 1 1 0]
Ut=[0 220 240 260 280 320 400 10000 10001 10002]; %desired speed
U= [0  2  2.5 3.0 3.2 3.4 3.4  4 0 0  ];
runtime=10100

%Low Level Testing
diffscale=100; %frames, 100=1s

Uinit=2.5; 

sim('FS10U.slx'); 
%FS10 is baseline with fucked up low level
%FS10mod is FS with P low level
%FS10lookup is FS with math function low level
%FS10U is internalising U
disp('done')%simtest10 works <3


    