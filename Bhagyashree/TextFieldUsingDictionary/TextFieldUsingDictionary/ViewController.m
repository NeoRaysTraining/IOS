//
//  ViewController.m
//  TextFieldUsingDictionary
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
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender {
    NSMutableDictionary *employeeDetails = [NSMutableDictionary dictionaryWithDictionary:@{
                                                            @"Bhagya":@"PW1",
                                                                                           @"Bhaskar":@"PW2",
                                                                                           @"Nadaf":@"PW3",
                                                                                           @"Raghu":@"PW4",
                                                                                           @"Harish":@"PW5"}];
    
    //CODE FOR VALIDATING USER NAME AND PASSWORD TO LOGIN AND ALSO CHANGES VIEW COLOUR
    
//    if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:@"Bhagya"]])
//    {
//        [self.view setBackgroundColor:[UIColor purpleColor]];
//               _messageLabel.text=@"LOGIN SUCCESSFUL";
//    }
//    else if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:@"Bhaskar"]])
//    {
//        [self.view setBackgroundColor:[UIColor orangeColor]];
//               _messageLabel.text=@"LOGIN SUCCESSFUL";
//    }
//    else if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:@"Nadaf"]])
//    {
//        [self.view setBackgroundColor:[UIColor greenColor]];
//               _messageLabel.text=@"LOGIN SUCCESSFUL";
//    }
//    else if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:@"Raghu"]])
//    {
//        [self.view setBackgroundColor:[UIColor blueColor]];
//               _messageLabel.text=@"LOGIN SUCCESSFUL";
//    }
//    else if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:@"Harish"]])
//    {
//        [self.view setBackgroundColor:[UIColor brownColor]];
//        _messageLabel.text=@"LOGIN SUCCESSFUL";
//    }
//    else
//    {
//        _messageLabel.text=@"LOGIN UNSUCCESSFUL";
//    }
//
    
    
    //REDUCED CODE TO VALIDATE USERNAME AND PASSWORD AND DISPLAYS THE LOGIN MESSAGE
        if([_passwordTextField.text isEqualToString:[employeeDetails objectForKey:_usernameTextField.text]]){
            
            _messageLabel.text=@"LOGIN SUCCESSFUL";
        }
        else
        {
            _messageLabel.text=@"LOGIN UNSUCCESSFUL";
        }
}

- (IBAction)cancelButton:(id)sender {
    _usernameTextField.text=nil;
    _passwordTextField.text=nil;
}
@end
