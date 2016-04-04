//
//  ViewController.m
//  DisplayingEmployeeDetailsRandomly
//
//  Created by test on 3/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    
    NSMutableArray *employee1,*employee2,*employee3,*employee4,*employee5,*employeeDetails,*employees;
}


@end



@implementation ViewController


@synthesize  employeeIdLabel,firstNameLabel,lastNameLabel,nameLabel,designationLabel,mobileNoLabel,placeLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int r = arc4random_uniform(4);
    //NSLog(@"%d",r);
    
    //creating employee array with NSMutableArray
    employee1=[[NSMutableArray alloc] initWithObjects:@"NR151",@"Bhaskar",@"N S",@"Bhaskar N S",@"Associate Software Trainee",@"9880995143",@"Bangalore", nil];
    employee2=[[NSMutableArray alloc] initWithObjects:@"NR150",@"Harisha",@"K",@"Harisha k",@"Associate Software Trainee",@"8722131314",@"Hassan", nil];
    
    employee3=[[NSMutableArray alloc] initWithObjects:@"NR149",@"Raghavendra",@"D",@"Raghu D",@"Associate Software Trainee",@"9731976134",@"gokak", nil];
    employee4=[[NSMutableArray alloc] initWithObjects:@"NR148",@"Bhagyashree",@"kandakur",@"Bhagyashree k",@"Associate Software Trainee",@"8951732327",@"mudhol", nil];
    employee5=[[NSMutableArray alloc] initWithObjects:@"NR148",@"Mehaboob",@"nadaf",@"mehaboob nadaf k",@"Associate Software Trainee",@"9945678922",@"ghataprabha", nil];
    
    
    
    

    switch (r)
    {
        case 0:
            employeeIdLabel.text=[employee1 objectAtIndex:0];
            firstNameLabel.text=[employee1 objectAtIndex:1];
            lastNameLabel.text=[employee1 objectAtIndex:2];
            nameLabel.text=[employee1 objectAtIndex:3];
            designationLabel.text=[employee1 objectAtIndex:4];
            mobileNoLabel.text=[employee1 objectAtIndex:5];
            placeLabel.text=[employee1 objectAtIndex:6];
            break;
        case 1:
            employeeIdLabel.text=[employee2 objectAtIndex:0];
            firstNameLabel.text=[employee2 objectAtIndex:1];
            lastNameLabel.text=[employee2 objectAtIndex:2];
            nameLabel.text=[employee2 objectAtIndex:3];
            designationLabel.text=[employee2 objectAtIndex:4];
            mobileNoLabel.text=[employee2 objectAtIndex:5];
            placeLabel.text=[employee2 objectAtIndex:6];
            //NSLog(@"second Choice");
            break;
        case 2:
            //NSLog(@"third Choice");
            employeeIdLabel.text=[employee3 objectAtIndex:0];
            firstNameLabel.text=[employee3 objectAtIndex:1];
            lastNameLabel.text=[employee3 objectAtIndex:2];
            nameLabel.text=[employee3 objectAtIndex:3];
            designationLabel.text=[employee3 objectAtIndex:4];
            mobileNoLabel.text=[employee3 objectAtIndex:5];
            placeLabel.text=[employee3 objectAtIndex:6];
            break;
        case 3:
            //NSLog(@"fourth choice");
            employeeIdLabel.text=[employee4 objectAtIndex:0];
            firstNameLabel.text=[employee4 objectAtIndex:1];
            lastNameLabel.text=[employee4 objectAtIndex:2];
            nameLabel.text=[employee4 objectAtIndex:3];
            designationLabel.text=[employee4 objectAtIndex:4];
            mobileNoLabel.text=[employee4 objectAtIndex:5];
            placeLabel.text=[employee4 objectAtIndex:6];
            break;
        case 4:
            //NSLog(@"fifth choice");
            employeeIdLabel.text=[employee5 objectAtIndex:0];
            firstNameLabel.text=[employee5 objectAtIndex:1];
            lastNameLabel.text=[employee5 objectAtIndex:2];
            nameLabel.text=[employee5 objectAtIndex:3];
            designationLabel.text=[employee5 objectAtIndex:4];
            mobileNoLabel.text=[employee5 objectAtIndex:5];
            placeLabel.text=[employee5 objectAtIndex:6];
            break;
        default:NSLog(@"invalid choice");
            exit(0);
            
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
