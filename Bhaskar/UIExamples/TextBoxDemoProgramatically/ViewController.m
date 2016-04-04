//
//  ViewController.m
//  TextBoxDemoProgramatically
//
//  Created by test on 4/2/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addTextField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addTextField
{
//    UILabel *userNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 30, 280, 30)];
//    userNameLabel.text=@"User Name";
//    [userNameLabel setFont:[UIFont boldSystemFontOfSize:14]];
//    [userNameLabel sizeToFit];
    
    UITextField *userNameText=[[UITextField alloc]initWithFrame:CGRectMake(20, 50, 1000, 30)];
    userNameText.placeholder=@"User Name";
    //[self.view addSubview:userNameLabel];
    [self.view addSubview:userNameText];
    
}

@end
