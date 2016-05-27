//
//  ViewController2.m
//  ToDoLocalNotificationApp
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "AppDelegate.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;
@property (nonatomic,strong)NSMutableString *itemEntered;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveAction:(id)sender {
//    self.itemEntered = self.itemTextField.text;
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    [app setStrVlaue:_itemEntered];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.itemTextField resignFirstResponder];
    NSDate *pickerDate = [self.datePickerOutlet date];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.itemTextField.text;
    localNotification.alertAction = @"Show me the item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication]applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadData" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
