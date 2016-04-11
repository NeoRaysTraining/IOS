//
//  ViewController.m
//  HelloWorld
//
//  Created by test on 4/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *fnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emaiLabel;

@property (weak, nonatomic) IBOutlet UITextField *fnameText;
@property (weak, nonatomic) IBOutlet UITextField *emialText;
@property (weak, nonatomic) IBOutlet UITextField *lnameText;
@property NSString *fnamevar;
@property NSString *lnamevar;
@property NSString *emailvar;
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
- (IBAction)enterButton:(id)sender
{
    
    self.fnameLabel.text = [NSString stringWithFormat:@"your First name is %@\n",self.fnamevar];
    
    self.lnameLabel.text = [NSString stringWithFormat:@"your Last Name is %@\n", self.lnamevar];
    
    self.emaiLabel.text = [NSString stringWithFormat:@"your Email id is %@\n",self.emailvar];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    self.fnamevar = self.fnameText.text;
    
    self.lnamevar = self.lnameText.text;
    
    self.emailvar = self.emialText.text;
    
    return YES;
}

@end
