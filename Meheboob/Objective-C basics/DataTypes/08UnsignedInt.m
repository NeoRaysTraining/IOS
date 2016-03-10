#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    //defining an unsigned integer val
    unsigned int storingunsignedInt = 136515638;
    
    //Printing the value of storingunsignedInt variable
    
   NSLog (@"%u",storingunsignedInt);
   [pool drain];
   
   //Returns 0 to main method
   return 0;
}
