/*problem statement:
BETTY BOUGHT SOME BUTTER WHICH WAS BITTER SO SHE BOUGHT SOME MORE BUTTER TO MAKE THE BITER BUTTER BETTER BUTTER
count the number of repeated characters in the sentence
*/

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   int i,b=0,e=0,u=0,r=0,t=0,h=0,s=0;
   NSLog (@"hello world");
   
   //declaring variable str of arry of characters
   char str[100]="BETTY BOUGHT SOME BUTTER WHICH WAS BITTER SO SHE BOUGHT SOME MORE BUTTER TO MAKE THE BITER BUTTER BETTER BUTTER";
   
   //finding length of str
   int length=strlen(str);
   
   //displaying str and length of str
   NSLog(@"%s",str);
   NSLog(@"length of an str is %d",length);
   
   //iterating i from 0 to length to calculate duplicates
   for(i=0;i<length;i++)
   {
        if(str[i]=='B')
        {
            b++;
        }
        else if(str[i]=='E')
        {
            e++;
        }
        else if(str[i]=='U')
        {
            u++;
        }
        else if(str[i]=='R')
        {
            r++;
        }
        else if(str[i]=='S')
        {
            s++;
        }
        else if(str[i]=='T')
        {
            t++;
        }
   }
   
   //printing count of each characters
   NSLog(@"Number of B present in a sentence %d",b);
   NSLog(@"Number of E present in a sentence %d",e);
   NSLog(@"Number of U present in a sentence %d",u);
   NSLog(@"Number of R present in a sentence %d",r);
   NSLog(@"Number of S present in a sentence %d",s);
   NSLog(@"Number of T present in a sentence %d",t);
   NSLog(@"Number of H present in a sentence %d",h);
   return 0;
}
