#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
  
  NSLog(@"size of short is %d",sizeof(short));
  
  NSLog(@"Size of int is %d",sizeof(int)); 
  
  NSLog(@"size of boolean %d",sizeof(BOOL));
  
  NSLog(@"size of float is %d",sizeof(float));
  
  NSLog(@"size of long is %d",sizeof(long));
  
  NSLog(@"size of double is %d",sizeof(double));
  
  NSLog(@"size of long long is %d",sizeof(long long));
   [pool drain];
   return 0;
}
