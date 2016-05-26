//
//  AddTodoViewController.m
//  LocalNtificationDemo
//
//  Created by test on 5/26/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
[self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)saveButton:(id)sender {
   
    
//UILocalNotification* localNotification = [[UILocalNotification alloc] init];
  //  localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:60];
    //localNotification.alertBody = @"Your alert message";
    //localNotification.timeZone = [NSTimeZone defaultTimeZone];
    //[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

    
    [self.textFiled resignFirstResponder];
    
    // Get the current date
    NSDate *pickerDate = [self.datePicker date];
    
   
    // Schedule the notification
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.textFiled.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber =
    [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    // Request to reload table view data
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
   
    // Dismiss the view controller
    [self dismissViewControllerAnimated:YES completion:nil];}


- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.displayLabel.text = strDate;
}

- (IBAction)cancelButton:(id)sender {
}

@end
