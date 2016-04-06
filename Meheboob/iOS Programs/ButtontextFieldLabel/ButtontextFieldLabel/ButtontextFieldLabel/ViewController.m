//
//  ViewController.m
//  ButtontextFieldLabel
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSString *nameToCahnge;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{              // called when 'return' key pressed. return NO to ignore.
    NSLog(@"Inside textFieldShouldReturn method..");
    [textField resignFirstResponder];
    return YES;
    //return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(id)sender {
    self.nameToCahnge = self.textField.text;
    self.labelField.text = [NSString stringWithFormat:@"Hello %@",self.nameToCahnge];
}
@end
