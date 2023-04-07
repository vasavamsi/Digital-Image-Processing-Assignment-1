function [] = intensify_mine(I_mat, bor,M,N)
disp('Press 1 if "Yes" & press 2 if "No" any other input will be considered as "No"');
dec = input('Enter the choice') % Taking input from the user regarding image output.
if dec == 1 % If user chooses to add intensities in foreground and background.
    % Taking the range of foreground and background intensities with step
    % values.
    disp('Enter range for foreground intensities ');
    start_val_Vf = input('start value ');
    step_Vf = input('step size of the range ');
    end_val_Vf = input('End value ');
    disp('Enter range for background intensities ');
    start_val_Vb = input('start value ');
    step_Vb = input('step size of the range ');
    end_val_Vb = input('End value ');
    pix_val_Vb = start_val_Vb; % Assigning the varible with first element in range of background pixels.
    pix_val_Vf = start_val_Vf; % Assigning the varible with first element in range of foreground pixels.
    for i = bor+1 : M-bor % Loop to change the values of background and foreground pixels in the image with the unformly distriibuted values in the range provided by the user.
        for j = bor+1 : N-bor
            if I_mat(i,j)== 1
                if pix_val_Vb < end_val_Vb+1
                    I_mat(i,j) = pix_val_Vb;
                    pix_val_Vb = pix_val_Vb+step_Vb;
                else
                    pix_val_Vb = start_val_Vb;
                    I_mat(i,j) = pix_val_Vb;
                    pix_val_Vb = pix_val_Vb+step_Vb;
                end
            else
                if pix_val_Vf < end_val_Vf+1
                    I_mat(i,j) = pix_val_Vf;
                    pix_val_Vf = pix_val_Vf+step_Vb;
                else
                    pix_val_Vf = start_val_Vf;
                    I_mat(i,j) = pix_val_Vf;
                    pix_val_Vf = pix_val_Vf+step_Vf;
                end
            end
        end
    end
    imshow(uint8(I_mat)) % Displaying image.
    imsave % saving image.
    
elseif dec==2 % If user wants simple white bacjground with black coloured rectangles.
    I = mat2gray(I_mat, [0 1]); %Converting the final matrix into gray image.
    figure
    imshow(I) % Displaying image.
    imsave % saving image.
else
    disp('Please enter the valid input');
    intensify_mine(I_mat, bor,M,N);
end
