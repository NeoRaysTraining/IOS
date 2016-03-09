#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   int i,a=0,e=0,h=0,l=0,s=0;
   NSLog (@"hello world");
   char str[100]="SHE SELLS SEA SHELLS ON THE SEA SHORE";
   
   NSLog(@"%s",str);
   
   int length=strlen(str);
   
   NSLog(@"length of an str is %d",length);
   
   
   for(i=0;i<length;i++)
   {
        if(str[i]=='S')
        {
            s++;
        }
        else if(str[i]=='H')
        {
            h++;
        }
        else if(str[i]=='E')
        {
            e++;
        }
        else if(str[i]=='A')
        {
            a++;
        }
        else if(str[i]=='L')
        {
            l++;
        }
   }
   NSLog(@"Number of S present in a sentence %d",s);
   NSLog(@"Number of E present in a sentence %d",e);
   NSLog(@"Number of H present in a sentence %d",h);
   NSLog(@"Number of A present in a sentence %d",a);
   NSLog(@"Number of L present in a sentence %d",l);
   return 0;
}
