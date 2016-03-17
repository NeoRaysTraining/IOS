#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
    //Defining & initializing Single pricision val to variable
    
    float aFloatingPointVal = 73.956;
    
    NSLog (@"%8.2f",aFloatingPointVal); 
   
   
   [pool drain];
   return 0;
}
