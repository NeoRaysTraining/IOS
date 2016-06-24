//
//  EmployerCommLetterVc.h
//  AEExchange
//
//  Created by test on 6/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface EmployerCommLetterVc : ViewController
@property (weak, nonatomic) IBOutlet UIButton *countryName;
- (IBAction)selectCountry:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
- (IBAction)pickerDone:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *pickerToolbar;
@property(strong,nonatomic)NSArray* countryDetails;
@property(strong,nonatomic)NSString* countryString;
@end
