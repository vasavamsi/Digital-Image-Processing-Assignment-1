==> Running the code:-

1> Run the test_script
2> the image matrix and V intensity array are predefined in the code itself and can be changed in the script as per user's requirement.
3> Connectivity is user defined input, but available options are 4 and 8.
4> The code will output the Image showing connected components in white with background black, Pixel matrix, V intensity array, connectivity, 
   No. of objects(i.e connected components), PixelIDList.

Note:- Save all the .m files provided in same folder.

==> Functions defined for this problem statement:-

1> Conncomp() - Main function calling remaining functions mentioned below as per requirement of the algorithm.
	input arguments - Image matrix(a), V intensity array(b), connectivity
	output arguments - Connectivity, Image size, No. of objects, PixelIdList.

2> binarize() - To binarize the input Pixel matrix
	input arguments - Image matrix(a), V intensity array(b)
	output argument - lab_mat (Binarized version of Pixel matrix)

3> label() - To label the elements in Phase-1 of the sequential algorithm
	input arguments - lab_mat, Image matrix(a), V intensity array(b), connectivity.
	output arguments - lab_mat_fin (Phase-1 labelled matrix)

4> num_order() - To label the components in numerical order after Phase-2 transformation
	input arguments - lab_mat_fin (Phase-2 labelled matrix) #the lab_mat_fin assigned earlier will be refined through Phase-2 under the same array, 
			  					 no uneccessary stack arrays formed#
	output argument - lab_mat_fin (Final labelled matrix)

5>pixelidlist() - To create list of positions in the Pixel matrix accquired by a connected component.
	input arguments - NumObjects(No. of connected components), lab_mat_fin
	output arguments - arrays including the positions of particular connected commponent.

Comments:-
>> Image is preloaded, the intensity vector is pre defined.
>> Although not neccessary, the connected path image will be displayed after execution with white connected components and black background.
>> In PixelIDList of the inbuilt command bwconncomp(), it will be in struct form, whereas the PixelIDList in the generated code will be in the form of array 
   containing the positions occupied by that particular connected component.
   