#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //declaring the character variable
   char achar = 'a';
   //printing the value of achar variable
   NSLog(@"the value of achar is %c",achar);
   //printing the ascii value of a
   NSLog(@"the ascii value of a is %hhd",achar);
   
   //unsigned char
   
   //declaring unsigned char variable
   unsigned char uchar = 255;
   
   //printing yhe value of unsigned character variable
   NSLog(@"the value of unsigned char is %hhu",uchar);
   [pool drain];
   return 0;
}
