#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   //char variables declaration and displaying the values
   
    char aChar = 'c';
    unsigned char anunsignedchar = 225;
    NSLog(@"%c", aChar);
    NSLog(@"%hhu", anunsignedchar);

   NSLog (@"hello world");
   [pool drain];
   return 0;
}
