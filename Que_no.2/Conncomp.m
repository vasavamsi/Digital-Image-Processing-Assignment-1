function[cc] = Conncomp(a,connectivity,b)

lab_mat = binarize(a,b); %function call to binarize the image "a" and setting V intensity matrix as [1].
cur_list=[];   %Assigning equiclass sets as empty arrays to bifurcate the current component and component it has to be converted into.
conv_list=[];

% % Phase-1 of labelling the pixel matrix

lab = 0;     % For first element of the matrix
if member(a(1,1),b)
    lab = lab+1;
    lab_mat(1,1)=lab;
end

for j = 2:length(a(1,:))
    if member(a(1,j),b)
        if member(a(1,j-1),b)
            if lab == 0
                lab = lab+1;
            end
            lab_mat(1,j)=lab;
        else
            lab = lab+1;
            lab_mat(1,j)=lab;
        end
    else
        continue
    end
end   % Labelling first row elements.

lab_mat_fin = label(lab_mat,a,b,connectivity, cur_list, conv_list); %function call for labelling remaing elements using sequential algorithm


% %Phase-2 of labelling using equiclass sets

for k = 1:length(cur_list(:))
    for l = 1:length(lab_mat_fin(:)) 
        if lab_mat_fin(l)==cur_list(k)
            lab_mat_fin(l)=conv_list(k);
        else
            continue
        end
    end
end

lab_mat_fin = num_order(lab_mat_fin); %Function call to arrange the labels in numerical order

%%Displaying the required fields as output

disp('the four fields to be shown are')
disp('connectivity')
connectivity
ImageSize = [length(lab_mat(:,1)) length(lab_mat(1,:))]
NumObjects = max(lab_mat_fin(:))

%To get pixelIdList

disp('PixelIdList:-');
pixelidlist(NumObjects,lab_mat_fin)
imshow(a)
imshow(lab_mat_fin)
end