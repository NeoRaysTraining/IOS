//
//  QuickAECaluclatorViewController.h
//  AEExchange
//
//  Created by test on 6/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#define kOFFSET_FOR_KEYBOARD 80.0

@interface QuickAECaluclatorViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *pensionableEarnings;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *empContributionRate;
- (IBAction)payFrequencyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *employeecontRate;
- (IBAction)genderButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *avc;
@property (weak, nonatomic) IBOutlet UIButton *payFrequencyButton;

@property (weak, nonatomic) IBOutlet UIToolbar *pickerViewToolBar;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *caluclate;
@property (weak, nonatomic) IBOutlet UIToolbar *datePickerToolBar;
- (IBAction)dateofBirth:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *genderButton;
@property (weak, nonatomic) IBOutlet UIButton *earningBasis;
@property (weak, nonatomic) IBOutlet UIButton *taxReliefArrange;
- (IBAction)taxReliefArrange:(id)sender;

- (IBAction)earningBasis:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *dateofBirth;

- (IBAction)datePickerDone:(id)sender;

- (IBAction)customPicDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *netPayArrangements;

@property(nonatomic,strong)NSArray *FreqperiodPickerArray;
@property(nonatomic,strong)NSArray* taxRelief;
@property(nonatomic,strong)NSArray* earningBasisArray;
@property(nonatomic,strong)NSArray* gender;

@property(strong,nonatomic)NSDictionary* allValues;
@property(strong,nonatomic)NSString* frequencyPeriodString;
@property(strong,nonatomic)NSString* taxReliefString;
@property(strong,nonatomic)NSString* earningBasisString;
@property(strong,nonatomic)NSString* genderString;

@end
