//
//  DatePickerViewController.m
//  PickerAndTabBarDemo
//
//  Created by test on 8/4/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSDate *now=[NSDate date];
    [self.datePickerOutlet setDate:now animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showDate:(id)sender {
    
    NSDate *selectedDate=[self.datePickerOutlet date];
    NSString *message=[NSString stringWithFormat:@"%@",selectedDate];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"selected Date and Time" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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
