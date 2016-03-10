#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //Declaring int variable
   int year = 2015;
   
   //declaring if to check the year
   if(year <= 2015)
   {
        NSLog(@"the given year is over %d",year);
    }
    else
    {
        NSLog(@"the given year is %d",year);
    }
        
   [pool drain];
   return 0;
}
