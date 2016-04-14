//
//  ViewController.h
//  TextFieldUsingDictionary
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)submitButton:(id)sender;

- (IBAction)cancelButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@end

