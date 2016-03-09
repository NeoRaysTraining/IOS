#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //usage of ternary operators
   int a=10,b=15,c=20,d=50;
   int l1=a>b?a:b;  // checking largest between a and b and storing in l1
   int l2=c>d?c:d;  // checking largest between c and d and storing in l2
   int largeNumber=l1>l2?l1:l2;     //finding the largest between l1 and l2
   NSLog(@"largest of %d %d %d %d  is %d", a,b,c,d,largeNumber);        // finally printing largest number
   [pool drain];
   return 0;
}
