#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   //printing the values less than 10 using for loop
   
   
   int i;                   //declaring i
   for(i=0;i<10;i++)
   {
   NSLog(@"values are:", i);
   }
   
   
   //printing the values in reverse order
   
   int j;
   for(j=5;j>0;j++)
   {
   NSLog(@"values are:", j)
   }
   
   //inner for loop
   
 /*  int p;
   int q;
  
   for(p=0;p<4;p++)
   {
   forq=1;q<2;q++)
   {
   NSLog(@"value of q :", q);
   NSLog(@"value of p :", p);
   }
   } */
   
   [pool drain];
   return 0;
}
