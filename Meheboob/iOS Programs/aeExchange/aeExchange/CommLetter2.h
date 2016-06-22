//
//  CommLetter2.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommLetter2 : UIViewController
- (IBAction)continueButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerViewToolBar;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *pickerViewDoneButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *searchByEmpNameField;
@property (weak, nonatomic) IBOutlet UITextField *empBusinessField;
@property (weak, nonatomic) IBOutlet UITextField *townCityField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UITextField *postCodeField;
@property (weak, nonatomic) IBOutlet UITextField *crnField;

@property (weak, nonatomic) IBOutlet UITextField *employersEmail;

@property (weak, nonatomic) IBOutlet UITextField *commsLetterField;

@property (weak, nonatomic) IBOutlet UITextField *employesrsTelepField;
@property (weak, nonatomic) IBOutlet UIButton *selectCoutryoutlet;


- (IBAction)selectCoutry:(id)sender;


//Picker
@property(strong, nonatomic)NSArray *selectCountry;


- (IBAction)pickerViewDoneButton:(id)sender;




@end
