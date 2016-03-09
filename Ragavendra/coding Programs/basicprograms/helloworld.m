
//write a program to print hello world //

#import <Foundation/Foundation.h>


//main  method starts execution //
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   [pool drain];
   return 0;
}

 Output:hello world