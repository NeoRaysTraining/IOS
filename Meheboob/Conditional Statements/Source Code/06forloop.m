#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  //defining & initializing variable temp to 10
 int temp = 10;
 
 //defining & initializing variable i to 0
 int i = 0;
 
 //printing the value of i for 10 times 
 //by incrementing i value to 1 at each time
 for(i = 0; i < temp; i++ )
    {
    NSLog(@"i is looping for %d time ",i);
    }
   [pool drain];
   
   //Returning 0 to main method
   return 0;
}
