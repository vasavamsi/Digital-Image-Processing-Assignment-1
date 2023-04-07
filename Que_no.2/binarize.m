function [lab_mat] = binarize(a,b) %This function is for the binarization of the Pixel matrix
lab_mat = zeros(length(a(:,1)),length(a(1,:))); %Putting all the elements as zeroes and rewriting them as one if
for i = 1:length(a(:))                          %those pixels exist in intensity matrix b.
    if member(a(i),b)
        lab_mat(i) = 1;
    else
        lab_mat(i) = 0;
    end
end
b = [1];
end