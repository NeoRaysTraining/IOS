//
//  ViewController.m
//  DOBCalculationDemo
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *dobText;
@property (strong,nonatomic) NSDate *currentDate,*birthDate;
@property (strong, nonatomic) IBOutlet UITextField *ageText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentDate =[[NSDate alloc]init];
    
    //[self.datePicker setHidden:YES];
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.tag==2) {
        [self calculateAge];
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)didChangeDate:(id)sender {
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    _birthDate=self.datePicker.date;
    NSString *dob=[formatter stringFromDate:_birthDate];
    self.dobText.text=dob;
}

-(void)calculateAge
{
    
    
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:_birthDate
                                       toDate:_currentDate
                                       options:0];
    NSInteger age = [ageComponents year];
    self.ageText.text=[NSString stringWithFormat:@"%ld",(long)age];
    
}
@end
