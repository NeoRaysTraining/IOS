//
//  ViewController.m
//  CalculateDifferenceBetweenDates
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    
@property (nonatomic,strong) NSDate *fromDate,*toDate;


@end

@implementation ViewController

@synthesize fromDate,toDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, MMM d, ''yy"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSString *fromDate=[formatter stringFromDate:self.datePicker.date];
    NSString *toDate=[formatter stringFromDate:self.datePicker.date];
    _fromLabel.text=fromDate;
    _toLabel.text=toDate;
    
    fromDate=self.datePicker.date;
    toDate=self.datePicker.date;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    
    NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags=NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *component=[calender components:unitFlags fromDate:fromDate toDate:toDate options:0];
    long month=[component month];
    long days= [component day];
    self.answerLabel.text=[NSString stringWithFormat:@"Number of months %ld and number of days %ld",month,days];
    
    
}
- (IBAction)didChangeDate:(id)sender {
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"EEE, MMM d, ''yy"];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSString *formatedDate=[formatter stringFromDate:self.datePicker.date];
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            _fromLabel.text=formatedDate;
            fromDate=self.datePicker.date;
            break;
        case 1:
            _toLabel.text=formatedDate;
            toDate=self.datePicker.date;
            break;
        default:
            break;
    }

    
}
@end
