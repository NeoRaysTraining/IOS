//
//  ViewController.m
//  AlertView
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertbutton:(id)sender
{
    UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Hi ur welcome" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"cancel", nil];
    
    [view show];
}
@end
