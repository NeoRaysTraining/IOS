#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining & storing an long type of val
  
   long longTypeOfVal = -46476432131709874;
    
    //Printing the value of longTypeOfVal variable
    
   NSLog (@"%ld",longTypeOfVal);
   
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
