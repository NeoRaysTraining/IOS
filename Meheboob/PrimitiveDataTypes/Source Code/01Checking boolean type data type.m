#import <Foundation/Foundation.h>


int main (int argc, const char * argv[])
{
  
 NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  //defining & initializing Boolean type data tye
  BOOL checkBooleanOrNot = YES;   
 
 //Printing the val of checkBooleanOrNot variable
  NSLog(@"%d", checkBooleanOrNot); 
   
  
 [pool drain];
 
 //Returns 0 to main method
  return 0;
}
