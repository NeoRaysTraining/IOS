#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   //declaring and assigning values to signed and unsigned variable of short and printing values
   short aShort=-10;
   unsigned short anUnSignedShort=10;
   NSLog(@"value of signed short is %hd",aShort);
   NSLog(@"value of unsigned short is %hu",anUnSignedShort);
   
   
   //declaring assigning values to signed and unsigned integer and printing values
   int aInt=-100;
   unsigned int uInt=100;
   NSLog(@"value of signed int is %d",aInt );
   NSLog(@"value of unsigned int is %u",uInt);
   
   
   //declaring assigning values to signed and unsigned long and printing values
   long sLong=-1234;
   unsigned long uLong=1234;
   NSLog(@"value of signed long is %ld", sLong);
   NSLog(@"value of unsigned long is %lu",uLong );
   
   
   //declaring assigning values to float point variables and printing values(single precision floating point values)
   float afloat=1.5f;
   NSLog(@"value of float is %f", afloat);
   NSLog(@"value of float is %2.2f", afloat);
   
   
   
   //declaring and assinging values to double variables and printing(double precision )
   double doubleDecimal=-000.123;
   NSLog(@" value of double decimal is %e", doubleDecimal);
   
   [pool drain];
   return 0;
}
