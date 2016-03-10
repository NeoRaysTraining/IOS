#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    //Defining a short type of val & storing it into storingShortTypeVal Variable
    
    short storingShortTypeVal = -1453;
    
    //Printing the val of storingShortTypeVal variable
    
    NSLog(@"%hd",storingShortTypeVal);

  
   [pool drain];
   
   //Returns 0 to main method
   return 0; 
}
