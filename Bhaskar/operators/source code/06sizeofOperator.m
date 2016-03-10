#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //int a=100;
   NSLog(@"size of int %d", sizeof(int));
   NSLog(@"size of float %d", sizeof(float));
   NSLog(@"size of double %d", sizeof(double));
   NSLog(@"size of long %d", sizeof(long));
   NSLog(@"size of long long %d", sizeof(long long));
   NSLog(@"size of long double %d", sizeof(long double));
   
   [pool drain];
   return 0;
}
