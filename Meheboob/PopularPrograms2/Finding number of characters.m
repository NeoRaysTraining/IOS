/*
Program to find Number of Characters present in String

*/


#import <Foundation/Foundation.h>

int main() {
    
    int sLettercount=0,eLettercount=0,hLettercount=0,aLettercount=0,lLettercount=0,i;
    char str[200]="SHE SELLS SEA SHELLS ON THE SEA SHORE";
    
    int length =strlen(str);
    
    for(i=0;i<length;i++)
    {
        
        if(str[i]=='S')
        {
            sLettercount++;
        }
        else if(str[i]=='E')
        {
         eLettercount++;
        }
        else if(str[i]=='H')
        {
            hLettercount++;
        }
       
        else if(str[i]=='A')
        {
            aLettercount++;
        }
       
       else if(str[i]=='L')
        {
            lLettercount++;
        }
    }

       printf("No of S: %d\n",sLettercount);
       printf("No of E: %d\n",eLettercount);
       printf("No of H: %d\n",hLettercount);
       printf("No of A: %d\n",aLettercount);
       printf("No of L: %d\n",lLettercount);
    
   return 0;
}