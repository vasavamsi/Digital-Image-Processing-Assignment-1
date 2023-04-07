%This function is defined for getting the pixelIDList field of the function
function [] = pixelidlist(NumObjects,lab_mat_fin)
for i = 1:NumObjects
    list=[];
    for j = 1:length(lab_mat_fin(:))
        if lab_mat_fin(j)==i
            list = [list j];
        end   
    end
    disp('list of positions for component')
    disp(i)
    disp(list)
end
end