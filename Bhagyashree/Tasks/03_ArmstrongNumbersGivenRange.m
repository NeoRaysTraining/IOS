/*Program to print the armstrong numbers within the range 1-10000 which are:
		
		 1  153  370  371  407

*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];


//declaring the variables digits, cube, scube and initializing the count varaible to 0
  
	int sn,en,i,num,digit,cube,scube,count=0;
  
//initializing the starting number to 1

	sn = 1;
  
//initializing the end number to 10000
  
	en = 10000;
 
//looping the numbers from first number to last number

  for(i=sn;i<=en;i++)
  {
  
//initializing the num variable with the contents of i variable
    
	num = i;
 
//initializing the subcube variable to 0
    
	scube = 0;

//check whether the number is greather than o    
    
	while(num > 0)
    	{

//Applying modulus operator to take last digit of the number
    
	digit = num % 10;

//multiplying the digit for 3 time to take cube of number    
    
	cube = digit * digit * digit;

//Adding the value of cube to subcube variable    
    
	scube = scube + cube;
    
	num = num/10;
	}

//checking the subcube variable is equal to i variable
  
	if(scube == i)
    	{
 
//prints the value of i
    
	printf("\t Armstrong number :");
	printf("\t %d\n",i);

//increment count variable which counts the Armastrong numbers    
    
	count++;
    }
  }  

//print the Armstrong numbers within the range 1-10000
  
	printf("Total number of Armstrong numbers are: %d",count);

   [pool drain];
   return 0;
}
