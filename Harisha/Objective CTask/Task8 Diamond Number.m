/*
program has to print the followinging output
    1                                                                                                                                                                           
  1 2 1                                                                                                                                                                         
1 2 3 2 1                                                                                                                                                                       
  1 2 1                                                                                                                                                                         
    1    
	*/
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //Declaring the variables to use in the for loop
   int i, j,n=3,s=1;
   //initialisng the value of s to n-1
   s=n-1;
   //declaring the for loop to use in 1st row
    for(i=1;i<=n;i++)
    {
      //declaring the for loop for j to print the spaces
		for(j=n;j>i;j--)
	  //printing the spaces
        printf("  ");
		//declaring for loop to print the values
		for(j=1;j<=i;j++)
		//printing the values of j
          printf("%d ",j);
			for(j=j-2;j>=1;j--)
          printf("%d ",j);
		printf("\n");
    
    }
   // s=1;
   //declaring the for loop for i 
    for(i=n-1;i>=1;i--)
    {
      //declaring for loop to print the spaces
      for(j=n;j>i;j--)
	  //printiing spaces
        printf("  ");
		//declaring for loop for printing values
      for(j=1;j<=i;j++)
	  //printing the value of j
          printf("%d ",j);
      for(j=j-2;j>=1;j--)
		//printing the value of j
          printf("%d ",j);
		  //move to new line
      printf("\n");
    } 
      
   [pool drain];
   //returns 0 to main method
   return 0;
}
