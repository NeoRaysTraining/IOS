/*problem definition

program to print following pattern

  1                                                                                                                                                                                                           
 123                                                                                                                                                                                                          
12345                                                                                                                                                                                                         
 123                                                                                                                                                                                                          
  1 
  */


#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  //defining and initialing local variables
   int i,j,n=3,s=1;
   
   //assinging s to n-1 
   s=n-1;
   
   //iterating i to n no of rows
    for (i = 1; i <= n; i++)
    {
	
		//iterating j to s no of columns to print spaces
        for (j = 1; j <= s; j++)
		
			//print spaces
            printf(" ");
			
			//decremant s by 1
            s--;
 
		//iterating j 1 to  specified conition
        for (j = 1; j <= 2*i-1; j++)
			 //prints value of j
             printf("%d",j);
             
			 //for new line
            printf("\n");
    }
	
	//initializing s to 1
    s = 1;
 
  //iterating i to n no of rows
  for (i = 1; i <= n - 1; i++)
  {
	//iterating j to s no of columns to print spaces
    for (j = 1; j <= s; j++)
	
	
	  //prints spaces
      printf(" ");
	  
    //incrementing s by 1
    s++;
 
	//iterating j to s no of columns to prints value of j
    for (j = 1 ; j <= 2*(n-i)-1; j++)
      printf("%d",j);
 
    printf("\n");
  }
  
  
   [pool drain];
   //returns o to main
   return 0;
}
