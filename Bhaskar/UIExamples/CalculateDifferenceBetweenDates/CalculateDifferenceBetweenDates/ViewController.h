//
//  ViewController.h
//  CalculateDifferenceBetweenDates
//
//  Created by test on 4/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *fromLabel;
@property (strong, nonatomic) IBOutlet UILabel *toLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)calculate:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
- (IBAction)didChangeDate:(id)sender;

@end

