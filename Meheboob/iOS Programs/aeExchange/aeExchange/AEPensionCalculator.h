//
//  AEPensionCalculator.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 15/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEPensionCalculator : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *payFrequencyOutlet;

- (IBAction)homeButton:(id)sender;
- (IBAction)calculateButton:(id)sender;
- (IBAction)payFrequencyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerToolBar;
- (IBAction)pickerViewDoneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *calculateButtonOutlet;

//PickerArrays
@property(strong, nonatomic)NSArray *payFrequency;
@property(strong, nonatomic)NSArray *taxReliefArrangement;
@property(strong, nonatomic)NSArray *selectEarningBasis;
@property(strong, nonatomic)NSArray *genders;




@property (weak, nonatomic) IBOutlet UIButton *taxReliefArragemetOutlet;
- (IBAction)taxReliefArrangement:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *selectEarningBasisOutlet;
- (IBAction)selectEarningBasis:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectTheGenderOutlet;
- (IBAction)selectGender:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *employerTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeTextField;
@property (weak, nonatomic) IBOutlet UIButton *dateOfBirtOulet;
- (IBAction)dateOfBirth:(id)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)datePickerDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *datePickerToolBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *pensionableEarningTextField;
@property (weak, nonatomic) IBOutlet UITextField *avcTextField;

@end
