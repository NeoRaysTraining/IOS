#import <Foundation/Foundation.h>



int main (int argc, const char * argv[])
{
   

NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

 
//defining & initializing Boolean type data tye
BOOL checkBooleanOrNot = NO;    
  
  
//Printing the val of checkBooleanOrNot variable using ternary operator
NSLog(@"%@", checkBooleanOrNot ? @"YES" : @"NO"); 
  

[pool drain];
 
//Returns 0 to main method
  return 0;


}
