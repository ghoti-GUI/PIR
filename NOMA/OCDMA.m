clear; clc;

addpath(genpath('Blocks'));

%% encode
% y is the signal superimposed
% h is codewords
% s is the signal init, used to check the correction of signal decoded;

nbr_users = 10; % number of users
[y, h, s] = encode(nbr_users, "Withnoise"); 


%% decode
sign_decoded = decode(y, h, nbr_users); 

%% check the signal decoded is correct
check_signal(sign_decoded, s);




