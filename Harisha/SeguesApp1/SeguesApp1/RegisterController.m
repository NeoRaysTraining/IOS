//
//  RegisterController.m
//  SeguesApp1
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.personDetails =[[NSMutableDictionary alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)registerButton:(id)sender
{
    
    self.personDetails = [NSMutableDictionary dictionaryWithObject:self.nameField.text forKey:self.passwordField.text];
    
    NSLog(@"%@",self.personDetails);
}

@end
