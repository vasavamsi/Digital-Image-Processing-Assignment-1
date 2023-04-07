clear all
clc
a = imread('liftingbody.png');
b = [145 : 155]; %intensty vector V
prompt = 'connectivity from 4 or 8 =';
connectivity = input(prompt) %Taking mode of connectivity from the user.
tic
Conncomp(a, connectivity, b) %Calling the main function.
toc

tic
bwconncomp(a,connectivity) %Using inbuilt function.
toc
