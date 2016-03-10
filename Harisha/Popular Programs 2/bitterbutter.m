#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   NSLog (@"hello world");
   char s1[200] = "betty bought some butter which was bitter so she bought some more butter to make the bitter butter better butter ";
   int len = strlen(s1);
   int b=0,e=0,u=0,r=0,s=0,t=0,h=0,i;
   for( i=0;i<=len;i++)
   {
        if(s1[i] == 'h')
        {
            h++;
        }
        else if(s1[i]=='b')
        {
            b++;
        }
        else if(s1[i]=='e')
        {
            e++;
        }
        else if(s1[i]=='u')
        {
            u++;
        }
        else if(s1[i]=='r')
        {
            r++;
        }
        else if(s1[i]=='t')
        {
            t++;
        }
        else if(s1[i]=='s')
        {
            s++;
        }
    }
    printf("the value of h is %d\n",h);
    printf("the value of b is %d\n",b);
    printf("the value of e is %d\n",e);
    printf("the value of u is %d\n",u);
    printf("the value of r is %d\n",r);
    printf("the value of t is %d\n",t);
    printf("the value of s is %d\n",s);   
   
   
   [pool drain];
   return 0;
}
