==> Running the code:-

1> Run the "test_script.m" file on matlab.
2> Enter the basic details asked.
3> After running the function it will ask for the user input for the image output.
4> For option 1, enter the ranges for foreground and background intensities as per displayed in command window.
5> The output image will be displayed and Image Save tool will be activated.

Note:- Save all the .m files provided in same folder.

==> Functions defined for this problem statement:-

1> create_rectangles() - Main function calling remaining functions mentioned below as per requirement of the algorithm.
	
	input arguments- row of matrix(M), column of matrix(N), border thickness in terms of pixels(bor),
			 start value of width range(w1), End value of width range(w2), width to height ratio alpha(A),
			 orientation array inputs (o1&o2)
	output arguments- Image with the required intensities taken by user.

2> member() - To check whether the element is member of array or not.

	input arguments- any variable(a), any array(b)
	output arguments- y, will assign y = 1,if a lies is the element in array b or else will assign y = 0.

3> intensify() - Will assign the bakground and foreground pixel values as per user input.

	input arguments- Image matrix(I_mat), border thickness in terms of pixels(bor), row of matrix(M), column of matrix(N).
	output arguments- Will return the final image and will activate image save tool. 

==> Comments:-

>> For the orientation input if any one of the element (i.e o1 & o2) is assigned 1 or 2 and other is left empty, then it will 
   consider the same orientation and will be executed in that manner itself
>> For the orientation input if any random inputs are provided in any single element and other is left empty, it will not run entirely.
>> For any random values provided in o1 & o2 both, then it will simply assume the case of executing both verticle and horizontal rectangles.
>> make sure the contents provided will not let the system to run out of memory.
>> Don't leave both the values empty.

i.e for an image size of 255 x 255. If the widths are provided such that 10^9 to 10^10, then there are chances that it may run out of memory,
calling the same function in again again with doubled dimensions in recursion.

