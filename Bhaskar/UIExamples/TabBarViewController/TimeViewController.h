//
//  TimeViewController.h
//  TabBarViewController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet UILabel *selectedTime;

-(void)TimePickerChange:(UIDatePicker *) timePicker;
@end
