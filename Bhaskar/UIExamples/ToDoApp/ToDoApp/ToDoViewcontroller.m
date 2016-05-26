//
//  ToDoViewcontroller.m
//  ToDoApp
//
//  Created by test on 5/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ToDoViewcontroller.h"

@interface ToDoViewcontroller ()
@property (strong, nonatomic) IBOutlet UITextField *itemText;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ToDoViewcontroller
- (IBAction)save:(id)sender {
    NSDate *pickerDate=[self.datePicker date];
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"dd/MM/YYYY HH:MM:ss"];
//    NSDate *pickerDate=formatter
    UILocalNotification *localNotification=[[UILocalNotification alloc]init];
    localNotification.fireDate=pickerDate;
    localNotification.alertBody=_itemText.text;
    localNotification.alertAction=@"show me the item";
    localNotification.timeZone=[NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber=[[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadData" object:self];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)viewDidLoad
{
    
    
    
}

@end
