// write a pgm for relational operators //

#import <Foundation/Foundation.h>

// main method starts execution //
int main()
{
   
   NSLog(@"Hello, World! \n");
   // declare the variables
   int a = 20;
   int b = 10;
  

   // checking for a==b opearation  if both are equal then it will execute if statement//
   if( a == b )
   {
      NSLog(@" a is equal to b\n" );
   }
   else
   {
      NSLog(@" a is not equal to b\n" );
   }
   // checking for a is less than b
   if ( a < b )
   {
      NSLog(@"2 - a is less than b\n" );
   }
   else
   {
      NSLog(@" a is not less than b\n" );
   }
   //checking for a greater than b 
   if ( a > b )
   {
      NSLog(@" a is greater than b\n" );
   }
   else
   {
      NSLog(@" a is not greater than b\n" );
   }
   
   
   return 0;
}