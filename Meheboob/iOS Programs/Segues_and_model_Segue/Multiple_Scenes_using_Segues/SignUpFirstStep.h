//
//  SignUpFirstStep.h
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface SignUpFirstStep : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberField;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;

- (IBAction)nextButton:(id)sender;


@property(strong, nonatomic)NSMutableArray *signUpFields;

@property(strong, nonatomic) NSMutableDictionary *usersDetails;

@end
