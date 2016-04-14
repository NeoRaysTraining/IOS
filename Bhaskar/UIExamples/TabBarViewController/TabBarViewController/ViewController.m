//
//  ViewController.m
//  TabBarViewController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerName;
@property (strong, nonatomic) IBOutlet UILabel *displayDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.datePickerName.tintColor=[UIColor whiteColor];
    
    NSDate *todaysdate=[[NSDate alloc]init];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate=[formatter stringFromDate:todaysdate];
    _displayDateLabel.text=[NSString stringWithFormat:@"%@",strDate];
    
    [self.datePickerName addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    

}

-(void)dateChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *frmtr=[[NSDateFormatter alloc]init];
    
    [frmtr setDateFormat:@"dd/MM/yyyy"];
    
    NSString *changedDate=[frmtr stringFromDate:self.datePickerName.date];
    
    self.displayDateLabel.text=changedDate;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
