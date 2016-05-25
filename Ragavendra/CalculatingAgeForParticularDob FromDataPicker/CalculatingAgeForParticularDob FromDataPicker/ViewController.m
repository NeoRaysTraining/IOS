//
//  ViewController.m
//  CalculatingAgeForParticularDob FromDataPicker
//
//  Created by test on 5/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *dobDisplaylabel;

@property (weak, nonatomic) IBOutlet UILabel *ageDisplayLabel;


@property NSDate *todayDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
  
    
   
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:_datePicker.date];
    self.dobDisplaylabel.text=strDate;
   
    
    
    
    
    int time = [todayDate timeIntervalSinceDate:[dateFormatter dateFromString:strDate]];
    int allDays = (((time/60)/60)/24);
    int days = allDays%365;
    int years = (allDays-days)/365;
    self.ageDisplayLabel.text=[NSString stringWithFormat:@"%d",years];
    NSLog(@"Your Age  %i years ",years);
}


@end
