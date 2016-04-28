//
//  ViewController.h
//  AcceptingUserDetailsDemo
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>


@property (strong,nonatomic) NSString *name,*age,*gender,*country;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *ageText;
@property (strong, nonatomic) IBOutlet UITextField *genderText;
@property (strong, nonatomic) IBOutlet UITextField *countryText;
@property (strong, nonatomic) IBOutlet UIPickerView *customPickerView;

@property (strong,nonatomic) NSArray *genderArray;
@property (strong,nonatomic) NSArray *countryArray;

- (IBAction)viewingDetailsButton:(id)sender;
- (IBAction)verifyAction:(id)sender;

@end

