// double datatype

#import <Foundation/Foundation.h>

main method starts execution //
int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

// declare variable  //
   double doub=11e+23;
   printf("the value of double %e ",doub);
   
   [pool drain];
   return 0;
}

Output::
the value of double 1.100000e+24 