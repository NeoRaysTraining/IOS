//
//  ViewController.m
//  TextFieldDemo
//
//  Created by test on 4/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *userName;
    NSString *password;
    NSArray *arrayUserName;
    NSArray *arrayPassword;
    NSDictionary *dictLoginCredentials;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dictLoginCredentials=[[NSDictionary alloc]initWithObjectsAndKeys:@"bhagya",@"111",@"bhaskar",@"222",@"raghu",@"333", nil];
    arrayUserName=[[NSArray alloc]init];
    arrayPassword=[[NSArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
// return NO to disallow editing.
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    // became first responder
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    NSLog(@"textFieldShouldEndEditing");
    //[_passwordTextField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES calle
    NSLog(@"textFieldDidEndEditing");
    
    
//    userName=_userNameTextField.text;
//    password=_passwordTextField.text;
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    // called when clear button pressed. return NO to ignore (no notifications)
    NSLog(@"textFieldShouldClear:");
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}

- (IBAction)loginBtn:(id)sender {
    
    
//[_passwordTextField resignFirstResponder];
    NSString *un=_userNameTextField.text;
    NSString *pwd=_passwordTextField.text;
    
//        for(id item in dictLoginCredentials)
//        {
//            
//            //amogh sir's code
//            [arrayUserName addObject:[dictLoginCredentials objectForKey:item]];
//            //arrayUserName = [dict allValues];
//            //NSArray *arrayPassword=item;
//            [arrayPassword addObject:item];
//            NSLog(@"%@",arrayPassword);
//            if([[arrayUserName objectAtIndex:0] isEqualToString:un] && [[arrayPassword objectAtIndex:0] isEqualToString:pwd])
//            {
//                self.view.backgroundColor=[UIColor greenColor];
//                break;
//            }
//            else
//            {
//                self.view.backgroundColor=[UIColor redColor];
//            }
//
//        }
    
    arrayUserName=[dictLoginCredentials allValues];
    arrayPassword=[dictLoginCredentials allKeys];
    
    for (int i=0; i<[arrayUserName count]; i++) {
        if(([[arrayUserName objectAtIndex:i] isEqualToString:un]) && ([[arrayPassword objectAtIndex:i] isEqualToString:pwd]))
        {
            self.view.backgroundColor= [UIColor greenColor];
            break;
        }
        
    }
    
    
    
}
@end
