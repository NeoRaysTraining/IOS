#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    //Defining & initializing an intiger val to anIntegerTypeOfVal variable
    
    int anIntegerTypeOfVal = -1234678353;
    
    //Printing the val of anIntegerTypeOfVal
    
    NSLog(@"%d",anIntegerTypeOfVal);
  
   [pool drain];
   return 0; //Returns 0 to main method
}
