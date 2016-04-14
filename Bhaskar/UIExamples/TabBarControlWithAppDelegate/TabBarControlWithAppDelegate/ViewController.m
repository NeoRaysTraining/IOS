//
//  ViewController.m
//  TabBarControlWithAppDelegate
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    
    AppDelegate *application=[UIApplication sharedApplication].delegate;
    NSString *str=self.userNameText.text;
    [application setUserName:str];
    
    
    if([self.userNameText.text isEqualToString:@"Bhaskar"] && [self.passwordText.text isEqualToString:@"1234"])
    {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@",self.userNameText.text] message:@"Login successfull" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert1=
        [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"%@",self.userNameText.text] message:@"Login Unsuccessfull" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        
        [alert1 addAction:ok];
        
        [self presentViewController:alert1 animated:YES completion:nil];

    }
    
}

@end
