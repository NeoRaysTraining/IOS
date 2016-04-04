//
//  ViewController.m
//  LabelDemo
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *employee1,*employee2,*employee3,*employee4,*employee5,*employeeDetails,*employees;
    
    NSMutableDictionary *emp1,*emp2,*emp3,*emp4,*emp5,*employeeDict;
    
    //int i;
}
@end

@implementation ViewController

@synthesize employeeIdLabel,firstNameLable,lastNameLabel,fullNameLabel,designationLabel,mobileNoLabel,placeLabel;
int i=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //creating employee array with NSMutableArray
    employee1=[[NSMutableArray alloc] initWithObjects:@"NR151",@"Bhaskar",@"N S",@"Bhaskar N S",@"Associate Software Trainee",@"9880995143",@"Bangalore", nil];
    employee2=[[NSMutableArray alloc] initWithObjects:@"NR150",@"Harisha",@"K",@"Harisha k",@"Associate Software Trainee",@"8722131314",@"Hassan", nil];
    
    employee3=[[NSMutableArray alloc] initWithObjects:@"NR149",@"Raghavendra",@"D",@"Raghu D",@"Associate Software Trainee",@"9731976134",@"gokak", nil];
    employee4=[[NSMutableArray alloc] initWithObjects:@"NR148",@"Bhagyashree",@"kandakur",@"Bhagyashree k",@"Associate Software Trainee",@"8951732327",@"mudhol", nil];
    employee5=[[NSMutableArray alloc] initWithObjects:@"NR148",@"Mehaboob",@"nadaf",@"mehaboob nadaf k",@"Associate Software Trainee",@"9945678922",@"ghataprabha", nil];
    
    
    //creating keys for an employee array
    employeeDetails=[[NSMutableArray alloc] initWithObjects:@"employeeId",@"firstName",@"lastName",@"Name",@"Designation",@"phoneNo",@"place",nil];
    //NSLog(@"%@",employee1);
    
    
    //creating dictionary with arrays
    emp1=[NSMutableDictionary dictionaryWithObjects:employee1 forKeys:employeeDetails];
    emp2=[NSMutableDictionary dictionaryWithObjects:employee2 forKeys:employeeDetails];
    emp3=[NSMutableDictionary dictionaryWithObjects:employee3 forKeys:employeeDetails];
    emp4=[NSMutableDictionary dictionaryWithObjects:employee4 forKeys:employeeDetails];
    emp5=[NSMutableDictionary dictionaryWithObjects:employee5 forKeys:employeeDetails];
    
    //putting dictionary into mutable array
    employees=[NSMutableArray arrayWithObjects:emp1,emp2,emp3,emp4,emp5, nil];
    
    
//    for(NSMutableDictionary *i in employees)
//    {
//        employeeIdLabel.text=[i objectForKey:@"employeeId"];
//        firstNameLable.text=[i objectForKey:@"firstName"];
//        lastNameLabel.text=[i objectForKey:@"lastName"];
//        fullNameLabel.text=[i objectForKey:@"Name"];
//        designationLabel.text=[i objectForKey:@"Designation"];
//        mobileNoLabel.text=[i objectForKey:@"phoneNo"];
//        placeLabel.text=[i objectForKey:@"place"];
//        break;
//        
//    }
//    //accessing value from array
//     firstNameLable.text=[employee2 objectAtIndex:1];
//    
//    //accessing value form dictionary
//     lastNameLabel.text=[emp2 valueForKey:@"lastName"];
//    
//    //creating dictionary with dictionary
//    employeeDict=[[NSMutableDictionary alloc]initWithObjectsAndKeys:emp1,@"1",emp2,@"2" ,nil];
//    
//    //accessing values from dictionary inside dictionary
//    mobileNoLabel.text=[[employeeDict objectForKey:@"2"] objectForKey:@"phoneNo"];
//    
//    //accessing vaulues from dictinary inside array
//    employeeIdLabel.text=[[employees objectAtIndex:1] objectForKey:@"employeeId"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(id)sender {
    
//    for(NSMutableDictionary *i in employees)
//    {
//        employeeIdLabel.text=[i objectForKey:@"employeeId"];
//        firstNameLable.text=[i objectForKey:@"firstName"];
//        lastNameLabel.text=[i objectForKey:@"lastName"];
//        fullNameLabel.text=[i objectForKey:@"Name"];
//        designationLabel.text=[i objectForKey:@"Designation"];
//        mobileNoLabel.text=[i objectForKey:@"phoneNo"];
//        placeLabel.text=[i objectForKey:@"place"];
//    
//        
//    }
    
    
    
    if(i<employees.count)
    {
        employeeIdLabel.text = [[employees objectAtIndex:i ]objectForKey:@"employeeId"];
        firstNameLable.text=[[employees objectAtIndex:i]objectForKey:@"firstName"];
        lastNameLabel.text=[[employees objectAtIndex:i]objectForKey:@"lastName"];
        fullNameLabel.text=[[employees objectAtIndex:i]objectForKey:@"Name"];
        designationLabel.text=[[employees objectAtIndex:i] objectForKey:@"Designation"];
        mobileNoLabel.text=[[employees objectAtIndex:i] objectForKey:@"phoneNo"];
        placeLabel.text=[[employees objectAtIndex:i] objectForKey:@"place"];
        //i++;
    
    }
    i++;
    if(i==[employees count])
    {
        i=0;
    }
    }
//}
@end
