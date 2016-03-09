/*proble definition

program to print follwoing pattern

  *                                                                                                                                                                                                           
 ***                                                                                                                                                                                                          
*****                                                                                                                                                                                                         
 ***                                                                                                                                                                                                          
  *   
  
  */
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  NSLog (@"hello world");
  
   //defining and initializing local variabls
   int i,j,n=3,s=1;
   
   //assinging s to n-1 
   s=n-1;
   
   //iterating i to n no of rows
    for (i = 1; i <= n; i++)
    {	
		//iterating j to s no of columns to print spaces
        for (j = 1; j <= s; j++)
		
			//prints spaces
            printf(" ");
			
			//decrement s by 1
            s--;
 
		//iterating j 1 to  specified condtion and prints *
        for (j = 1; j <= 2*i-1; j++)
             printf("*");
             
			// printsnew line
            printf("\n");
    }
	//follwoing code is to print lower part of the triangle
	
	//initializing s to 1
    s = 1;
 
 //iterating i to n-1 rows
  for (i = 1; i <= n - 1; i++)
  {
	//iterating j to s 
    for (j = 1; j <= s; j++)
	
	  //prints spaces
      printf(" ");
 
	//incrementing s by 1
    s++;
 
	////iterating j 1 to  specified condtion and prints *
    for (j = 1 ; j <= 2*(n-i)-1; j++)
      printf("*");
	
	//prints new line
    printf("\n");
  }
  
  
   [pool drain];
   return 0;
}
