#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
    //Defining & initializing Single pricision val to variable
    
    float aFloatingPointVal = 73.97;
    
	//Printing the val of aFloatingPointVal with different senarioes
    NSLog (@"%f",aFloatingPointVal); 
    NSLog (@"%.2f",aFloatingPointVal);
     NSLog (@"%.1f",aFloatingPointVal);
     NSLog (@"%.3f",aFloatingPointVal);
   
   [pool drain];
   return 0;
}
