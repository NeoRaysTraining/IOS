#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   NSLog (@"hello world");
   char s1[100] = "She sells sea shells on the sea shore";
   int len = strlen(s1);
   int s=0,e=0,h=0,a=0,l=0,i;
   for( i=0;i<=len;i++)
   {
        if(s1[i] == 's')
        {
            s++;
        }
        else if(s1[i]=='e')
        {
            e++;
        }
        else if(s1[i]=='h')
        {
            h++;
        }
        else if(s1[i]=='a')
        {
            a++;
        }
        else if(s1[i]=='l')
        {
            l++;
        }
    }
    printf("the value of s is %d\n",s);
    printf("the value of e is %d\n",e);
    printf("the value of h is %d\n",h);
    printf("the value of a is %d\n",a);
    printf("the value of l is %d\n",l);
   
   
   
   [pool drain];
   return 0;
}
