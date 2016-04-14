//
//  TimeViewController.m
//  TabBarViewController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

@synthesize selectedTime;
@synthesize timePicker;


-(void)viewDidLoad
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString *time=[formatter stringFromDate:self.timePicker.date];
    [self.selectedTime setText:time];
    [self.timePicker addTarget:self action:@selector(TimePickerChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)TimePickerChange:(UIDatePicker *)timePicker
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm:ss"];
    
    NSString *time=[formatter stringFromDate:self.timePicker.date];
    self.selectedTime.text=time;
    
}


@end
