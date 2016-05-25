//
//  ViewController.h
//  DatePicker
//
//  Created by Mahaboobsab Nadaf on 25/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)getDate:(id)sender;

@end

