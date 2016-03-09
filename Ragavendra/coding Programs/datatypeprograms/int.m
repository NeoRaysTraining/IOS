
//int datatype

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");


 // declare int variable 
int anInteger = 10;


//unsigned int range 0 to 65,535 or 0 to 4,294,967,295
unsigned int anUnsignedInteger = 4294967295;
// to print an integer value 
NSLog(@"%d", anInteger);

NSLog(@"unsignednumber:%u", anUnsignedInteger);

   [pool drain];
   return 0;
}

Output:10
unsignednumber:4294967295