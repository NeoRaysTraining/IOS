//
//  ViewController.m
//  DatePicker
//
//  Created by Mahaboobsab Nadaf on 25/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)getDate:(id)sender {
    
    //getting date from date picker assigning in var myChoosenDate
    NSDate *myChoosenDate = self.datePicker.date;
    
    [_datePicker date];
    
    //Creating instance of an date formatter
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    //Setting Date format
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    //Assigning date in date label
    self.dateOfBirthLabel.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:myChoosenDate]];
    
    self.ageLabel.text = [self ageFromBirthDate:self.dateOfBirthLabel.text];
}

- (NSString *) ageFromBirthDate:(NSString *)birthDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *myDate = [dateFormatter dateFromString: birthDate];
    
    return [NSString stringWithFormat:@"Age : %ld", (long)[[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:myDate toDate:[NSDate date] options:0] year]];
}@end
