#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining & storing an long long type of val
  
  unsigned long long  unsignedlongLongTypeOfVal = 2545456456455534345;
    
    //Printing the value of longLongTypeOfVal variable
    
   NSLog (@"%llu",unsignedlongLongTypeOfVal);
   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
