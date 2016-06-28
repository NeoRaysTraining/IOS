//
//  PensionSchemeVC.h
//  AEExchange
//
//  Created by test on 6/21/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface PensionSchemeVC : ViewController
- (IBAction)continue1Button:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *continue1;
- (IBAction)selectPensionProvider:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIButton *statgingDate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pickerDone;
- (IBAction)pickerDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIStackView *pensionProviderStackView;
@property(strong,nonatomic)NSArray* selectProvider;
@property (weak, nonatomic) IBOutlet UIButton *stagingDate;
@property (weak, nonatomic) IBOutlet UIButton *dateOfCommLett;
@property (weak, nonatomic) IBOutlet UIButton *optOutEndDate;

@property (weak, nonatomic) IBOutlet UIToolbar *dateToolBar;
- (IBAction)dateOnCommlett:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *datePickerDone;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)stagingDate:(id)sender;
- (IBAction)optOutEndDate:(id)sender;
- (IBAction)datePickerDone:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *provideNameField;
@property (weak, nonatomic) IBOutlet UITextField *providerAddress;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *postalCode;
@property (weak, nonatomic) IBOutlet UITextField *emailidField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@property(strong,nonatomic)NSArray* pensionProviderDeatails;
@property (weak, nonatomic) IBOutlet UIButton *continue2;
- (IBAction)continue2Button:(id)sender;
@property(strong,nonatomic)NSString* providerString;
@end
