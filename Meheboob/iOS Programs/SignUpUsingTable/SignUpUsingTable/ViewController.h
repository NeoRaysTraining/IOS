//
//  ViewController.h
//  SignUpUsingTable
//
//  Created by test on 27/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"

@interface ViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{

    UIPickerView * Picker;
    NSArray * CountryArray;
    NSArray * gender;

}

@property(strong, nonatomic)NSArray *fieldNames;
@property(strong, nonatomic)NSMutableArray *fieldValues;
@property(strong, nonatomic)NSDictionary *firstSceneDetails;

@property (weak, nonatomic) IBOutlet UITextField *NameLabel;

@property (weak, nonatomic) IBOutlet UITextField *AgeLabel;

@property (strong, nonatomic) IBOutlet UITextField *GenderLabel;

@property (weak, nonatomic) IBOutlet UITextField *countryLabel;
- (IBAction)switchButton:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *conditionsLabel;
- (IBAction)NextButton:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchButtonOutlet;

@end

