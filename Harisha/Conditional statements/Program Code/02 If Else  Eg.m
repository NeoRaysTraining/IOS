#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //Declaring int variable
   int year = 2015;
   
   //declaring if to check the year
   if(year == 2015)
   {
        NSLog(@"the color is red %d",year);
    }
    else if(year == 2016)
    {
        NSLog(@"the color will be blue",year);
    }
    
    else {
    NSLog(@"there is no color");
    }
        
   [pool drain];
   return 0;
}
