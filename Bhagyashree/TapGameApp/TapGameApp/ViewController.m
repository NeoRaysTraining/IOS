//
//  ViewController.m
//  TapGameApp
//
//  Created by test on 4/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *enterTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property NSString *enterValue;
@property (weak, nonatomic) IBOutlet UIButton *pressButton;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   //  Do any additional setup after loading the view, typically from a nib.

    [self.messageLabel setHidden:YES];
    [self.resultLabel setHidden:YES];
    [self.pressButton setHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.enterValue = self.enterTextField.text;
    [self.messageLabel setHidden:NO];
    [self.pressButton setHidden:NO];
    [self.messageLabel setText:[NSString stringWithFormat:@"Tap Button %@ times",self.enterValue]];
    [self.enterTextField setKeyboardType:UIKeyboardTypeDefault];
    [self.enterTextField setHidden:YES];
    return YES;
}


static int flag=0;
static int taps=0;
- (IBAction)pressButton:(id)sender {
    flag=1;
    taps++;
    int var;
    var = [_enterValue intValue];
   if(taps==var)
    {
        [self.messageLabel setHidden:YES];
        [self.pressButton setHidden:YES];
        [self.enterTextField setHidden:YES];
        [self.resultLabel setHidden:NO];
        [self.resultLabel setText:@"YOU WON"];
        taps=0;
        flag=0;
    }
}
@end
