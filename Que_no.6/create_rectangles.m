function [I] = create_rectangles(M,N,bor,n,w1,w2,A,orientation)

%% Creating the ones matrix of required image size and making border pixels 0. 

I_mat = ones(M,N);
for i = 1:bor
    for j = 1:N
        I_mat(i,j)=0;
    end
end
for i = (M-bor+1):M
    for j = 1:N
        I_mat(i,j)=0;
    end
end
for j = 1:bor
    for i = 1:M
        I_mat(i,j)=0;
    end
end
for j = (N-bor+1):N
    for i = 1:M
        I_mat(i,j)=0;
    end
end

%% Generating the arrays for n widths and heights calculated using Alpha and no. of rectangles to be generated.
step = floor((w2-w1)/n); %Calculating the step value to take uniformly distributed n values of widths in the given range by user.
width = [w1]; % Assigning an empty array for the widths.
next_val = w1;

% Filling array with the uniformly distributed widths across the range

for i = 2:n
    next_val = next_val + step;
    width = [width next_val];
end
width

height = []; % Assigning an empty array for the heights corresponding to the widths

% Filling array with the heights corresponding to the widths calculated
% using Alpha(A).

for i = 1:n
    height = [height floor(width(i)*A)];
end
height

%% Taking border element positions into single array
bor_mat = [];
for i = 1:length(I_mat(:))
    if I_mat(i)==0
        bor_mat = [bor_mat i];
    end
end

%% Assigning the 2n random positions from the matrix to take a corner excluding the border pixels.
rand_pos = [];
for j = 1:2*n
    cond = 0;
    while cond==0
        random = ceil((length(I_mat(:)))*rand(1,1)); % Taking a random element from the given range.
        y = member(random,bor_mat); % Checking whether this random position lies in the border area or not.
        if y == 1 % If yes then don't take that particular position and check the same for other random position.
            continue
        else
            rand_pos = [rand_pos random]; % If no then fill it in the rad_pos[].
            cond = 1;
        end
    end
end


%% Creating rectangles according to the orientation provided by the user.
o = 1;
cnt = 0;
rect = 1;
for t = 1:n
    for l = 1:(2*n)
        % Getting (row,col) co-ordinates for the taken random position
        col = 0;
        k = rand_pos(l);
        while k > M
            k = k-M;
            col = col+1;
        end
        row = k;
        if orientation == 1 % If the orientation is 1.  
            if((row+height(rect)) > length(I_mat(:,1))) || ((col+width(rect)) > length(I_mat(1,:))) % Check whether the horizontal rectangle contour from that particular position is exceeding the image dimensions or not.
                continue % If yes then continue to the next random point and repeat same.
            else  % Check whether there is already any a rectangle occupying the contour.
                k = 0;
                for i = row:(row+height(rect))
                    for j = col:(col+width(rect))
                        if I_mat(i,j) == 0
                            k = k+1;
                        end
                    end
                end
                if k > 0 % If yes then move to next random point and repeat the same.
                    continue
                else % else make the pixels in the contour 0.
                    for i = row:(row+height(rect))
                        for j = col:(col+width(rect))
                            I_mat(i,j) = 0;
                        end
                    end
                    rect = rect + 1;
                    cnt = cnt+1; % increase the count of rectangles generated so far.
                end
                if cnt == n % if the rectangles generated are equal to the user input n, then break the loop.
                    break
                end
            end
        elseif orientation == 2 % If the orientation is 2.
            if((row+width(rect)) > (length(I_mat(:,1))) || (col+height(rect)) > (length(I_mat(1,:)))) % Check whether the vertical rectangle contour from that particular position is exceeding the image dimensions or not.
                continue % If yes then continue to the next random point and repeat same.
            else % Check whether there is already any a rectangle occupying the contour.
                k = 0;
                for i = row:(row+width(rect))
                    for j = col:(col+height(rect))
                        if I_mat(i,j) == 0
                            k = k+1;
                        end
                    end
                end
                if k > 0 % If yes then move to next random point and repeat the same.
                    continue
                else % else make the pixels in the contour 0.
                    for i = row:(row+width(rect))
                        for j = col:(col+height(rect))
                            I_mat(i,j) = 0;
                        end
                    end
                    rect = rect + 1;
                    cnt = cnt+1; % increase the count of rectangles generated so far.
                end
                if cnt == n
                    break % if the rectangles generated are equal to the user input n, then break the loop.
                end
            end
        elseif length(orientation(:)) == 2 % If both the orientations are to be required by the user.
            if o == 1 % will start with the horizontal rectangle first and will repeat the same logic to create a rectangle.
                if((row+height(rect)) > (length(I_mat(:,1))) || ((col+width(rect)) > (length(I_mat(1,:))))) 
                    continue
                else
                    k = 0;
                    for i = row:(row+height(rect))
                        for j = col:(col+width(rect))
                            if I_mat(i,j) == 0
                                k = k+1;
                            end
                        end
                    end
                    if k > 0
                        continue
                    else
                        for i = row:(row+height(rect))
                            for j = col:(col+width(rect))
                                I_mat(i,j) = 0;
                            end
                        end
                        rect = rect + 1;
                        cnt = cnt+1;
                    end
                    if cnt == n
                        break
                    end
                end
                o = 2; % It will toggle to generate vertical rectangle and will repeat the same logic to create a rectangle.
            elseif o == 2  
                if((row+width(rect)) > (length(I_mat(:,1))) || ((col+height(rect)) > (length(I_mat(1,:)))))
                    continue
                else
                    k = 0;
                    for i = row:(row+width(rect))
                        for j = col:(col+height(rect))
                            if I_mat(i,j) == 0
                                k = k+1;
                            end
                        end
                    end
                    if k > 0
                        continue
                    else
                        for i = row:(row+width(rect))
                            for j = col:(col+height(rect))
                                I_mat(i,j) = 0;
                            end
                        end
                        rect = rect + 1;
                        cnt = cnt+1;
                    end
                    if cnt == n
                        break
                    end
                end
                o = 1;
            
            end
        end
    end
    if cnt == n 
        break
    end
end

% After generating the rectangles from given inputs, if the count is less
% than what is required the dimensions will be doubled and the main
% function will be called again.
if cnt < n
     M = 2*M;
     N = 2*N;
     create_rectangles(M,N,bor,n,w1,w2,A,orientation);
else

    %% After getting the required no. of non-overlapping rectangles, now the required output will be asked from the user.

    disp('do you want to add intensities to the image');
    intensify_mine( I_mat, bor,M,N); % The function to execute the image display according to the user input.
end
    
        
    


