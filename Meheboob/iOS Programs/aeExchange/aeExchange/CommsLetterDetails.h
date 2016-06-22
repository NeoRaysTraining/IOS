//
//  CommsLetterDetails.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommsLetterDetails : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
- (IBAction)homeButton:(id)sender;




@property (weak, nonatomic) IBOutlet UILabel *pensionProviderOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lineOutlet;


@property (weak, nonatomic) IBOutlet UIButton *continueButtonOutlet;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePickeroutlet;
@property (weak, nonatomic) IBOutlet UIToolbar *datePickerToolOutlet;
- (IBAction)datePickerDoneButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewDelegate;

@property (weak, nonatomic) IBOutlet UIToolbar *toolBarDelegate;
- (IBAction)pickerDoneButton:(id)sender;

- (IBAction)continueButton:(id)sender;
- (IBAction)stagingDateButton:(id)sender;
- (IBAction)dateOnCommsButton:(id)sender;
- (IBAction)optOutEndDate:(id)sender;

- (IBAction)selectPensionProviderButton:(id)sender;
- (IBAction)selectCountryButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *pensionProviderNameField;
@property (weak, nonatomic) IBOutlet UITextField *pensionProviderAdreeField;
@property (weak, nonatomic) IBOutlet UITextField *townCityField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;

@property (weak, nonatomic) IBOutlet UITextField *postCodeField;

@property (weak, nonatomic) IBOutlet UITextField *pensionProviderEmailIdField;

@property (weak, nonatomic) IBOutlet UITextField *pensionProviderTelephoneNumberField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *stagingButtonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *dateOnCommsLetterButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *outOptButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *pensionProviderButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *selectCoutryOutlet;

//Pickers

@property(strong,nonatomic)NSArray *selectPensionProviderArray;
@property(strong,nonatomic)NSArray *selectCountryArray;
@end
