% This function is deifined for arranging the components numerically in
% ascending order.
function [lab_mat_fin] = num_order(lab_mat_fin)
h = 1;
for i = 1:length(lab_mat_fin(:,1))
    for j = 1:length(lab_mat_fin(1,:))
        if lab_mat_fin(i,j) == h
            continue
        elseif lab_mat_fin(i,j) > h+1
            if lab_mat_fin(i,j) == h+1
                h = h+1;
                continue
            else
                k = lab_mat_fin(i,j);
                lab_mat_fin(i,j) = h+2;
                for r = 1 :length(lab_mat_fin(:))
                    if lab_mat_fin(r) == k
                        lab_mat_fin(r) = h+2;
                    end
                end
                h = h+1;
                continue
            end
        end
    end
end
end