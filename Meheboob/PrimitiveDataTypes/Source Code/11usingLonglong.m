#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining & storing an long long type of val
  
   long long  longLongTypeOfVal = -9223372036854775808;;
    
    //Printing the value of longLongTypeOfVal variable
    
   NSLog (@"%lld",longLongTypeOfVal);
   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
