/*Objective C Program to print the number pattern:       1
														121
													   1221
													   12321
													   1221
													   121
													    1
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   //declaring the variables num,r,c,sp
   
    int num,r,c,sp;

   //initializing the variable num
	num = 3;

//for loop to print first half of number pattern

 for(r=1; r<=num; r++)
 {
	//for loop to print the blank space " "
	for(sp=num-r; sp>=1; sp--)
       printf(" ");
	//for loop to print the value of c
   for(c=1; c<=r; c++)
       printf("%d",c);
	//for loop to print the value of c
   for(c=r-1; c>=1; c--)
       printf("%d",c);
   printf("\n");
   if(r == 2)
 {
 printf("1221");
 printf("\n");
 }
 }
  printf("1221");
  printf("\n"); 
  
  //for loop to print second half of number pattern
 for(r=1; r<=num; r++)
 {
	//for loop to print the blank space " "
	for(sp=r; sp>=1; sp--)
       printf(" ");
	//for loop to print the value of c
   for(c=1; c<=(num-r); c++)
       printf("%d",c);
	//for loop to print the value of c
   for(c=num-r-1; c>=1; c--)
       printf("%d",c);
   printf("\n");
   
 }
   [pool drain];
   return 0;
}

