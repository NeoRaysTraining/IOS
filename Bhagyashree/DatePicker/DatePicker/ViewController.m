//
//  ViewController.m
//  DatePicker
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
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
    NSDate *getDate = self.datePicker.date;
    
    NSDateFormatter *formater1 = [[NSDateFormatter alloc]init];
    [formater1 setDateFormat:@"dd/MM/yyyy"];
    
    //DISPLAY DATE IN LABEL
 //   self.displayLabel.text = [NSString stringWithFormat:@"%@",[formater1 stringFromDate:getDate]];
    
    
    //DISPLAY DATE IN ALERT CONTROLLER
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Date" message:[NSString stringWithFormat:@"%@",[formater1 stringFromDate:getDate]]
 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)getTimeButton:(id)sender {
    
    NSDate *getTime = self.datePicker.date;
    
    NSDateFormatter *formater2 =[[NSDateFormatter alloc]init];
    [formater2 setDateFormat:@"hh/mm/ss"];
    
  //  self.displayLabel.text = [NSString stringWithFormat:@"%@",[formater2 stringFromDate:getTime]];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Time" message:[NSString stringWithFormat:@"%@",[formater2 stringFromDate:getTime]]
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
                         
}
@end