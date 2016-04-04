//
//  ViewController.h
//  LabelDemo
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *employeeIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLable;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *designationLabel;
@property (strong, nonatomic) IBOutlet UILabel *mobileNoLabel;
@property (strong, nonatomic) IBOutlet UILabel *placeLabel;
- (IBAction)nextButton:(id)sender;

@end

