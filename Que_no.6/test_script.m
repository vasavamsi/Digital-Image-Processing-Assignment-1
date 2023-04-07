clear all
clc
%% Taking inputs from the user.
disp('Enter the asked details')
M = 255;
N = 255;
bor = 3;
n = 5;
w1 = 20;
w2 = 100;
A = 3;
disp('For horizontal and vertical rectangles only enter anyone of o1 & o2 as 1 & 2 respectively')
disp('For both vertical and horizontal rectangles enter both 1 & 2 as the input values o1 & o2 in any order')
disp('For any random inputs in o1 & o2 it will be assumed that both the orientations are required by the user')
o1 = input('orientation array element 1 ')
o2 = input('orientation array element 2 ')
orientation = [o1 o2]

%% Calling the main function.

create_rectangles(M,N,bor,n,w1,w2,A,orientation);

                    
                
        



