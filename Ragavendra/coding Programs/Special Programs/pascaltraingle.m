// write a program for print pascal's triangle //

#import <Foundation/Foundation.h>

//main execution starts
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];


//declaring the variables // 
int r, i, k, number=1, j;
		
// how many rows you want to print initialize it
		r=6;
//iterating for loop until the number has been initialized
for(i=0;i<r;i++)
//next for loop it will used to iterate next line after completing one row
for(k=r; k>i; k--)
{
// to go print next line it used
printf(" ");
	}
            number = 1;
            // to print j value //
			for(j=0;j<=i;j++)
			{
				 printf("%d",number);
				 printf(" ");
                 number = number * (i - j) / (j - 1);
			}
			printf("\n");
		}
	

   
   [pool drain];
   return 0;
}

Output:
  1                     
 11
 121
 1331
 14641
 15101051
