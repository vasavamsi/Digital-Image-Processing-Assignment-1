%this function is defined to label all the components using raster scan in
%Phase-1 of the algorithm
function[lab_mat_fin] = label(lab_mat,a,b,connectivity, cur_list, conv_list)                                                        %raster scan i                                                       
% For first element of the matrix                       
lab = 0;
if member(a(1,1),b)
    lab = lab+1;
    lab_mat(1,1)=lab;
end
% As first row elements will depend on their left element only
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
end
% For remaining elements in the matrix for both user defined connectivity.
if connectivity == 4
    for i = 2:length(a(:,1))
    for j = 1:length(a(1,:))
        if ismember(a(i,j),b)
            if j == 1
                if ismember(a(i-1,j),b)
                    lab_mat(i,j)=lab_mat(i-1,j);
                else
                    lab=lab+1;
                    lab_mat(i,j)=lab;
                end
                continue
            end
            if j < length(a(1,:))+1
                if (lab_mat(i-1,j)==0 && lab_mat(i,j-1)==0)
                    lab = lab+1;
                    lab_mat(i,j)=lab;
                elseif ((ismember(a(i-1,j),b) && ~ismember(a(i,j-1),b)) || (~ismember(a(i-1,j),b) && ismember(a(i,j-1),b)) || (lab_mat(i-1,j) == lab_mat(i,j-1)))
                    if lab_mat(i-1,j)==0
                        lab_mat(i,j) = lab_mat(i,j-1);
                    elseif lab_mat(i,j-1)==0
                        lab_mat(i,j) = lab_mat(i-1,j);
                    end
                elseif ((ismember(a(i-1,j),b) && ismember(a(i,j-1),b)) && (lab_mat(i-1,j)~=lab_mat(i,j-1)))
                    lab_mat(i,j) = min(lab_mat(i-1,j), lab_mat(i,j-1));
                    cur_list = [cur_list max(lab_mat(i-1,j), lab_mat(i,j-1))];
                    conv_list = [conv_list min(lab_mat(i-1,j), lab_mat(i,j-1))];
                end
                continue
            end
        end
    end
end
else
    for i = 2:length(a(:,1))
        for j = 1:length(a(1,:))
            if ismember(a(i,j),b)
                if j == 1
                    if ismember(a(i-1,j),b)
                        lab_mat(i,j)=lab_mat(i-1,j);
                    else
                        lab=lab+1;
                        lab_mat(i,j)=lab;
                    end
                    continue
                end
                if j < length(a(1,:))+1
                    if (lab_mat(i-1,j)==0 && lab_mat(i,j-1)==0 && lab_mat(i-1,j-1)==0)
                        lab = lab+1;
                        lab_mat(i,j)=lab;
                    elseif ((ismember(a(i-1,j),b) && ~ismember(a(i,j-1),b) && ~ismember(a(i-1,j-1),b)) || (~ismember(a(i-1,j),b) && ismember(a(i,j-1),b) && ~ismember(a(i-1,j-1),b)) || (~ismember(a(i-1,j),b) && ~ismember(a(i,j-1),b) && ismember(a(i-1,j-1),b)) || (lab_mat(i-1,j) == lab_mat(i,j-1)))
                        if lab_mat(i-1,j)==0 && lab_mat(i-1,j-1)==0
                            lab_mat(i,j) = lab_mat(i,j-1);
                        elseif lab_mat(i,j-1)==0 && lab_mat(i-1,j-1)==0
                            lab_mat(i,j) = lab_mat(i-1,j);
                        elseif lab_mat(i-1,j)==0 && lab_mat(i,j-1)==0
                            lab_mat(i,j) = lab_mat(i-1,j-1);
                        end
                    elseif ((ismember(a(i-1,j),b) && ismember(a(i,j-1),b)) && ismember(a(i-1,j-1),b)) && ((lab_mat(i-1,j)~=lab_mat(i,j-1)) || lab_mat(i,j-1)~=lab_mat(i-1,j-1) || lab_mat(i-1,j-1)~=lab_mat(i-1,j))
                        lab_mat(i,j) = min(min(lab_mat(i-1,j), lab_mat(i,j-1)), lab_mat(i-1,j-1));
                        cur_list = [cur_list max(max(lab_mat(i-1,j), lab_mat(i,j-1)), lab_mat(i-1,j-1))];
                        conv_list = [conv_list min(min(lab_mat(i-1,j), lab_mat(i,j-1)), lab_mat(i-1,j-1))];
                    else
                    continue
                    end
                end
            end
        end
    end
end
lab_mat_fin = lab_mat;
end