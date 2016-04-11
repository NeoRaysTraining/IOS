//
//  ViewController.m
//  DatePicker
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *showDate;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)generateDate:(id)sender {
    
    NSDate *date=self.datePicker.date;
    NSDateFormatter *formater=[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"dd/MM/yy"];
    
    
    //displaying in label box
    //self.showDate.text=[NSString stringWithFormat:@"%@",[formater stringFromDate:date]];
    
    //displaying in the alertview using alert controller
    NSString *displayingDate=[NSString stringWithFormat:@"%@",[formater stringFromDate:date]];
    
    [self displayAlertView:displayingDate];
}
- (IBAction)timeButton:(id)sender {
    
    NSDate *date=self.datePicker.date;
    NSDateFormatter *frmat=[[NSDateFormatter alloc]init];
    [frmat setDateFormat:@"HH:mm:ss"];
    NSString *displayDate=[NSString stringWithFormat:@"%@",[frmat stringFromDate:date]];
    //self.showDate.text=[NSString stringWithFormat:@"%@",[frmat stringFromDate:date]];
    
    [self displayAlertView:displayDate];
  }


-(void)displayAlertView:(NSString*)string{
    UIAlertController *alterView=[UIAlertController alertControllerWithTitle:@"Displaying Time" message:string preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [alterView addAction:ok];
    [alterView addAction:cancel];
    
    
    [self presentViewController:alterView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
