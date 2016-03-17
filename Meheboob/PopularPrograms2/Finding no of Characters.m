
/*
Program to find Number of Characters present in String

*/

#import <Foundation/Foundation.h>

int main() {
    
    int HLettercount=0,BLettercount=0,ULettercount=0,TLettercount=0,ELettercount=0,RLettercount,i,SLettercount;
    char str[200]="BETTY BOUGHT SOME BUTTER WHICH WAS BITTER SO SHE BOUGHT SOME MORE BUTTER TO MAKE THE BITTER BUTTER BETTER BUTTER";
    
    int length =strlen(str);
    
    for(i=0;i<length;i++)
    {
        
        if(str[i]=='H')
        {
            HLettercount++;
        }
        else if(str[i]=='B')
        {
         BLettercount++;
        }
        else if(str[i]=='U')
        {
            ULettercount++;
        }
       
        else if(str[i]=='T')
        {
            TLettercount++;
        }
       
       else if(str[i]=='E')
        {
            ELettercount++;
        }
        
        else if(str[i]=='R')
        {
            RLettercount++;
        }
        else if(str[i]=='S')
        {
            SLettercount++;
        }
    }

       printf("No of H: %d\n",HLettercount);
       printf("No of B: %d\n",BLettercount);
       printf("No of U: %d\n",ULettercount);
       printf("No of T: %d\n",TLettercount);
       printf("No of E: %d\n",ELettercount);
        printf("No of R: %d\n",RLettercount);
         printf("No of S: %d\n",SLettercount);
    
   return 0;
}