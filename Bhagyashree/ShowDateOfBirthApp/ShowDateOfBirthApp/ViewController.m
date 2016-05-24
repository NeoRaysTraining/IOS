//
//  ViewController.m
//  ShowDateOfBirthApp
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dobDisplay;
@property (weak, nonatomic) IBOutlet UILabel *ageDisplay;
@property (weak, nonatomic) IBOutlet UIDatePicker *dobPicker;
@property NSDate *selectedDate;
@property NSDate *diffDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dobButton:(id)sender {
    _selectedDate = self.dobPicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    self.dobDisplay.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:_selectedDate]];

    
}
- (IBAction)ageButton:(id)sender {
    NSInteger age = [self ageFromBirthday:_selectedDate];
    NSString *dateStr = [NSString stringWithFormat:@"%ld",(long)age];
    self.ageDisplay.text=dateStr;
    }

- (NSInteger)ageFromBirthday:(NSDate *)birthdate {
    NSDate *today = [NSDate date];
    NSDateComponents *ageComponents = [[NSCalendar currentCalendar]components:NSYearCalendarUnit
                                       fromDate:_selectedDate
                                       toDate:today
                                       options:0];
    return ageComponents.year;
}





@end
