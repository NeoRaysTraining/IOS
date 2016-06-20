//
//  CommsLetterDetails.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommsLetterDetails : UIViewController<UITextFieldDelegate>
- (IBAction)homeButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *stagingDateTextField;


@property (weak, nonatomic) IBOutlet UILabel *pensionProviderOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lineOutlet;

@property (weak, nonatomic) IBOutlet UITextField *selectPensionProoutlet;

@property (weak, nonatomic) IBOutlet UIButton *continueButtonOutlet;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickeroutlet;
@property (weak, nonatomic) IBOutlet UIToolbar *datePickerToolOutlet;
- (IBAction)datePickerDoneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *selectPensionProviderOutlet;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewDelegate;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBarDelegate;
- (IBAction)pickerDoneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *dateOfCommsOutlet;
@property (weak, nonatomic) IBOutlet UITextField *optOutOutlet;
- (IBAction)continueButton:(id)sender;

@end
