//
//  ViewController.m
//  TextFieldDemo
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // return NO to disallow editing.
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // became first responder
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    NSLog(@"textFieldShouldEndEditing");
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    NSLog(@"textFieldDidEndEditing");
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    // called when clear button pressed. return NO to ignore (no notifications)
    NSLog(@"textFieldShouldClear");
    return NO;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // called when 'return' key pressed. return NO to ignore.
    NSLog(@"textFieldShouldReturn");
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    {
    // Do any additional setup after loading the view, typically from a nib.
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender {
    
    NSString *username1 = @"bhagya";
    
    NSString *password1 = @"1111";
    
    NSString *username2 = _usernameTextField.text;
    
    NSString *password2 = _passwordTextField.text;
    
    if(([username1 isEqualToString:username2])&&([password1 isEqualToString:password2]))
    {
        [self.view setBackgroundColor:[UIColor lightGrayColor]];
        [_messageLabel setText:@"Login Successful"];
    }
    else{
        [self.view setBackgroundColor:[UIColor redColor]];
        [_messageLabel setText:@"Login Unsuccessful"];
    }
    




}

- (IBAction)cancelButton:(id)sender {
    _usernameTextField.text=nil;
    _passwordTextField.text=nil;
}
@end
