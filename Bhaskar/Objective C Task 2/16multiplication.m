/*
matrix multiplication

A= 1 2 -1
   1 4 7
   2 5 8
   
   A=A*A
*/

#include <stdio.h>

int main()
{
    //declaring array and initializing array
    int a[3][3]={{1,2,-1},{1,4,7},{2,5,8}},b[3][3];
    
    
    //declaring local variables for iteration
   int i,j,k,sum=0;
   
   //printing given matrix
   printf("the given matirx is \n");
   for(i=0;i<3;i++)
   {
    //j forloop is used to iterate with cols
    for(j=0;j<3;j++)
    {
        printf("%d \t",a[i][j]);
    }
    printf("\n");
   }
   
   //code executes multiplication of a matrix
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
   printf("The multiplicaiton of a matrix(3*3) is: \n");
   // i forloop is used to iterate with rows
   for(i=0;i<3;i++)
   {
    //j forloop is used to iterate with cols
    for(j=0;j<3;j++)
    {
        printf("%d \t",b[i][j]);
    }
    printf("\n");
   }
    return 0;
}
