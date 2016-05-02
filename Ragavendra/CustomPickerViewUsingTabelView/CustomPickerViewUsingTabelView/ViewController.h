//
//  ViewController.h
//  CustomPickerViewUsingTabelView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController :UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

{
    UIPickerView * picker;
    NSArray * country;
    NSArray *gender;

}

@property (weak, nonatomic) IBOutlet UITextField *nameField;


@property (weak, nonatomic) IBOutlet UITextField *ageField;



@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (weak, nonatomic) IBOutlet UITextField *countryField;


@property (weak, nonatomic) IBOutlet UISwitch *switchOutletOnOff;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButtonOutlet;





- (IBAction)nextButton:(id)sender;




- (IBAction)tapGestureButton:(id)sender;





@end

