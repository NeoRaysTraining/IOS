#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defing and initializing the initialzeUnsignedChar to 123
  unsigned char initialzeUnsignedChar = 123;
  
  //Printing the unsigned initialzeUnsignedChar variable
  NSLog(@"%hhu",initialzeUnsignedChar);
  
   [pool drain];
   
   //Returns 0 to main method
   return 0; 
}
