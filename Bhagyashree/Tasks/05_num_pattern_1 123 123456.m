#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

/*Objective C program to print the numbers in the pattern shown:  1
																  123
																  123456
																  123456789
																  123456
								                                  123
																  1
*/
  

 //defining the variables
 
   	int i,j,rows;
    
 //initializing the variable row to 10
    
	rows = 10;
    
 //initializing the var i to 0 checking whether its less than rows
   
for(i = 1; i<= rows; i=i+2)
    	
{
    	
	for(j=1;j<= i; ++j)
    	{
    		if(i == 5)
    		{
    			i++;
    		}
    		if(i == 8)
    		{
    		i++;
    		}
    	printf("%d",j);
    	}
    printf("\n");
    }
    
//checks whether i equal to 11

 if(i == 11)
 {
 //defining the variables
    
	int p,q,rowss;
    
 //initializing the variable row to 10

    rowss = 6;
    
 //initializing the var i to 0 checking whether its less than rows

    for(p = 6; p>= rowss; p=p-2)
    {
    for(q=1;q<= p; ++q)
    {
    
    
    printf("%d",q);
    }
    printf("\n");
    
    }
    if(p == 4)
    {


//defining the variables
    
       int m,n,rowsss;
    
 //initializing the variable row to 10
    
	rowsss = 3;
    
 //initializing the var i to 0 checking whether its less than rows
    for(m = 3; m>= rowsss; m=m-2)
    {
    for(n=1;n<= m; ++n)
    {
    
    
    printf("%d",n);
    }
    printf("\n");
    printf("1");
    printf("\n");
    }
    }
   }
    
   
    [pool drain];
   return 0;
   }