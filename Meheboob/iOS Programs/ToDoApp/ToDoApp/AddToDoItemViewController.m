//
//  AddToDoItemViewController.m
//  ToDoApp
//
//  Created by Mahaboobsab Nadaf on 26/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
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
    
    [self.setTimeField resignFirstResponder];
    
    NSDate *pickerDate = [self.setTimePicker date];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    
    localNotification.fireDate = pickerDate;
    
    
    localNotification.alertBody = self.setTimeField.text;
    localNotification.alertAction = @"Show me the Item";
   // localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication]applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadData" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
