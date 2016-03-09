#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

   NSLog (@"hello world");
   
   //declaring array and initializing array
    int a[3][3]={{1,2,-1},{1,4,7},{2,5,8}},b[3][3],c[3][3],result[3][3];
    int identity[3][3]={{1,0,0},{0,1,0},{0,0,1}};
    
    //declaring local variables for iteration
   int i,j,k,sum=0;
   
   //computing for 2*A matrix
   for(i=0;i<3;i++)
   {
    //j forloop is used to iterate with cols
    for(j=0;j<3;j++)
    {
        c[i][j]=2*a[i][j];
    }
   }
   
   //computing A*A martrix
   for(i=0;i<3;i++)
   {
        for(j=0;j<3;j++)      
        {
            for(k=0;k<3;k++)
            {
                b[i][j]=sum+a[i][j]*a[j][k];
            }
        }
   }
   //computing A*A-2A+I
   for(i=0;i<3;i++)
   {
        for(j=0;j<3;j++)      
        {
            
                result[i][j]=b[i][j]-c[i][j]+identity[i][j];
        }
   }
    printf("The resultant of a matrix(3*3) is: \n");
   // i forloop is used to iterate with rows
   for(i=0;i<3;i++)
   {
    //j forloop is used to iterate with cols
    for(j=0;j<3;j++)
    {
        printf("%d \t",result[i][j]);
    }
    printf("\n");
   }
   
   return 0;
}
