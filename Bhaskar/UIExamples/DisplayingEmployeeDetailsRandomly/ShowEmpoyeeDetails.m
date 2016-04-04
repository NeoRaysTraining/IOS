//
//  ShowEmpoyeeDetails.m
//  DisplayingEmployeeDetailsRandomly
//
//  Created by test on 3/29/16.
//  Copyright © 2016 test. All rights reserved.
//


#import "ShowEmpoyeeDetails.h"
#import "ViewController.h"

@interface ShowEmpoyeeDetails()


@end

@implementation ShowEmpoyeeDetails


-(void)employeeDetails:(int)r
{
    switch (r)
    {
        case 0:
            NSLog(@"first Choice");
            
            break;
        case 1:
            NSLog(@"second Choice");
            break;
        case 2:
            NSLog(@"third Choice");
            break;
        case 3:
            NSLog(@"fourth choice");
            break;
        case 4:
            NSLog(@"fifth choice");
            break;
        default:NSLog(@"invalid choice");
            exit(0);
            
    }
}

@end
