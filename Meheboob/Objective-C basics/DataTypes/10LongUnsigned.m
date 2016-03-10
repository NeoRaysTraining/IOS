#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining & storing an unsigned long type of val
  
   long unsignedLongTypeOfVal = 5354365464764321317;
    
    //Printing the value of longTypeOfVal variable
    
   NSLog (@"%lu",unsignedLongTypeOfVal);
   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
