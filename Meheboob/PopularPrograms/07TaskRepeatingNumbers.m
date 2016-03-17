/*Objective C Program to print pattern 
   1
  121
 1221
 12321
  121
   1
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   //Defining the local variables
   int num,r,c,sp;
   
 //initializing the local variable num to 3
	num = 3;
 //loop for printing the rows
 for(r=1; r<=num; r++)
 {
 //loop for printing the spaces
   for(sp=num-r; sp>=1; sp--)
       printf(" ");
	   
 //loop for printing the numbers from 1 to less than row
   for(c=1; c<=r; c++)
       printf("%d",c);
 //loop for printing the numbers upto 1
   for(c=r-1; c>=1; c--)
       printf("%d",c);
 //prints new line
   printf("\n");
 //checks row is pointing to 2 row or not  
   if(r == 2)
 {
 //prints the value 1221
 printf("1221");
 //prints new line
 printf("\n");
 }
 }
 
 //prints the value 1221
  printf("1221");
  
  //prints new line
  printf("\n");
  
  //loop for rinting row below
 for(r=1; r<=num; r++)
 {
 //loop for rinting space below
   for(sp=r; sp>=1; sp--)
       printf(" ");
 //loop for printing numbers from less than row	to upto number 
   for(c=1; c<=(num-r); c++)
       printf("%d",c);
 //loop for printing numbers upto 1
   for(c=num-r-1; c>=1; c--)
       printf("%d",c);
 //prints ne line	   
   printf("\n");
   
 }
   [pool drain];
   //returns 0 to main method
   return 0;
}

