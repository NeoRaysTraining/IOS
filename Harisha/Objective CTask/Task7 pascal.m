/*Problem Defnition
To print the poasacl Triangle 
the out put of the program is foloows
	   1                                                                                                                                                                                              
      1 1                                                                                                                                                                                             
     1 2 1                                                                                                                                                                                            
    1 3 3 1                                                                                                                                                                                           
   1 4 6 4 1                                                                                                                                                                                          
  1 5 10 10 5 1                                                                                                                                                                                       
 1 6 15 20 15 6 1   

 */
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   //Declaring the varaibles
     int x,y,a,z,s;
	 //Declaring varaible n it will print 6 rows
	 int n = 6;
    
    printf("\n\n");
	// s will be the spaces
    s=n;
	//Declaring the for loop for x for 1st row
    for(x=0; x<=n; x++)
    {
        a=1;
		//declaring the for loop for the variable for 2nd row decrementing
        for(z=s; z>=0; z--)
		//print the spaces 
            printf(" ");
		/* s is for printing the space*/
        s--;
		// declaring the for loop for y to print the rows
        for(y=0; y<=x; y++)
        {
			//prints the values 
            printf("%d ",a);
			//logic for pascal triangle
            a=(a*(x-y)/(y+1));
        }
		//move to next line
        printf("\n");
    }
   [pool drain];
   //returns the value 0 to main
   return 0;
}
