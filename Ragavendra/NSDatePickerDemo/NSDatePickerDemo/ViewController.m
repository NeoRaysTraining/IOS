//
//  ViewController.m
//  NSDatePickerDemo
//
//  Created by test on 4/11/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getDateButton:(id)sender {

    NSDate *getdate=self.datePicker.date;
    
    NSLog(@"date%@",getdate);
    NSDateFormatter * dateformatter=[[NSDateFormatter alloc]init];


    [dateformatter setDateFormat:@"dd/MM/YYYY"];
    
    NSLog(@"%@",dateformatter);

    self.showDate.text=[NSString stringWithFormat:@"%@",[dateformatter stringFromDate:getdate]];

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Date and Time"
                                                                   message:[dateformatter  stringFromDate:getdate]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];



}




@end
