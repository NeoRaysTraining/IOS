//
//  CommLetterDetails1.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommLetterDetails1 : UIViewController<UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)continueButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *selectTitleButtonOutlet;
- (IBAction)selectTitle:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectCountryButtonOutlet;
- (IBAction)selectCoutry:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerViewToolBar;
- (IBAction)pickerDoneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

//Pickers

@property(strong, nonatomic)NSArray *selectTitle;
@property(strong, nonatomic)NSArray *selectCountry;
@property (weak, nonatomic) IBOutlet UITextField *employeeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *searchByPostCodeField;
@property (weak, nonatomic) IBOutlet UITextField *empAdressTextField;
@property (weak, nonatomic) IBOutlet UITextField *townCityTextField;
@property (weak, nonatomic) IBOutlet UITextField *coutryTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *employeeNumberTextField;

@end
