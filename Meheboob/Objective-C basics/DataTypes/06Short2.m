#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    //Defing an unsigned short type of val & storing it into storingShortTypeVal Variable
    
   unsigned short storingShortTypeVal = 1234;
    
    //Printing the val of storingShortTypeVal variable
    
    NSLog(@"%hu",storingShortTypeVal);

  
   [pool drain];
   return 0; //Returns 0 to main method
}
