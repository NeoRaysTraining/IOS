/*problem definition

program to display following pattern

     1                                                                                                                                                                                                         
    1 1                                                                                                                                                                                                        
   1 2 1                                                                                                                                                                                                       
  1 3 3 1                                                                                                                                                                                                      
 1 4 6 4 1                                                                                                                                                                                                     
1 5 10 10 5 1    

*/

#import <Foundation/Foundation.h>


int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   long factorial(int n)
   {
   int c;
   long result = 1;
 
   for (c = 1; c <= n; c++)
         result = result*c;
 
   return result;
   }
   
   //
    int i, n=6, c;
   for (i = 0; i < n; i++)
   {
      for (c = 0; c <= (n - i - 2); c++)
         printf(" ");
 
      for (c = 0 ; c <= i; c++)
         printf("%ld ",factorial(i)/(factorial(c)*factorial(i-c)));
 
      printf("\n");
    }
   [pool drain];
   return 0;
}



