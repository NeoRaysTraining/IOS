#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   int a=10,b=20;
   int sum=a+b;
   int sub=a-b;
   int multiply=a*b;
   float quotient=b/a;
   int rem=a%b;
   NSLog(@"sum of %d + %d = %d",a,b,sum);
   NSLog(@"diffennce of %d - %d = %d",a,b,sub);
   NSLog(@"procuct of %d * %d = %d",a,b,multiply);
   NSLog(@"sum of %d / %d = %f",a,b,quotient);
   NSLog(@"sum of %d % %d = %d",a,b,rem);
   
   
   [pool drain];
   return 0;
}
