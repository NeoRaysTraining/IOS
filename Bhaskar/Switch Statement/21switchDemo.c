#include <stdio.h>

int main(void) {
    char course[20]="be";
    char branch[20]="civil";
    int semester=6;
    int marks=35;
    
   /* printf("enter course\n");
    scanf("%s",course);
    printf("%s",course);
    printf("enter branch\n");
    scanf("%s", branch);
    printf("enter semester\n");
    scanf("%d",&semester);*/
    switch(branch[0])
    {
        case 'c':
                    printf("Course: BE \nBranch: CIVIL\n");
                    //int marks=60;
                    calculate(marks);
                    break;
        case 'i':
                    printf("Course: BE \nBranch: IS\n");
                    //int marks=100;
                    calculate(marks);
                    break;
        case 'b':
                    printf("Course: Degree \nBranch: BCA\n");
                    //int marks=100;
                    if(semester>6)
                    {
                        printf("semester should not exceed 6");
                    }
                    else
                    {
                        calculate(marks);
                    }
                    
                    break;
        case 'm':
                    printf("Course: Post Graduation \nBranch: MCA\n");
                    //int marks=100;
                    if(semester>6)
                    {
                        printf("semester should not exceed 6");
                    }
                    else
                    {
                        calculate(marks);
                    }
                    
                    break;
        case 'M':
                    printf("Course: Post Graduation \nBranch: Mtech\n");
                    //int marks=100;
                    if(semester>4)
                    {
                        printf("semester should not exceed 4");
                    }
                    else
                    {
                        calculate(marks);
                    }
                    
                    break;
        defaul:
                    printf("invalid option");
                    break;
                    
        
    }
    
	return 0;
}

void calculate(int marks)
{
    if(marks <= 0)
    {
        printf("please enter valid marks");
    }
    else if(marks > 0 && marks < 40)
    {
        printf("Class: FAIL");
    }
    else if(marks >= 40 && marks < 50)
    {
        printf("Class: PASS");
    }
    else if(marks >= 50 && marks < 60)
    {
        printf("Class: SECOND CLASS");
    }
    else if(marks >=60 && marks < 70)
    {
        printf("Class: FIRST CLASS");
    }
    else if(marks >= 70 && marks <= 100)
    {
        printf("Class : FCD");
    }
    else
    {
        printf("invalid marks");
    }
}
